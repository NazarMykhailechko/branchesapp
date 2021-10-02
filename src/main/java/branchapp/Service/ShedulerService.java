package branchapp.Service;


import branchapp.dao.BranchDao;
import branchapp.model.BankBranch;
import branchapp.model.BankBranchCount;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@EnableAsync
@Service
public class ShedulerService {

    @Autowired
    BranchDao branchDao;

      @Async
      //@Scheduled(cron = "*/60 * * * * *")
      //@Scheduled(cron = "0 */15 * ? * *")
      @Scheduled(cron = "0 0 14 * * ?")
      //@Scheduled(cron="0 0 9 1 * ?")

    public void refreshData() throws IOException {
          URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_dptlist?json");

          //InputStreamReader reader = new InputStreamReader(url.openStream());
          BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
          Gson gson = new Gson();

          BankBranch[] dto1 = new Gson().fromJson(reader, BankBranch[].class);

          List<BankBranch> bankBranchList = Arrays.asList(dto1);

          Map<String, Long> counting = bankBranchList.stream().filter(b -> b.getDepcode().startsWith("0", 8)
                  || b.getDepcode().startsWith("1", 8)
                  || b.getDepcode().startsWith("2", 8)).collect(
                  Collectors.groupingBy(BankBranch::getGLB, Collectors.counting()));

          StringBuilder sb = new StringBuilder();

          for (Map.Entry<String, Long> entry : counting.entrySet()) {
              sb.append("{'glb':'").append(entry.getKey()).append("','count'").append(":").append(entry.getValue()).append("},");
              //System.out.println("{" + entry.getKey() + ":" + entry.getValue());
          }

          String JSONdata = "[" + sb.substring(0, sb.length() - 1) + "]";

          //System.out.println(JSONdata);

          BankBranchCount[] bbc = new Gson().fromJson(JSONdata, BankBranchCount[].class);
          branchDao.saveAll((Arrays.asList(bbc)));
      }
    }
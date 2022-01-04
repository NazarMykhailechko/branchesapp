package branchapp.Service;


import branchapp.dao.BranchDao;
import branchapp.email.MyConstants;
import branchapp.model.BankBranch;
import branchapp.model.BankBranchCount;
import branchapp.model.BankBranches;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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

/*    @Autowired
    public JavaMailSender emailSender;*/

      @Async
      //@Scheduled(cron = "*/60 * * * * *")
      //@Scheduled(cron = "0 */15 * ? * *")
      @Scheduled(cron = "0 10 4 1 * ?")
      //@Scheduled(cron = "0 0 1 * * ?")
      //@Scheduled(cron="0 0 9 1 * ?")

    public void refreshData() throws IOException {
          //URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_dptlist?json");
          URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_data_branch?json");

          //InputStreamReader reader = new InputStreamReader(url.openStream());
          BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
          Gson gson = new Gson();

          BankBranches[] dto1 = new Gson().fromJson(reader, BankBranches[].class);

          List<BankBranches> bankBranchList = Arrays.asList(dto1);

          Map<String, Long> counting = bankBranchList.stream().filter(b -> (b.getTyp().equals("0")
                  || b.getTyp().equals("1")
                  || b.getTyp().equals("2")) && !b.getTyp().equals("null")).collect(
                  Collectors.groupingBy(BankBranches::getNkb, Collectors.counting()));

          StringBuilder sb = new StringBuilder();

          for (Map.Entry<String, Long> entry : counting.entrySet()) {
              sb.append("{'glb':'").append(entry.getKey()).append("','count'").append(":").append(entry.getValue()).append("},");
              //System.out.println("{" + entry.getKey() + ":" + entry.getValue());
          }

          String JSONdata = "[" + sb.substring(0, sb.length() - 1) + "]";

          //System.out.println(JSONdata);

          BankBranchCount[] bbc = new Gson().fromJson(JSONdata, BankBranchCount[].class);
          branchDao.saveAll((Arrays.asList(bbc)));



/*          // Create a Simple MailMessage.
          SimpleMailMessage message = new SimpleMailMessage();

          message.setTo(MyConstants.FRIEND_EMAIL);
          message.setCc("WIN72007@ukr.net");
          message.setSubject("Мережа");
          message.setText("Кількість відділень банків України (по даним НБУ) " +
                          "https://branchapp.herokuapp.com/");
          // Send Message!
          this.emailSender.send(message);*/
      }
    }
import com.google.gson.Gson;
import branchapp.model.BankBranch;
import branchapp.model.BankBranchCount;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class TestBankBranch {

    public static void main(String[] args) throws IOException {
        System.out.println(new SimpleDateFormat("dd.MM.yyyy").format(new Date()));
/*        URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_dptlist?json");

        //InputStreamReader reader = new InputStreamReader(url.openStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
        Gson gson = new Gson();

        BankBranch[] dto1 = new Gson().fromJson(reader, BankBranch[].class);

        List<BankBranch> bankBranchList = Arrays.asList(dto1);

        Map<String, Long> counting = bankBranchList.stream().filter(b -> b.getDepcode().startsWith("0", 8)
                                                                      || b.getDepcode().startsWith("1", 8)
                                                                      || b.getDepcode().startsWith("2", 8)).collect(
                                                                         Collectors.groupingBy(BankBranch::getGLB, Collectors.counting()));

        System.out.println(counting);

        String json = gson.toJson(counting);

        System.out.println(json);

        StringBuilder sb = new StringBuilder();

        for (Map.Entry<String, Long> entry : counting.entrySet()) {
            sb.append("{'glb':'").append(entry.getKey()).append("','count'").append(":").append(entry.getValue()).append("},");
            //System.out.println("{" + entry.getKey() + ":" + entry.getValue());
        }

        String JSONdata = "[" + sb.substring(0, sb.length() - 1) + "]";

        System.out.println(JSONdata);

        BankBranchCount[] bbc = new Gson().fromJson(JSONdata, BankBranchCount[].class);

        for (BankBranchCount bankBranchCount : bbc) {
            System.out.println(bankBranchCount);
        }*/

    }

}

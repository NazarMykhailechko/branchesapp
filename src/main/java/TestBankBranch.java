import branchapp.model.BankBranches;
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
        //System.out.println(new SimpleDateFormat("dd.MM.yyyy").format(new Date()));
        //URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_dptlist?json");
        URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_data_branch?json");

        //InputStreamReader reader = new InputStreamReader(url.openStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
        Gson gson = new Gson();

        BankBranches[] dto1 = new Gson().fromJson(reader, BankBranches[].class);

        List<BankBranches> bankBranchList = Arrays.asList(dto1);
        //System.out.println(bankBranchList);
        Map<String, Long> counting = bankBranchList.stream().filter(b -> (b.getTyp().equals("0")
                                                                      || b.getTyp().equals("1")
                                                                      || b.getTyp().equals("2")) && !b.getTyp().equals("null")).collect(
                                                                         Collectors.groupingBy(BankBranches::getNkb, Collectors.counting()));

        //System.out.println(counting);

        String json = gson.toJson(counting);

        //System.out.println(json);

        StringBuilder sb = new StringBuilder();

        for (Map.Entry<String, Long> entry : counting.entrySet()) {
            sb.append("{'glb':'").append(entry.getKey()).append("','count'").append(":").append(entry.getValue()).append("},");
            //System.out.println("{" + entry.getKey() + ":" + entry.getValue());
        }

        String JSONdata = "[" + sb.substring(0, sb.length() - 1) + "]";

        //System.out.println(JSONdata);

        BankBranchCount[] bbc = new Gson().fromJson(JSONdata, BankBranchCount[].class);

        for (BankBranchCount bankBranchCount : bbc) {
            System.out.println(bankBranchCount);
        }

    }

}

package branchapp.controller;

import branchapp.dao.BranchDao;
import branchapp.model.BankBranch;
import branchapp.model.BankBranchCount;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class BranchController {

    @Autowired
    BranchDao branchDao;
    @PersistenceContext
    private EntityManager em;

    @RequestMapping("/add")
    public String showNewClientPage(Model model) {
        BankBranchCount bankBranchCount = new BankBranchCount();
        model.addAttribute("voting", bankBranchCount);
        return "new_client";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveClient(@ModelAttribute("voting") BankBranchCount voting) {
        branchDao.save(voting);
        System.out.println(voting);
        return "redirect:/";
    }

    @RequestMapping("/")
    public String home(Model model) throws IOException {

        Query fieldnames = em.createNativeQuery("SELECT distinct left(datetime,10) from bank_branches order by datetime desc");
        List<Object[]> listOfFields = fieldnames.getResultList();
           //Query q = em.createNativeQuery("SELECT * from pivotdata");
           Query q = em.createNativeQuery("{call pivotdata()}");

           List<Object[]> results = q.getResultList();

//        for (Object[] result: results) {
//            //String something = (String)result[1];
//            if (result[1] instanceof BigDecimal)
//             System.out.println((BigDecimal)result[1]);
//            else
//                System.out.println((String)result[1]);
//        }
//        for (Object re : res) {
//            System.out.println(re);
//        }

//        URL url = new URL("https://bank.gov.ua/NBU_BankInfo/get_dptlist?json");
//
//        //InputStreamReader reader = new InputStreamReader(url.openStream());
//        BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
//        Gson gson = new Gson();
//
//        BankBranch[] dto1 = new Gson().fromJson(reader, BankBranch[].class);
//
//        List<BankBranch> bankBranchList = Arrays.asList(dto1);
//
//        Map<String, Long> counting = bankBranchList.stream().filter(b -> b.getDepcode().startsWith("0", 8)
//                || b.getDepcode().startsWith("1", 8)
//                || b.getDepcode().startsWith("2", 8)).collect(
//                Collectors.groupingBy(BankBranch::getGLB, Collectors.counting()));
//
//        StringBuilder sb = new StringBuilder();
//
//        for (Map.Entry<String, Long> entry : counting.entrySet()) {
//            sb.append("{'glb':'").append(entry.getKey()).append("','count'").append(":").append(entry.getValue()).append("},");
//            //System.out.println("{" + entry.getKey() + ":" + entry.getValue());
//        }
//
//        String JSONdata = "[" + sb.substring(0, sb.length() - 1) + "]";
//
//        //System.out.println(JSONdata);
//
//        BankBranchCount[] bbc = new Gson().fromJson(JSONdata, BankBranchCount[].class);
//        branchDao.saveAll((Arrays.asList(bbc)));
//        for (BankBranchCount bankBranchCount : bbc) {
//            branchDao.save(bankBranchCount);
//            System.out.println(bankBranchCount);
//        }

        //model.addAttribute("listOfVotes", branchDao.findAll());
        model.addAttribute("listOfVotes", results);
        model.addAttribute("listOfFields", listOfFields);
        //BankBranchCount bankBranchCount = new BankBranchCount();
        //model.addAttribute("voting", bankBranchCount);

/*        for (Voting vt : votingDao.findAll()) {
            System.out.print(vt.toString());
        }

        model.addAttribute("listOfQuestions", votingDao.findAll());*/

        return "index";
    }

    @RequestMapping("/results")
    public String results(Model model) {

        for (BankBranchCount vt : branchDao.findAll()) {
            System.out.print(vt.toString());
        }

        model.addAttribute("listOfVotes", branchDao.findAll());
        return "results";
    }

    @RequestMapping("/data")
    public String data(Model model) {

        return "data";
    }

}

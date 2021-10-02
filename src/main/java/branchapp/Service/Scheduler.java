package branchapp.Service;

import branchapp.dao.BranchDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.IOException;
import java.util.List;

@EnableAsync
@Service
public class Scheduler {

    @PersistenceContext
    private EntityManager em;

    @Async
    //@Scheduled(cron = "*/60 * * * * *")
    @Scheduled(cron = "0 */55 9 ? * *")
    //@Scheduled(cron = "0 0 9 * * ?")
    //@Scheduled(cron="0 0 9 1 * ?")

    public void refresh() {

        Query fieldnames = em.createNativeQuery("SELECT distinct left(datetime,10) from bank_branches order by datetime desc");
        List<Object[]> listOfFields = fieldnames.getResultList();
        //Query q = em.createNativeQuery("SELECT * from pivotdata");
        Query q = em.createNativeQuery("{call pivotdata()}");

        List<Object[]> results = q.getResultList();

    }
}

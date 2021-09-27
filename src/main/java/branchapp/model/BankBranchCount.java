package branchapp.model;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "BankBranches")
@NamedQuery(name="BankBranchCount.Print",query = "Select v From BankBranchCount as v")
public class BankBranchCount {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "glb", nullable = false)
    private String glb;
    @Column(name = "count", nullable = false)
    private int count;
    //@Column(name = "datetime", columnDefinition = "DATE DEFAULT (DATE_FORMAT(NOW(), '%Y-%m-%d'))")
    //@Column(name = "datetime")
    //private String datetime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    @Column(name = "datetime", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private String datetime = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());

    public BankBranchCount() {
    }

    public BankBranchCount(long id, String glb, int count, String datetime) {
        this.id = id;
        this.glb = glb;
        this.count = count;
        this.datetime = datetime;
    }

    public long getId() {
        return id;
    }

    public String getGlb() {
        return glb;
    }

    public void setGlb(String glb) {
        this.glb = glb;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    @Override
    public String toString() {
        return "BankBranchCount{" +
                "id=" + id +
                ", glb='" + glb + '\'' +
                ", count=" + count +
                ", datetime='" + datetime + '\'' +
                '}';
    }
}

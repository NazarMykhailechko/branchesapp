package branchapp.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.Objects;


public class BankBranch {

    @SerializedName("DEPCODE")
    @Expose
    private String depcode;
    @SerializedName("NAMEF")
    @Expose
    private String namef;

    /**
     * No args constructor for use in serialization
     *
     */
    public BankBranch() {
    }

    /**
     *
     * @param namef
     * @param depcode
     */
    public BankBranch(String depcode, String namef) {
        super();
        this.depcode = depcode;
        this.namef = namef;
    }

    public String getDepcode() {
        return depcode;
    }

    public void setDepcode(String depcode) {
        this.depcode = depcode;
    }

    public String getNamef() {
        return namef;
    }

    public void setNamef(String namef) {
        this.namef = namef;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BankBranch that = (BankBranch) o;

        if (!Objects.equals(depcode, that.depcode)) return false;
        return Objects.equals(namef, that.namef);
    }

    @Override
    public int hashCode() {
        int result = depcode != null ? depcode.hashCode() : 0;
        result = 31 * result + (namef != null ? namef.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "BankBranch{" +
                "depcode='" + depcode + '\'' +
                ", namef='" + namef + '\'' +
                '}';
    }

    public String getGLB (){
        return getDepcode().substring(0,3);
    }
}
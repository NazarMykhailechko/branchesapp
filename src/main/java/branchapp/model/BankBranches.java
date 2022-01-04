package branchapp.model;

import javax.annotation.Generated;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class BankBranches {

    @SerializedName("GLMFO")
    @Expose
    private Integer glmfo;
    @SerializedName("N_GOL")
    @Expose
    private String nGol;
    @SerializedName("NAME_E")
    @Expose
    private String nameE;
    @SerializedName("KOD_EDRPOU")
    @Expose
    private String kodEdrpou;
    @SerializedName("SHORTNAME")
    @Expose
    private String shortname;
    @SerializedName("NKB")
    @Expose
    private String nkb;
    @SerializedName("TYP")
    @Expose
    private String typ;
    @SerializedName("KU")
    @Expose
    private String ku;
    @SerializedName("N_OBL")
    @Expose
    private String nObl;
    @SerializedName("DEPCODE")
    @Expose
    private Object depcode;
    @SerializedName("P_IND")
    @Expose
    private String pInd;
    @SerializedName("TNP")
    @Expose
    private String tnp;
    @SerializedName("NP")
    @Expose
    private String np;
    @SerializedName("ADRESS")
    @Expose
    private String adress;
    @SerializedName("KODT")
    @Expose
    private String kodt;
    @SerializedName("TELEFON")
    @Expose
    private Object telefon;
    @SerializedName("KSTAN")
    @Expose
    private String kstan;
    @SerializedName("N_STAN")
    @Expose
    private String nStan;
    @SerializedName("D_STAN")
    @Expose
    private Object dStan;
    @SerializedName("D_OPEN")
    @Expose
    private String dOpen;
    @SerializedName("D_CLOSE")
    @Expose
    private Object dClose;
    @SerializedName("STAN_GOL")
    @Expose
    private String stanGol;
    @SerializedName("NSTAN_GOL")
    @Expose
    private String nstanGol;
    @SerializedName("MFO")
    @Expose
    private Integer mfo;
    @SerializedName("IDNBU")
    @Expose
    private String idnbu;
    @SerializedName("UNIQ_NUM")
    @Expose
    private Object uniqNum;

    public Integer getGlmfo() {
        return glmfo;
    }

    public void setGlmfo(Integer glmfo) {
        this.glmfo = glmfo;
    }

    public String getNGol() {
        return nGol;
    }

    public void setNGol(String nGol) {
        this.nGol = nGol;
    }

    public String getNameE() {
        return nameE;
    }

    public void setNameE(String nameE) {
        this.nameE = nameE;
    }

    public String getKodEdrpou() {
        return kodEdrpou;
    }

    public void setKodEdrpou(String kodEdrpou) {
        this.kodEdrpou = kodEdrpou;
    }

    public String getShortname() {
        return shortname;
    }

    public void setShortname(String shortname) {
        this.shortname = shortname;
    }

    public String getNkb() {
        return nkb;
    }

    public void setNkb(String nkb) {
        this.nkb = nkb;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public String getKu() {
        return ku;
    }

    public void setKu(String ku) {
        this.ku = ku;
    }

    public String getNObl() {
        return nObl;
    }

    public void setNObl(String nObl) {
        this.nObl = nObl;
    }

    public Object getDepcode() {
        return depcode;
    }

    public void setDepcode(Object depcode) {
        this.depcode = depcode;
    }

    public String getPInd() {
        return pInd;
    }

    public void setPInd(String pInd) {
        this.pInd = pInd;
    }

    public String getTnp() {
        return tnp;
    }

    public void setTnp(String tnp) {
        this.tnp = tnp;
    }

    public String getNp() {
        return np;
    }

    public void setNp(String np) {
        this.np = np;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getKodt() {
        return kodt;
    }

    public void setKodt(String kodt) {
        this.kodt = kodt;
    }

    public Object getTelefon() {
        return telefon;
    }

    public void setTelefon(Object telefon) {
        this.telefon = telefon;
    }

    public String getKstan() {
        return kstan;
    }

    public void setKstan(String kstan) {
        this.kstan = kstan;
    }

    public String getNStan() {
        return nStan;
    }

    public void setNStan(String nStan) {
        this.nStan = nStan;
    }

    public Object getDStan() {
        return dStan;
    }

    public void setDStan(Object dStan) {
        this.dStan = dStan;
    }

    public String getDOpen() {
        return dOpen;
    }

    public void setDOpen(String dOpen) {
        this.dOpen = dOpen;
    }

    public Object getDClose() {
        return dClose;
    }

    public void setDClose(Object dClose) {
        this.dClose = dClose;
    }

    public String getStanGol() {
        return stanGol;
    }

    public void setStanGol(String stanGol) {
        this.stanGol = stanGol;
    }

    public String getNstanGol() {
        return nstanGol;
    }

    public void setNstanGol(String nstanGol) {
        this.nstanGol = nstanGol;
    }

    public Integer getMfo() {
        return mfo;
    }

    public void setMfo(Integer mfo) {
        this.mfo = mfo;
    }

    public String getIdnbu() {
        return idnbu;
    }

    public void setIdnbu(String idnbu) {
        this.idnbu = idnbu;
    }

    public Object getUniqNum() {
        return uniqNum;
    }

    public void setUniqNum(Object uniqNum) {
        this.uniqNum = uniqNum;
    }

    @Override
    public String toString() {
        return "BankBranches{" +
                "glmfo=" + glmfo +
                ", nGol='" + nGol + '\'' +
                ", nameE='" + nameE + '\'' +
                ", kodEdrpou='" + kodEdrpou + '\'' +
                ", shortname='" + shortname + '\'' +
                ", nkb='" + nkb + '\'' +
                ", typ='" + typ + '\'' +
                ", ku='" + ku + '\'' +
                ", nObl='" + nObl + '\'' +
                ", depcode=" + depcode +
                ", pInd='" + pInd + '\'' +
                ", tnp='" + tnp + '\'' +
                ", np='" + np + '\'' +
                ", adress='" + adress + '\'' +
                ", kodt='" + kodt + '\'' +
                ", telefon=" + telefon +
                ", kstan='" + kstan + '\'' +
                ", nStan='" + nStan + '\'' +
                ", dStan=" + dStan +
                ", dOpen='" + dOpen + '\'' +
                ", dClose=" + dClose +
                ", stanGol='" + stanGol + '\'' +
                ", nstanGol='" + nstanGol + '\'' +
                ", mfo=" + mfo +
                ", idnbu='" + idnbu + '\'' +
                ", uniqNum=" + uniqNum +
                '}';
    }
}

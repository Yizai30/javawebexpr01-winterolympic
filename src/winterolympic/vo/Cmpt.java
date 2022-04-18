package winterolympic.vo;

public class Cmpt {
    private String uid;
    private String cmptName;
    private String time;
    private String place;

    public Cmpt() {
    }

    public Cmpt(String uid, String cmptName, String time, String place) {
        this.uid = uid;
        this.cmptName = cmptName;
        this.time = time;
        this.place = place;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getCmptName() {
        return cmptName;
    }

    public void setCmptName(String cmptName) {
        this.cmptName = cmptName;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    @Override
    public String toString() {
        return "Cmpt{" +
                "uid='" + uid + '\'' +
                ", cmptName='" + cmptName + '\'' +
                ", time='" + time + '\'' +
                ", place='" + place + '\'' +
                '}';
    }
}

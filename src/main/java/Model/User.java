package Model;

public class User {
    private String userName, password, college;
    private int StudentID;

    User(String userName, String password, String college) {
        this.userName = userName;
        this.password = password;
        this.college = college;
    }

    public String getUserName() {
        return userName;
    }
    public String getPassword() {
        return password;
    }
    public String getCollege() {
        return college;
    }
    public int getStudentID() { return StudentID; }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setCollege(String college) {
        this.college = college;
    }
    public void setStudentID(int ID) {
        this.StudentID = ID;
    }
}

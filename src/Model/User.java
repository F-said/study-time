package Model;

public class User {
    private String userName, password, college;
    private int StudentID;

    public User(String userName, String password, String college) {
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

    void setUserName(String userName) {
        this.userName = userName;
    }
    void setPassword(String password) {
        this.password = password;
    }
    void setCollege(String college) {
        this.college = college;
    }
}

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Register {
    Register(String user, String password, String college) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://35.188.254.244:3306/studytime","root","T1konder0ga");
            Statement st = con.createStatement();

            try {
                Statement statement = con.createStatement();
                ResultSet resultSet = statement.executeQuery("SHOW TABLES");
                while (resultSet.next()) {
                    System.out.println(resultSet.getString(1));
                }
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class practiceconnect {
    public static void main(String[] args) throws IOException, SQLException, ClassNotFoundException {
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

        /*
        // The instance connection name can be obtained from the instance overview page in Cloud Console
        // or by running "gcloud sql instances describe <instance> | grep connectionName".
        String instanceConnectionName = "studytime-200802:us-east4:sqlstudy";

        // The database from which to list tables.
        String databaseName = "studytime";

        String username = "root";

        // This is the password that was set via the Cloud Console or empty if never set
        // (not recommended).
        String password = "T1konder0ga";

        String jdbcUrl = String.format(
                "jdbc:mysql://google/%s?cloudSqlInstance=%s&"
                        + "socketFactory=com.google.cloud.sql.mysql.SocketFactory",
                databaseName,
                instanceConnectionName);

        Connection connection = DriverManager.getConnection(jdbcUrl, username, password);

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SHOW TABLES");
            while (resultSet.next()) {
                System.out.println(resultSet.getString(1));
            }
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        */
    }
}


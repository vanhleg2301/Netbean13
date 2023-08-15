package model;
import java.util.*;
public class UserDAO extends MyDAO {

  public List<User> getUsers() {
    List<User> t = new ArrayList<>();
    xSql = "select * from Users";
    try {
      ps = con.prepareStatement(xSql);
      rs = ps.executeQuery();
      String xName,xPass; int xRole;
      User x;
      while(rs.next()) {
        xName = rs.getString("name");  
        xPass = rs.getString("pass");  
        xRole = rs.getInt("role");
        x = new User(xName,xPass,xRole);
        t.add(x);
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
    return(t);
  }
      
   public User getUser(String xName, String xPass) {
      xSql = "select * from Users where name = ? and pass = ?";

      int xRole;
      User x = null;
      try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, xName);
        ps.setString(2, xPass);
        rs = ps.executeQuery();
        /* The cursor on the rs after this statement is in the BOF area, i.e. it is before the first record.
         Thus the first rs.next() statement moves the cursor to the first record
        */

      if(rs.next()) { 
        xRole = rs.getInt("role");
        x = new User(xName,xPass,xRole);
       }
       else
         x = null; 
       rs.close();
       ps.close();
      }
       catch(Exception e) {
      }
     return(x); 
   } 

}

package model;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;

public class PersonDAO extends MyDAO {

  public List<Person> getPersonList() { 
    List<Person> t = new ArrayList<Person>();
    xSql = "select * from Person";
    try {
      ps = con.prepareStatement(xSql);
      rs = ps.executeQuery();
      String xId,xName; Date xDob;
      Person x;
      while(rs.next()) {
        xId = rs.getString("id");  
        xName = rs.getString("name");  
        xDob = rs.getDate("dob");
        x = new Person(xId,xName,xDob);
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

  public Person getPerson(String xId) {
    if(xId==null || xId.trim().equals("")) return(null);  
    Person x = null;
    xSql = "select * from Person where id = ?";
    try {
      ps = con.prepareStatement(xSql);
      ps.setString(1, xId);
      rs = ps.executeQuery();
      String xName; Date xDob;
      if(rs.next()) {
        xId = rs.getString("id");  
        xName = rs.getString("name");  
        xDob = rs.getDate("dob");
        x = new Person(xId,xName,xDob);
      }
      rs.close();
      ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
     return(x);
  }

    public String insert(Person x) {
     xSql = "insert into Person (id,name,dob) values (?,?,?)"; 
     java.sql.Date xDob = (java.sql.Date) x.getDob(); 
     try {
      ps = con.prepareStatement(xSql);
      ps.setString(1, x.getId());
      ps.setString(2, x.getName());
      ps.setDate(3, xDob);
      ps.executeUpdate();
      ps.close();
     }     
     catch(Exception e) {
        return(e.getMessage());
     }
     return("Ok");
  }

  public void updateById(Person x) {
     xSql = "update Person set name=?, dob=? where id=?";
     java.sql.Date xDob = new java.sql.Date(x.getDob().getTime()); 
     try {      
        ps = con.prepareStatement(xSql);
        ps.setString(1, x.getName());
        ps.setDate(2, xDob);
        ps.setString(3, x.getId());
        ps.executeUpdate();
        ps.close();
     }
      catch(Exception e) {
        e.printStackTrace();
      }
     return;
  }

  public void deleteById(String xId) {
     xSql = "delete from Person where id=?";
     try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, xId);
        ps.executeUpdate();
        ps.close();
     }
     catch(Exception e) {
        e.printStackTrace();
     }
  }

}

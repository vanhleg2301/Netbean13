import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class MyLib {
     
  //to yyyy-mm-dd (html5 date)
  public static String toYMD(String s) {
    s = s.trim();
    String [] a = s.split("[ /-]+");
    int x,y,z;
    x = Integer.parseInt(a[0].trim());
    y = Integer.parseInt(a[1].trim());
    z = Integer.parseInt(a[2].trim());
    String u = "";
    if(x>100) { 
      if(y>12)  //yyyy/dd/mm
       u = a[0] + "/" + a[2] + "/" + a[1];
      else // yyyy/mm/dd
       u = s;
     }
     else {
      if(y>12) // mm/dd/yyyy
       u = a[2] + "/" + a[0] + "/" + a[1];
       else
       u = a[2] + "/" + a[1] + "/" + a[0];
     }
    return(u);      
  }    
  // html5 date yyyy-mm-dd to dd/mm/yyyy 
  public static String ymdToDMY(String sDate1) {
    DateFormat x1 = new SimpleDateFormat("yyyy-mm-dd");
    Date xDate = null;
    try {xDate = x1.parse(sDate1);} catch(Exception e) {}
    DateFormat x2 = new SimpleDateFormat("dd/mm/yyyy");
    String sDate2 =  x2.format(xDate);
    return(sDate2);     
  } 

  public static boolean isValidName(String name) {
    String s = "[A-Z][a-zA-Z ]*";
    return(name.matches(s));
  }

  public static boolean isValidEmail(String email) {
    String s = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
    return(email.matches(s));
  }

}

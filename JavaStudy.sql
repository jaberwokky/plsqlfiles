drop java source "Welcome";

drop java class "Welcome";

create java source named "Welcome"
as
  public class Welcome {
    public static String hello() {
      return "Welcome World";
    } 
  };
  
drop function hello;
  
create function hello
return varchar2
as language java
name 'Welcome.hello() return java.lang.string';

select hello
from dual;

drop java source "Setex";

create or replace java source named "Setex"
as
  public class Setex {
    public static String trySet() {
      String[] el = new String[10];
      
      for (int i=0;i<10;i++)
        el[i] = "element " + i;
            
      String strng = "";
      
      for (String s : el)
        strng += s;
      
      return strng;
    } 
  };

drop function trySet;
  
create function tryset
  return varchar2
as
  language java name 'Setex.trySet() return java.lang.string';

select trySet
from dual;


create or replace java source named "Settt"
as
  import java.util.*;
  
  public class Settt {
    public static String oneSet() {
      Set setA = new HashSet();
      
      setA.add(1);
      setA.add(2);
      setA.add(10);
      setA.add(2);
      setA.add(1);
      
      return setA.toString();
    } 
  };
  
create function oneSet
  return varchar2
as
  language java name 'Settt.oneSet() return java.lang.string';
  
select oneSet
from dual;


create or replace java source named "SetStr"
as
  import java.util.*;
  
  public class SetStr {
    public static String jSet() {
      Set setA = new HashSet();
      
      setA.add("gfdgf");
      setA.add("fdfs");
      setA.add("qwq");
      setA.add("kjh");
      setA.add("qwq");
      
      return setA.toString();
    } 
  };
  
create function jSet
  return varchar2
as
  language java name 'SetStr.jSet() return java.lang.string';
  
select jSet
from dual;

create or replace java source named "SetStrFunc"
as
  import java.util.*;
  
  public class SetStrFunc {
    public static String jSetFunc(String text) {
      
      Set setA = new HashSet();
      
      for (String retval: text.split("-"))
        setA.add(retval);
      
      return setA.toString();
    } 
  };
  
create or replace function jSetFunc(txt in varchar2)
  return varchar2
as
  language java name 'SetStrFunc.jSetFunc(java.lang.String) return java.lang.String';
  
select jSetFunc('a-fd-fhd-fs-f-we-twe-g-sd-g-sd-g-sd-twe-a-fd')
from dual;

create or replace java source named "TwoSets"
as
  import java.util.*;

  public class TwoSets {
    public static string jSetIntersect(String text1, String text2) {

      set setA = new HashSet() ;
      set setB = new HashSet() ;

      for(String retval: text1.split(","))
        setA.add(retval) ;

      for(String retval: text2.split(","))
        setB.add(retval) ;

      Set setC = new HashSet(setA) ;

      setC.retainAll(setB) ;

      return setC.toString() ;
    } 
  };
  
create or replace function jsetintersect(
    txt1 in varchar2,
    txt2 in varchar2)
  return varchar2
as
  language java name
  'TwoSets.jSetIntersect(java.lang.String, java.lang.String) return java.lang.String'
  ;
  
select
  jsetintersect('a,fd,fhd,fs,f,we,twe,g,sd,g,sd,g,sd,twe,a,fd',
  'g,dgd,b,sd,re,hf,vd,ds,we,fd') as inters
from
  dual;

--comment from vim!

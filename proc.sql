declare
  t1 varchar2(100);
  t2 varchar2(100);
begin
  t1 := 'a,fd,fhd,fs,f,we,twe,g,sd,g,sd,g,sd,twe,a,fd';
  t2 := 'g,dgd,b,sd,re,hf,vd,ds,we,fd';
  
  dbms_output.put_line(jsetintersect(t1, t2));
end;
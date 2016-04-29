select * from dual;

select * from all_objects o where o.object_type = 'TABLE';

create table test
  (first_name varchar2(30)
  );

select 1+1 from dual
union all
select 1+3 from dual
union all
select 1+5 from dual
union all
select dbms_random.value(1,1000) from dual;

select dbms_random.string('U', 20) str from dual;

select dbms_random.string('U', 2) || dbms_random.value(1,5) str from dual;

select dbms_random.random from dual;

select round(dbms_random.value(1,1000)) rnum from dual;

describe dual;

describe all_objects;

declare
  inum integer;
begin
  select count(*) into inum from dual;
  dbms_output.put_line(inum+100500);
end;

declare
  query_string varchar2(4000);
  l_table_doesnt_exist exception;
  l_table_too_long exception;
  pragma exception_init(l_table_doesnt_exist, -00942);
  pragma exception_init(l_table_too_long, -00972);
  type table_list is table of varchar2(100);
  dictionaries table_list := table_list('dual', 'dual333', 'dba_object', 'all_tab_cols', 'gdfgfdgdfgfdgfdgfdgdfgfdgfdgfdgfdgfdgfdgfdgfdgfdgfdgfdgfgfgdfgfd');
begin
  for i in dictionaries.first .. dictionaries.last loop 
    begin
      query_string := 'select * from ' || dictionaries(i);
      execute immediate query_string;
      dbms_output.put_line(query_string);
    exception
      when l_table_doesnt_exist then
        dbms_output.put_line('table ' || dictionaries(i) || ' does''t exists');
      when l_table_too_long then
        dbms_output.put_line('table ' || dictionaries(i) || ' too long');
    end;
  end loop;
end;
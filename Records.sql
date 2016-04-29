DECLARE
   type books is record
      (title varchar(50),
       author varchar(50),
       subject varchar(100),
       book_id number);
   type tbooks is table of books;
begin
  dbms_output.put_line('');
end;
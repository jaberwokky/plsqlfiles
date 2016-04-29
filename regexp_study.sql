with
  a as
  (
    select
      '1' as n
    from
      dual
    union all
    select
      '1' as n
    from
      dual
    union all
    select
      '2' as n
    from
      dual
    union all
    select
      '4' as n
    from
      dual
    union all
    select
      '5' as n
    from
      dual
    union all
    select
      '-1' as n
    from
      dual
    union all
    select
      '31' as n
    from
      dual
    union all
    select
      'gd' as n
    from
      dual
    union all
    select
      'fds' as n
    from
      dual
    union all
    select
      '3' as n
    from
      dual
    union all
    select
      '1' as n
    from
      dual
  )
  ,
  b as 
  (
    select
      level as id
    from
      dual
      connect by level < 100
  )
  ,
  c as
  (
    select
      rownum as id,
      a.n
    from
      a
  )
select
  *
from
  c
left outer join b
on
  c.id = b.id
  and to_number(c.n) > 0
  and regexp_like(c.n, '^-?\d+') ;
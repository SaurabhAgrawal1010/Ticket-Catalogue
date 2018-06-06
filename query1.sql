set head off
set feed off
set scan off
select issue_number,';',issue_detail,';',priority,';',created,';',issue_type,';',summary,';',assignee,';',substatus,';@;'
from table_name
order by created desc;


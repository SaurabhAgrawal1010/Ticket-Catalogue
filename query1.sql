set head off
set feed off
set scan off
select stage,';',customer_troublenumber,';',priority,';',created,';',issue_type,proj,';',summary,';',assignee,';',substatus,';',identified_in_version,';',required_for_version,';',stage,';@;'
from jira
order by created desc;


-- number of reitireng employees by title


select e.emp_no,
    e.first_name,
    e.last_name,
    t.title, 
    t.from_date,
    t.to_date
into retirement_titles
from employees as e 
left join titles as t on(e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER by e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;


-- number of employees by most recent job title who are about to retire
select  count(title), title
into retiring_titles
from unique_titles
group by title
order by count DESC;

-----------------------------------------------------------------------------------------------------------------------
--Deliverable 2
---------------------------------------------------------------------------------------------------------------------------

select distinct on(e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
into mentor_eligible
from employees as e
left join dept_emp as de on (e.emp_no= de.emp_no)
left join titles as t on (e.emp_no=t.emp_no)
where (de.to_date='9999-01-01') and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, t.to_date DESC



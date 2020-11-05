--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees e,salaries s
where e.emp_no = s.emp_no
order by e.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
SET DateStyle TO MDY;
create view employees_view as
select first_name,last_name,hire_date::date as hire_date
from employees

select * from employees_view
where extract(year from hire_date) = 1986
order by first_name,last_name

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
create view manager_list as
select * from employees where emp_title_id like 'm%'


select e.emp_no,e.first_name,e.last_name,d.dept_name,d.dept_no
from employees e,dept_manager dm,departments d
where dm.emp_no = e.emp_no and dm.dept_no = d.dept_no
order by e.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no,e.first_name,e.last_name,d.dept_name
from employees e,dept_emp de,departments d
where de.emp_no = e.emp_no and de.dept_no = d.dept_no
order by e.emp_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name,last_name,sex from employees where first_name like 'Hercules%' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no,e.first_name,e.last_name,d.dept_name
from employees e,dept_emp de,departments d
where de.emp_no = e.emp_no and de.dept_no = d.dept_no and d.dept_name = 'Sales'
order by e.emp_no

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,count(last_name) as Last_Name_Frequency from employees 
group by last_name
order by Last_Name_Frequency desc






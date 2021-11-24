-- #### Data Analysis

-- Once you have a complete database, do the following:

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees e
JOIN salaries s
USING (emp_no);


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    
FROM employees e,
where hire_date between '1986/1/1' and '1986/12/31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
    dept_manager,
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name,
FROM dept_emp d
JOIN employees e
USING (emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.dept_name
FROM dept_employees as de
    left join departments as d
    on de.dept_no = d.dept_no
    left join employees as e
    on de.emp_no = e.emp_no;
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
    e.first_name, 
    e.last_name, 
    e.sex,
FROM employees as e
    where e.first_name = 'Hercules' 
    and e.last_name like 'B%';
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name, 
    from employees as e
    left join dept_employees as de on 
    e.emp_no = de.emp_no
    left join departments as d on 
    de.dept_no = d.dept_no
    where d.dept_name = 'Sales';
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name 
    from employees as e
    left join dept_employees as de on 
    e.emp_no = de.emp_no
    left join departments as d on 
    de.dept_no = d.dept_no
    where d.dept_name = 'Sales' or d.dept_name = 'Development';
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*)
as "frequency_of_last_names"
from employees
group by last_name
order by "frequency_of_last_names" desc;
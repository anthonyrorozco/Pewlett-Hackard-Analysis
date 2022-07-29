--CHALLENGE

--TABLE 1 - Retirement Titles table (January 1, 1952 and December 31, 1955).

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.titles,
		t.from_date,
		t.to_date

--INTO retirees_titles
FROM employees AS e
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirees_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.titles

--INTO unique_titles
FROM retirees_titles AS rt
ORDER BY emp_no, to_date DESC;

--Table 3
SELECT COUNT(ut.emp_no), ut.titles
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles
ORDER BY COUNT(titles) DESC;

--Deliverable 2
--Mentorship Eligibility table

SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.titles
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

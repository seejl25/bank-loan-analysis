-- creating table
create table bankloan (
	id int8 primary key,
	address_state varchar(50),
	application_type varchar(50),
	emp_length varchar(50),
	emp_title varchar(50),
	grade varchar(50),
	home_owndership varchar(50),
	issue_date date,
	last_credit_pull_date date,
	last_payment_date date,
	loan_status varchar(50),
	next_payment_date date,
	member_id int8,
	purpose varchar(50),
	sub_grade varchar(50),
	term varchar(50),
	verification_status varchar(50),
	annual_income int8,
	dti float,
	installment float,
	int_rate float,
	loan_amount int8,
	total_acc int8,
	total_payment int8
);

-- alter data type of variables
alter table bankloan
alter column emp_title type varchar(255)	-- some values >50 characters
alter column annual_income type float;		-- some values were floating numbers

-- Viewing imported data, and checking number of entries same as in python
select *
from bankloan;

-- KPI
-- 1. Total Loan Applications
select count(*) as total_loan_applications
from bankloan;

-- 2. MTD Total Loan Applications
select to_char(max(issue_date), 'month yyyy') as mtd, count(id) as total_load_applications 
from bankloan
where date_part('year', issue_date) = (select date_part('year', max(issue_date))
										from bankloan)
and date_part('month', issue_date) = (select date_part('month', max(issue_date))
										from bankloan);

-- 3. Total Funded Amount
select sum(loan_amount) as total_funded_amount
from bankloan;

-- 4. MTD Total Funded Amount
select to_char(max(issue_date), 'month yyyy') as mtd, sum(loan_amount) as total_funded_amount
from bankloan
where date_part('year', issue_date) = (select date_part('year', max(issue_date))
										from bankloan)
and date_part('month', issue_date) = (select date_part('month', max(issue_date))
										from bankloan);

-- 5. Total Amount Received by bank
select sum(total_payment) as total_amount_received
from bankloan;

-- 6. MTD Total Amount Received
select to_char(max(issue_date), 'month yyyy') as mtd, sum(total_payment) as total_payment_received
from bankloan
where date_part('year', issue_date) = (select date_part('year', max(issue_date))
										from bankloan)
and date_part('month', issue_date) = (select date_part('month', max(issue_date))
										from bankloan);

-- 7. Average Interest Rate
select round((avg(int_rate)*100)::numeric ,2) as avg_int_rate	-- ROUND() requires numeric, real or double precision value, not floating numbers
from bankloan;

-- 8. Average Debt-To-Income Ratio
select round((avg(dti)*100)::numeric, 2) as avg_dti
from bankloan;

-- Good Loan (loan applications, loan applications %, funded amount, received amount)
select count(id) as good_loan_applications, 
	round((count(id)::numeric/(select count(id) from bankloan))*100, 2) as good_loan_pct,
	sum(loan_amount) as good_loan_funded,
	sum(total_payment) as good_loan_received
from bankloan
where loan_status = 'Fully Paid' 
or loan_status = 'Current';

-- Bad Loan (loan applications, loan applications %, funded amount, received amount)
select count(id) as good_loan_applications, 
	round((count(id)::numeric/(select count(id) from bankloan))*100, 2) as good_loan_pct,
	sum(loan_amount) as good_loan_funded,
	sum(total_payment) as good_loan_received
from bankloan
where loan_status = 'Charged Off'; 

-- Monthly Trends by issue_date
select to_char(issue_date, 'month yyyy') as month_name, 
		count(id) as total_loan_applications,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
from bankloan
group by month_name;

-- Regional Analysis by State
select address_state, count(id) as total_loan_application,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
from bankloan
group by address_state
order by total_loan_application desc;

-- Loan Term Analysis
select term, count(id) as total_loan_application,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
from bankloan
group by term;

-- Employee Length Analysis
select emp_length, count(id) as total_loan_application,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
from bankloan
group by emp_length
order by total_loan_application desc;

-- Loan Purpose Breakdown
select purpose, count(id) as total_loan_application,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
from bankloan
group by purpose
order by total_loan_application desc;

-- Home Ownership Analysis
select home_owndership, count(id) as total_loan_application,
		sum(loan_amount) as total_funded_amount,
		sum(total_payment) as total_amount_received
from bankloan
group by home_owndership
order by total_loan_application desc;
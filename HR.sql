create database HR;
GO
USE HR;
go
CREATE TABLE regions(
	region_id int identity(1,1) primary key,
	regio_name varchar(25) not null
	);
CREATE TABLE jobs(
	job_id int identity(1,1) primary key,
	job_title varchar(35) not null,
	min_salary int not null,
	max_salary int not null
	);
CREATE TABLE countries(
	country_id char(2) primary key,
	country_name varchar(40) not null,
	region_id int not null,
	foreign key (region_id) references regions (region_id)
	);

CREATE TABLE locations(
	location_id int identity(1,1) primary key,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province char(12),
	country_id char(2),
	foreign key(country_id) references countries(country_id)
	);
CREATE TABLE employees(
	employee_id int identity(1,1) primary key,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary decimal,
	commission_pct decimal,
	manager_id int,
	foreign key (manager_id) references employees (employee_id)
	);
CREATE TABLE departments(
	department_id int identity(1,1) primary key,
	department_name varchar(30),
	manager_id int not null,
	location_id int not null,
	foreign key (manager_id) references employees (employee_id),
	foreign key (location_id) references locations (location_id)
	);
ALTER TABLE employees add department_id int not null;
alter table employees ADD foreign key (department_id) references
departments (department_id);
CREATE TABLE job_history(
	employee_id int not null,
	start_date date primary key,
	end_date date,
	job_id varchar(10),
	department_id int not null,
	foreign key (employee_id) references employees(employee_id),
	foreign key (department_id) references departments(department_id)
	);
CREATE TABLE job_grades(
	grade_level varchar(2) primary key,
	lowest_sal decimal,
	highest_sal decimal
	);



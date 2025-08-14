-- Create schema
Create schema Banks;

Go

--Import dataset

SELECT * 
FROM [Banks].[Customer Table];

select * from [Banks].[Transactions Table];

--Sum by transaction type
select transaction_type, sum(transaction_amount) as value from [Banks].[Transactions Table]
group by transaction_type;

--MIn and max date
select min(transaction_date) as min_date, max (transaction_date) as max_date
from [Banks].[Transactions Table];

--Total transaction by month and year
select format(transaction_date,'MMMM-yyyy') as Date, sum(transaction_amount) as Value
from [Banks].[Transactions Table]
group by format(transaction_date,'MMMM-yyyy')
order by 2 desc;


--Daily report
--Count of customers that transacted on 2023-08-29
select count(customer_id) as Customer_Count, transaction_date
from [Banks].[Transactions Table]
where transaction_date = '29-Aug-2023'
group by transaction_date

--Debit transactions
select transaction_type, sum(transaction_amount) as value from [Banks].[Transactions Table]
group by transaction_type;

--Transactions that happened on 2023-08-29

--Net profit
--Subquery and CTE

--Select top 3 customers in a month
select distinct top 3 A.customer_id,B.customer_name,
sum(case when A.transaction_type = 'Credit' then A.transaction_amount else 0 end) as credit_amount,
sum(case when A.transaction_type = 'Debit' then A.transaction_amount else 0 end) as debit_amount,
sum(case when A.transaction_type = 'Credit' then A.transaction_amount else 0 end - case when A.transaction_type = 'Debit' then A.transaction_amount else 0 end ) as Net_profit
from [Banks].[Transactions Table] as A
join [Banks].[Customer Table] as B
on A.customer_id = B.customer_id
where A.transaction_date>='2023-08-01' and A.transaction_date<='2023-08-30'
group by A.customer_id, B.customer_name
order by Net_profit desc;

SELECT TOP 3 
    A.customer_id,
    B.customer_name,
    SUM(CASE WHEN A.transaction_type = 'Credit' THEN A.transaction_amount ELSE 0 END) AS credit_amount,
    SUM(CASE WHEN A.transaction_type = 'Debit' THEN A.transaction_amount ELSE 0 END) AS debit_amount,
    SUM(
        (CASE WHEN A.transaction_type = 'Credit' THEN A.transaction_amount ELSE 0 END) -
        (CASE WHEN A.transaction_type = 'Debit' THEN A.transaction_amount ELSE 0 END)
    ) AS Net_profit
FROM [Banks].[Transactions Table] AS A
JOIN [Banks].[Customer Table] AS B
    ON A.customer_id = B.customer_id
WHERE A.transaction_date >= '2023-08-01' 
  AND A.transaction_date <= '2023-08-30'
GROUP BY A.customer_id, B.customer_name
ORDER BY Net_profit DESC;

--Adding data for project automation
INSERT INTO [Banks].[Transactions Table] (transaction_id, customer_id, transaction_date, transaction_type, transaction_amount, channels, currency)
VALUES('519', '11', '2025-08-10', 'Debit', '145556', 'Cards', 'Naira'),
('520', '13', '2025-08-11', 'Debit', '6756', 'Apps', 'Naira'),
('521', '20', '2025-08-11', 'Credit', '15556', 'Apps', 'Naira'),
('522', '12', '2025-08-12', 'Credit', '915556', 'Apps', 'Naira'),
('523', '17', '2023-12-18', 'Debit', '390556', 'Apps', 'Naira'),
('524', '17', '2023-12-18', 'Debit', '6556', 'Apps', 'Naira'),
('525', '12', '2023-12-18', 'Credit', '205556', 'Apps', 'Naira')

select * from [Banks].[Transactions Table]

--Adding more data

INSERT INTO [Banks].[Transactions Table] (transaction_id, customer_id, transaction_date, transaction_type, transaction_amount, channels, currency)
VALUES ('501', '6', '2023-12-14', 'Credit', '145556', 'Apps', 'Naira'),
('502', '10', '2023-12-14', 'Credit', '245556', 'Apps', 'Naira'),
('503', '6', '2023-12-14', 'Debit', '149556', 'Web', 'Naira'),
('504', '11', '2023-12-14', 'Credit', '145556', 'Web', 'Naira'),
('505', '11', '2023-12-14', 'Debit', '145556', 'Cards', 'Naira'),
('506', '13', '2023-12-14', 'Debit', '246756', 'Apps', 'Naira'),
('507', '20', '2023-12-15', 'Credit', '315556', 'Apps', 'Naira'),
('508', '12', '2023-12-15', 'Credit', '915556', 'Apps', 'Naira'),
('509', '17', '2023-12-15', 'Debit', '390556', 'Apps', 'Naira'),
('510', '17', '2023-12-15', 'Debit', '536556', 'Apps', 'Naira'),
('511', '12', '2023-12-15', 'Credit', '205556', 'Apps', 'Naira'),
('512', '19', '2023-12-15', 'Debit', '245556', 'Apps', 'Naira'),
('513', '9', '2023-12-16', 'Credit', '445556', 'Apps', 'Naira'),
('514', '10', '2023-12-16', 'Debit', '335556', 'Apps', 'Naira'),
('515', '12', '2023-12-16', 'Debit', '144456', 'Apps', 'Naira'),
('516', '5', '2023-12-17', 'Credit', '125556', 'Apps', 'Naira'),
('517', '1', '2023-12-17', 'Credit', '241156', 'Apps', 'Naira'),
('518', '3', '2023-12-17', 'Debit', '123556', 'Apps', 'Naira')

--Adding more data
INSERT INTO [Banks].[Transactions Table] (transaction_id, customer_id, transaction_date, transaction_type, transaction_amount, channels, currency)
VALUES ('526', '6', '2025-08-13', 'Credit', '145556', 'Apps', 'Naira'),
('527', '10', '2025-08-13', 'Credit', '245556', 'Apps', 'Naira'),
('528', '6', '2025-08-13', 'Debit', '129556', 'Web', 'Naira'),
('529', '11', '2025-08-13', 'Credit', '45546', 'Web', 'Naira');


Use assignment;

-- Stock market analysis assignment
-- created a new schema assignment 
-- 1.)Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. (This has been done for all 6 stocks)
select `date`, `close price`
from assignment.`bajaj auto`;

create table bajaj1(CONSTRAINT PK_date PRIMARY KEY (date)) as SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,

avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM assignment.`bajaj auto`;

create table eichermotors1(CONSTRAINT PK_date PRIMARY KEY (date)) as SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,

avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50 Day MA`
FROM assignment.`eicher motors`;

create table hero1(CONSTRAINT PK_date PRIMARY KEY (date)) as SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,

avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 19 preceding) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 49 preceding) as `50 Day MA`
FROM assignment.`hero motocorp`;

create table hero1(CONSTRAINT PK_date PRIMARY KEY (date)) as SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,

avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 19 preceding) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 49 preceding) as `50 Day MA`
FROM assignment.`hero motocorp`;

create table infosys1(CONSTRAINT PK_date PRIMARY KEY (date)) as SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,

avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 19 preceding) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 49 preceding) as `50 Day MA`
FROM assignment.`infosys`;

create table tcs1(CONSTRAINT PK_date PRIMARY KEY (date)) as SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,

avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 19 preceding) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 49 preceding) as `50 Day MA`
FROM assignment.`tcs`;

create table tvs1(CONSTRAINT PK_date PRIMARY KEY (date)) as SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price` as `Close Price`,

avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 19 preceding) as `20 Day MA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") asc rows 49 preceding) as `50 Day MA`
FROM assignment.`tvs motors`;


-- 2. Create a master table containing the date and close price of all the six stocks. (Column header for the price is the name of the stock)

create table master_table as 

select b.date as `Date`, 
b.`Close Price` as `Bajaj`, 
e.`Close Price` as `eichermotors`,
h.`Close Price` as `hero`,
i.`Close Price` as `Infosys`,
t.`Close Price` as `tcs`,
tv.`Close Price` as `tvs`

from bajaj1 b 

inner join tcs1 t using(date)
inner join tvs1 tv using(date)
inner join infosys1 i using(date)
inner join eichermotors1 e using(date)
inner join hero1 h using(date);

-- 3. Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'. Perform this operation for all stocks.

create table bajaj2 as 

SELECT `Date`, `Close Price`,
case 
WHEN `20 Day MA` > `50 Day MA` 
AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) 
over() THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` 
AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) 
over() THEN 'SELL'
ELSE 'HOLD' 
end as `Signal`
FROM assignment.bajaj1;

create table eichermotors2 as 

SELECT `Date`, `Close Price`,
case 
WHEN `20 Day MA` > `50 Day MA` 
AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) 
over() THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` 
AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) 
over() THEN 'SELL'
ELSE 'HOLD' 
end as `Signal`
FROM assignment.eichermotors1;

create table hero2 as 

SELECT `Date`, `Close Price`,
case 
WHEN `20 Day MA` > `50 Day MA` 
AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) 
over() THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` 
AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) 
over() THEN 'SELL'
ELSE 'HOLD' 
end as `Signal`
FROM assignment.hero1;

create table infosys2 as 

SELECT `Date`, `Close Price`,
case 
WHEN `20 Day MA` > `50 Day MA` 
AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) 
over() THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` 
AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) 
over() THEN 'SELL'
ELSE 'HOLD' 
end as `Signal`
FROM assignment.infosys1;

create table tcs2 as 

SELECT `Date`, `Close Price`,
case 
WHEN `20 Day MA` > `50 Day MA` 
AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) 
over() THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` 
AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) 
over() THEN 'SELL'
ELSE 'HOLD' 
end as `Signal`
FROM assignment.tcs1;

create table tvs2 as 

SELECT `Date`, `Close Price`,
case 
WHEN `20 Day MA` > `50 Day MA` 
AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) 
over() THEN 'BUY'
WHEN `20 Day MA` < `50 Day MA` 
AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) 
over() THEN 'SELL'
ELSE 'HOLD' 
end as `Signal`
FROM assignment.tvs1;


-- 4. Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.


delimiter $$
create function signalForThatparticularDay ( date varchar(10) )
returns varchar(4)
deterministic
begin
declare signal2 varchar(4);
select `Signal` into signal2 from assignment.bajaj2 where date=STR_TO_DATE(date, "%Y-%m-%d");
return signal2;
end$$ 
delimiter ;





select min(`Close Price`),max(`Close Price`)
from assignment.bajaj2
;
select min(`Close Price`),max(`Close Price`)
from assignment.hero2
;
select min(`Close Price`),max(`Close Price`)
from assignment.eichermotors2
;
select min(`Close Price`),max(`Close Price`)
from assignment.tvs2
;

select min(`Close Price`),max(`Close Price`)
from assignment.tcs2
;

select min(`Close Price`),max(`Close Price`)

from assignment.infosys2
;
select max(`Close Price`)-min(`Close price`)
from assignment.infosys2
;

select max(`Close Price`)-min(`Close price`)
from assignment.bajaj2
;

select max(`Close Price`)-min(`Close price`)
from assignment.eichermotors2
;
select max(`Close Price`)-min(`Close price`)
from assignment.hero2
;
select max(`Close Price`)-min(`Close price`)
from assignment.infosys2
;
select max(`Close Price`)-min(`Close price`)
from assignment.tcs2
;
select max(`Close Price`)-min(`Close price`)
from assignment.tvs2
;

























Create Database if not exists `Travel` ;
use `Travel`;

create table Passenger
(
  Passenger_Name varchra(20),
  Category varchar(20),
  Gender varchar(20),
  Boarding_City varchar(20),
  Destination_City varchar(20),
  Distance int,
  Bus_Type varchar(20)
);

create table Price
(
  Bus_Type varchar(20),
  Distance int,
  Price int
);

insert into Passenger values("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
insert into Passenger values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into Passenger values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into Passenger values("Khushboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into Passenger values("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper");
insert into Passenger values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into Passenger values("Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper");
insert into Passenger values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into Passenger values("Piyush","AC","F","Pune","Nagpur",700,"Sitting");

insert into Price values("Sleeper",350,770);
insert into Price values("Sleeper",500,1100);
insert into Price values("Sleeper",600,1320);
insert into Price values("Sleeper",700,1540);
insert into Price values("Sleeper",1000,2200);
insert into Price values("Sleeper",1200,2640);
insert into Price values("Sleeper",350,434);
insert into Price values("Sitting",500,620);
insert into Price values("Sitting",500,620);
insert into Price values("Sitting",600,744);
insert into Price values("Sitting",700,868);
insert into Price values("Sitting",1000,1240);
insert into Price values("Sitting",1200,1488);
insert into Price values("Sitting",1500,1860);

select count(Gender) from Passenger where Gender="M" and Distance>=600;

select min(Price) from Price where Bus_Type="Sleeper";

select Passenger_Name from Passenger where Passenger_Name like 'S%';

select Passenger_Name, Boarding_City, Destination_City, Passenger.Bus_Type, Price.Price from Passenger INNER JOIN Price ON Passenger.Bus_Type=Price.Bus_type and Passenger.Distance=Price.Distance;

select Passenger.Passenger_Name, Price.price from Passenger, Price where Passenger.Bus_Type="Sitting" and Passenger.Distance>=1000;

select Bus_Type, Price from Price where Distance=(select Distance from Passenger where Passenger_name="Pallavi");

select distinct(Distance) from Passenger order by distance desc;

select Passenger_Name, round(((Distance/(select sum(Distance) from Passenger)) * 100), 2) as Percentage_Distance from Passenger;

select Price, Distance,
CASE
when Price>1000 then 'Expensive'
when Price>500 and Price<1000 then 'Average Cost'
else 'Cheap'
END as Cost
from Price;
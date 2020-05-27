create table books_info (
isbn varchar2(20) primary key, 
title varchar2(50) not null,
author varchar2(40) not null,
publisher varchar2(50), 
price number(6) not null,
category varchar2(50) not null, 
description varchar2(2000)); 

select * from BOOKS_INFO;

insert into BOOKS_INFO 
        values('2020001','자바를 잘하는 기술들','현대빈','현대',50000,'기술','자바기술 소개');
insert into BOOKS_INFO 
        values('2020002','JSP를 잘하는 기술들','이병진','삼성',30000,'기술','JSP기술 소개');
insert into BOOKS_INFO 
        values('2020003','Servlet을잘하는 기술들', '김영진', '쌍용데이터', 100000,'기술','Servlet기술 소개');
        
        drop table books_info;
        commit;
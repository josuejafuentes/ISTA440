# this is a big header

### this is a less big header

##### this is a smaller header

this is a pargraph. four score and seven years ago our forefathers brought on this continent a nation concieved in liberty 



.echo on
.headers on

title; favorite shows
author; josue fuentes
date; jan 21 2020
assignment; 

drop table if exist favoriteshows;

create table favoriteshows (
animeid integer primary key, 
animename text, 
author text, 
daterelease text
);

insert into favoriteshows values (1,'demon slayer','koyoharu gotouge','2016-02-15');
insert into favoriteshows values (2,'one punch man','one','2009-02-07');
insert into favoriteshows values (3,'my hero academia','kohei horikoshi','2014-07-07');
insert into favoriteshows values (4,'hunterxhunter','yoshihiro togashi','2011-08-11');
insert into favoriteshows values (5,'black clover','yuki tabata','2017-08-03');


select * from favoriteshows;
animeid|
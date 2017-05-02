-- alter table dhcpalloc add id int not null auto_increment unique key;
-- alter table dhcpsubnet add id int not null auto_increment unique key;
-- alter table envmach add id int not null auto_increment unique key;
-- alter table envuser add id int not null auto_increment unique key;
-- alter table machuser add id int not null auto_increment unique key;

alter table provodc add id int not null auto_increment unique key;

alter table user modify id int not null auto_increment primary key;

-- More complex ones ... only need this if we go read/write
-- alter table envmach drop foreign key `environment_fk`;
-- alter table environment modify id int not null auto_increment;
-- alter table envmach add CONSTRAINT `environment_fk` FOREIGN KEY (`envid`) REFERENCES `environment` (`id`);

create or replace
  sql security invoker
  view machines as (select * from provodc);

create or replace
  sql security invoker
  view users as (select * from user);

create or replace
  sql security invoker
  view environments as (select * from environment);

create or replace
  sql security invoker
  view environments_users as (
    select envid as environment_id, userid as user_id from envuser
  );


-- setting this up as a habtm even though a machine should belong to one env
create or replace
  sql security invoker
  view environments_machines as (
    select e.envid as environment_id, m.id as machine_id from envmach e inner join machines m on e.serial = m.serial
  );



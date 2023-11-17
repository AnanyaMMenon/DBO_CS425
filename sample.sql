-- create database parking lot management
create database plm;

use plm;

-- customer, employee, parking_lot, parking_spot, reservation, vehicle, parking_log, payment-- 
select
    'CREATING TABLES...' AS '';

create table
    employee (emp_id int, primary key (emp_id), first_name varchar(20), last_name varchar(20), email varchar(50), phone_number varchar(50), user_name varchar(20), password varchar(50));

-- Creating table ParkingLot
create table
    parking_lot (lot_id int, lot_name varchar(20), location varchar(50), total_spots int, available_spots int, zip_code varchar(5), emp_id int, primary key (lot_id), foreign key (emp_id) references employee (emp_id) on delete cascade );

-- Creating table parkingSpot
create table
    parking_spot (spot_id int, lot_id int, spot_type varchar(20), status varchar(50), primary key (spot_id), foreign key (lot_id) references parking_lot (lot_id) on delete cascade);

create table
    customer (cust_id int, first_name varchar(20), last_name varchar(20), email varchar(50), phone_number varchar(50), address varchar(50), user_name varchar(20), password varchar(20), primary key (cust_id));

create table
    reservation (
        res_id int,
        cust_id int,
        spot_id int,
		checkin_time timestamp,
        checkout_time timestamp,      
        status varchar(20),
        primary key (res_id),
        foreign key (cust_id) references customer (cust_id) on delete cascade,
        foreign key (spot_id) references parking_spot (spot_id) on delete cascade
    );

create table
    vehicle (vehicle_id int, cust_id int, plate_number varchar(20), vehicle_type varchar(20), primary key (vehicle_id), foreign key (cust_id) references customer (cust_id) on delete cascade);

create table
    parking_log (
        log_id int,
        vehicle_id int,
        spot_id int,
        checkin_time timestamp,
        checkout_time timestamp,
        res_id int,
        primary key (log_id),
        foreign key (vehicle_id) references vehicle (vehicle_id) on delete cascade,
        foreign key (spot_id) references parking_spot (spot_id) on delete cascade
    );

create table
    payment (
        pmt_id int,
        log_id int,
        cust_id int,
        pmt_mode varchar(20),
        pmt_amt decimal(10, 2),
        pmt_status varchar(20),
        primary key (pmt_id),
        foreign key (log_id) references parking_log (log_id) on delete cascade,
        foreign key (cust_id) references customer (cust_id) on delete cascade
    );

-- customer, employee, parking_lot, parking_spot, reservation, vehicle, parking_log, payment-- 
select
    'LOADING DATA...' AS '';

insert into
    customer (cust_id, first_name, last_name, email, phone_number, address, user_name, password)
values
    (101, 'Bradley', 'Phillips', 'kristywebb@example.net', 4707618385, '620 Amy View Suite 384, AK 70518', 'zrodriguez', '@0rs8SGwk0'),
    (102, 'Angela', 'Pacheco', 'ysmith@example.net', '5989348784', '6582 Solomon Throughway, MS 81795', 'dana50', 'y*9J$24b'),
    (103, 'Theresa', 'Cruz', 'riverapamela@example.net', 9092927398, '6246 Nelson Squares Apt. 517, NY 04860', 'fmartinez', 'R(4E0tUr'),
    (104, 'David', 'Martin', 'michael01@example.com', '2379211270', '50527 Martinez Street, MD 54885', 'david13', '@DiLtted5'),
    (105, 'Tyler', 'Davis', 'seanleach@example.net', '3909217820', '817 Sutton Village Suite 600, MO 79644', 'ryanfisher', 'e43Jo)g1!go'),
    (106, 'David', 'Alvarez', 'caitlinkhan@example.org', '4186815330', '218 Debbie Keys, VT 00709', 'atkinschristopher', '^++lY0Qh'),
    (107, 'Daniel', 'Martin', 'kurt78@example.com', '3542745193', '46387 William Shore, MP 56139', 'matthewgordon', '#i$F6ptz11bF'),
    (108, 'Lisa', 'Lopez', 'wendy27@example.net', '6697126654', '829 Danielle Springs Suite 014, KS 63041', 'derricksolomon', 'Y11E!*c&^S'),
    (109, 'Christopher', 'Martin', 'lucascollins@example.com', '9933884228', '47496 Richards Union, PR 67368', 'randalldenise', '+q9CK*nK'),
    (110, 'Andrea', 'Sellers', 'michele04@example.org', '7029370537', '0443 Robbins Track Apt. 106, AZ 85593', 'qreed', 'dieA29MwF*'),
    (111, 'Frank', 'Miller', 'christopher43@example.net', '2903210477', '493 Christopher Shoal Apt. 050, CT 54156', 'cbecker', '!pQEISicT)6'),
    (112, 'George', 'Johnson', 'nrobles@example.com', '7253135207', '1808 Carroll Centers', 'ryanmartin', ')+GSxil$5s'),
    (113, 'Yolanda', 'Lawrence', 'denisewilliams@example.org', '5675136105', 'USNS Boyd', 'david84', '_V5qMDFyI'),
    (114, 'Kimberly', 'Becker', 'igreen@example.org', '9992606441', '67199 Baker Course', 'paul14', 'lSoL&IwJ+7B'),
    (115, 'Melissa', 'Garcia', 'alexandra59@example.com', '9997131470', '86924 Duane Dam Apt. 652', 'mark86', ')%6sg+hc7+EF'),
    (116, 'Bobby', 'Jones', 'molly07@example.net', '0016854999', '301 Samantha Trail’t, FM 38896', 'ycarter', 'oDMtmpkk(0'),
    (117, 'Stacey', 'Singleton', 'jeffrey14@example.org', '4418062220', '539 Adam Union', 'rcox', 'd7qJ*it#*1C'),
    (118, 'Nicole', 'Roman', 'estark@example.org', '7242189202', '279 Barnett Prairie', 'christopher73', '#BBC_Yt*9Gw');

Insert into
    employee (emp_id, first_name, last_name, email, phone_number, user_name, password)
values
    (1, 'Glenn', 'Long', 'canderson@example.org', '3420578986', 'sharon67', '79rBrk0(('),
    (2, 'Joseph', 'Fleming', 'deborahsmith@example.com', '8547894291', 'moorejames', 'y9MN+(&n&'),
    (3, 'Billy', 'Sherman', 'john38@example.com', '8348640888', 'tanyamason', '0ht48Cfsf&'),
    (4, 'Tyler', 'Green', 'vcurry@example.org', '2033989761', 'laurenrodriguez', 'n6NQZ0VG$b'),
    (5, 'Hannah', 'Love', 'meredithmorton@example.org', '2017817291', 'williscolton', '(Y5WUlVNw'),
    (6, 'Kathryn', 'Greer', 'qballard@example.net', '9756493349', 'kparks', '+0NSh1BN2%lj'),
    (7, 'Elizabeth', 'Norris', 'hcortez@example.net', '9245557252', 'jordanbailey', 'B27VbX$mM@1'),
    (8, 'Hunter', 'Fleming', 'kstrong@example.org', '3878611793', 'stephaniejones', 'XEvVMtB08!4'),
    (9, 'Bradley', 'West', 'michelle01@example.com', '3319511036', 'carolyn10', '+Q9M%gvW*'),
    (10, 'Thomas', 'Thompson', 'lwheeler@example.org', '8757182169', 'julian89', '^C+GLmV9f3@'),
    (11, 'Thomas', 'Townsend', 'ichandler@example.com', '665673770', 'rogerstamara', '@DCg0HyJ'),
    (12, 'Jessica', 'Kelley', 'yolandabruce@example.com', '3236748727', 'arthur82', 'VX6N(RiuH%'),
    (13, 'Tim', 'Weber', 'mario12@example.org', '6867536400', 'jasonking', '$P1U3JRkYt8'),
    (14, 'Mary', 'Wilcox', 'johnsonfrederick@example.org', '7618415738', 'gilbertjones', '&rUa^V6l9'),
    (15, 'Carol', 'Smith', 'pamglass@example.com', '714363261', 'juanfarmer', 'o5BRKIzC&'),
    (16, 'Stephanie', 'James', 'katherinecook@example.net', '8832830812', 'lisaturner', '!4T4jJpUFd');

INSERT INTO
    parking_lot (lot_id, lot_name, location, total_spots, available_spots, emp_id,zip_code)
values
    (1000, 'Art Institute', '1300 S DuSable Lk Shr Dr', 100, 29, 4,'60603'),
    (1001, 'Adler Planetarium', '5433 Elizabeth Club', 29, 1, 7,'60616'),
    (1002, 'McCormick Place', '2301 S King Dr', 18, 12, 8,'60616'),
    (1003, 'Soldier Field', '1410 Museum Campus Dr', 25, 5, 8,'60605'),
    (1004, 'Lincoln Park Zoo', '2001 N Clark St', 110, 19, 4,'60614'),
    (1005, 'Water Tower Place', ' 835 North Michigan Avenue', 23, 7, 1,'60611'),
    (1006, 'Shedd Aquarium', '1200 S Lake Shore D', 100, 20, 2,'60605'),
    (1007, 'The Field Museum', '1400 S Lake Shore Dr', 27, 3, 6,'60605'),
    (1008, 'Nordstrom', '55 E Grand Ave', 15, 15, 2,'60611'),
    (1009, 'The Magnificent Mile', 'North Michigan Avenue', 130, 17, 3,'60611'),
    (1010, 'Navy Pier', '600 E Grand Ave', 15, 15, 2,'60611'),
    (1011, 'Jewel Osco', 'S King Drive', 26, 4, 5,'60616'),
    (1012, 'Grant Park', '337 E Randolph St', 60, 24, 3,'60601'),
    (1013, 'Millennium Park', '201 E Randolph St', 70, 23, 4,'60602'),
    (1014, 'O\'Hare Airport', '10000 W OHare Ave', 130, 17, 4,'60666'),
    (1015, 'Midway Airport', '5700 S Cicero Ave', 25, 5, 6,'60638');
    

insert into
    parking_spot (spot_id, lot_id, spot_type, status)
values
    (200, 1007, 'charging', 'occupied'),
    (201, 1008, 'valet', 'occupied'),
    (202, 1013, 'charging', 'available'),
    (203, 1003, 'standard', 'available'),
    (204, 1002, 'disabled', 'occupied'),
    (205, 1010, 'valet', 'occupied'),
    (206, 1002, 'standard', 'occupied'),
    (207, 1008, 'charging', 'occupied'),
    (208, 1014, 'standard', 'available'),
    (209, 1013, 'motor cycle', 'occupied'),
    (210, 1005, 'truck', 'occupied'),
    (211, 1015, 'motor cycle', 'occupied'),
    (212, 1002, 'reserved', 'available'),
    (213, 1008, 'valet', 'occupied'),
    (214, 1004, 'reserved', 'available'),
    (215, 1006, 'valet', 'occupied'),
    (216, 1001, 'valet', 'available'),
    (217, 1008, 'truck', 'occupied'),
    (218, 1013, 'motor cycle', 'available'),
    (219, 1009, 'valet', 'available'),
    (220, 1013, 'charging', 'occupied'),
    (221, 1010, 'charging', 'occupied'),
    (222, 1001, 'truck', 'occupied'),
    (223, 1009, 'valet', 'available'),
    (224, 1011, 'truck', 'occupied'),
    (225, 1007, 'motor cycle', 'available'),
    (226, 1007, 'motor cycle', 'available'),
    (227, 1006, 'reserved', 'occupied'),
    (228, 1011, 'motor cycle', 'available'),
    (229, 1004, 'truck', 'available');

insert into
    reservation (res_id, cust_id, spot_id, checkin_time , checkout_time , status)
values
    (200, 108, 212, '2023-12-21 04:42:17', '2023-12-21 06:14:17', 'failed'),
    (201, 117, 228,  '2023-10-09 17:09:34', '2023-10-09 18:43:34', 'failed'),
    (202, 110, 210,  '2023-10-28 16:40:40', '2023-10-28 18:40:40', 'confirmed'),
    (203, 106, 215, '2023-10-19 18:15:18', '2023-10-19 19:41:18', 'confirmed'),
    (204, 113, 210,  '2023-10-06 20:06:58', '2023-10-06 22:32:58', 'confirmed'),
    (205, 107, 217,  '2023-12-06 14:57:54', '2023-12-06 17:17:54', 'failed'),
    (206, 102, 201, '2023-10-19 18:17:45', '2023-10-19 20:39:45', 'confirmed'),
    (207, 115, 227, '2023-10-21 21:45:15', '2023-10-21 23:49:15', 'failed'),
    (208, 105, 223,  '2023-12-22 17:54:45', '2023-12-22 18:36:45', 'confirmed'),
    (209, 101, 217, '2023-10-26 15:09:01', '2023-10-26 17:21:01', 'confirmed'),
    (210, 101, 204, '2023-10-08 09:14:31', '2023-10-08 11:13:31', 'confirmed'),
    (211, 117, 201, '2023-12-03 01:22:22', '2023-12-03 03:08:22', 'confirmed'),
    (212, 101, 213, '2023-11-15 23:55:14', '2023-11-16 00:38:14', 'failed'),
    (213, 118, 209, '2023-10-24 07:38:07', '2023-10-24 08:51:07', 'failed'),
    (214, 101, 214, '2023-10-11 13:15:17', '2023-10-11 14:33:17',  'confirmed'),
    (215, 106, 223, '2023-10-24 12:50:28', '2023-10-24 15:35:28' , 'confirmed'),
    (216, 102, 207, '2023-11-27 04:09:01', '2023-11-27 07:01:01', 'confirmed'),
    (217, 118, 227,  '2023-12-02 04:33:20', '2023-12-02 05:49:20', 'failed'),
    (218, 113, 209, '2023-10-07 04:13:46', '2023-10-07 06:07:46', 'failed'),
    (219, 110, 219, '2023-11-17 18:28:43', '2023-11-17 21:03:43', 'failed'),
    (220, 102, 203, '2023-12-11 03:53:32', '2023-12-11 06:51:32', 'confirmed'),
    (221, 118, 214,  '2023-10-07 14:54:18', '2023-10-07 16:13:18', 'failed'),
    (222, 118, 223, '2023-11-26 09:58:12', '2023-11-26 12:01:12', 'confirmed'),
    (223, 114, 207,  '2023-11-09 22:54:01', '2023-11-10 00:27:01', 'confirmed'),
    (224, 104, 211,  '2023-11-17 13:17:24', '2023-11-17 15:43:24', 'failed'),
    (225, 102, 226, '2023-11-11 05:14:43', '2023-11-11 07:11:43', 'confirmed'),
    (226, 104, 200, '2023-11-14 13:03:51', '2023-11-14 14:59:51', 'failed'),
    (227, 109, 202, '2023-10-16 22:43:29', '2023-10-17 01:10:29', 'confirmed'),
    (228, 106, 224, '2023-12-12 22:49:54', '2023-12-12 23:21:54', 'failed'),
    (229, 112, 222, '2023-12-01 15:03:46', '2023-12-01 16:43:46', 'confirmed');

insert into
    vehicle (vehicle_id, cust_id, plate_number, vehicle_type)
values
    (1, 106, 'Virginia TA 6432', 'sedan'),
    (2, 103, 'Virginia FL 5848', 'sedan'),
    (3, 108, 'New York CJ 5581', 'motorcycle'),
    (4, 108, 'New York YR 2891', 'motorcycle'),
    (5, 108, 'Virginia DF 4379', 'Truck'),
    (6, 115, 'New York MX 8569', 'sedan'),
    (7, 107, 'Virginia BZ 7515', 'suv'),
    (8, 105, 'Virginia QP 3664', 'suv'),
    (9, 108, 'Illinois EY 9159', 'motorcycle'),
    (10, 116, 'Illinois LC 6639', 'Truck'),
    (11, 101, 'New York NP 4123', 'Van'),
    (12, 116, 'Virginia MZ 6294', 'motorcycle'),
    (13, 114, 'Virginia LZ 3219', 'sedan'),
    (14, 118, 'Virginia EZ 8554', 'Truck'),
    (15, 109, 'Illinois TQ 5137', 'motorcycle'),
    (16, 115, 'Illinois UG 1853', 'Truck'),
    (17, 107, 'Virginia GY 5769', 'suv'),
    (18, 118, 'Virginia CP 3250', 'motorcycle'),
    (19, 107, 'Virginia PB 6673', 'suv'),
    (20, 112, 'Virginia EI 6868', 'motorcycle'),
    (21, 109, 'Virginia UM 8504', 'Truck'),
    (22, 112, 'Virginia IT 8100', 'sedan'),
    (23, 106, 'Illinois QV 4687', 'Truck'),
    (24, 118, 'Virginia GA 9901', 'sedan'),
    (25, 104, 'Virginia JO 8524', 'sedan');

insert into
    parking_log (log_id, vehicle_id, spot_id, checkin_time, checkout_time, res_id)
values
    (1500, 2, 214, '2023-12-21 04:42:17', '2023-12-21 06:14:17', 211),
    (1501, 10, 200, '2023-10-09 17:09:34', '2023-10-09 18:43:34', 200),
    (1502, 18, 229, '2023-10-28 16:40:40', '2023-10-28 18:40:40', 228),
    (1503, 18, 207, '2023-10-19 18:15:18', '2023-10-19 19:41:18', 216),
    (1504, 14, 226, '2023-10-06 20:06:58', '2023-10-06 22:32:58', 204),
    (1505, 19, 208, '2023-12-06 14:57:54', '2023-12-06 17:17:54', 209),
    (1506, 23, 204, '2023-10-19 18:17:45', '2023-10-19 20:39:45', 214),
    (1507, 8, 213, '2023-10-21 21:45:15', '2023-10-21 23:49:15', 223),
    (1508, 19, 211, '2023-12-22 17:54:45', '2023-12-22 18:36:45', 205),
    (1509, 25, 200, '2023-10-26 15:09:01', '2023-10-26 17:21:01', 208),
    (1510, 14, 223, '2023-10-08 09:14:31', '2023-10-08 11:13:31', 228),
    (1511, 6, 216, '2023-12-03 01:22:22', '2023-12-03 03:08:22', 212),
    (1512, 20, 221, '2023-11-15 23:55:14', '2023-11-16 00:38:14', 208),
    (1513, 2, 226, '2023-10-24 07:38:07', '2023-10-24 08:51:07', 218),
    (1514, 12, 206, '2023-10-11 13:15:17', '2023-10-11 14:33:17', 225),
    (1515, 11, 221, '2023-10-24 12:50:28', '2023-10-24 15:35:28', 218),
    (1516, 18, 226, '2023-11-27 04:09:01', '2023-11-27 07:01:01', 208),
    (1517, 23, 204, '2023-12-02 04:33:20', '2023-12-02 05:49:20', 200),
    (1518, 23, 209, '2023-10-07 04:13:46', '2023-10-07 06:07:46', 227),
    (1519, 1, 202, '2023-11-17 18:28:43', '2023-11-17 21:03:43', 220),
    (1520, 22, 223, '2023-12-11 03:53:32', '2023-12-11 06:51:32', 220),
    (1521, 20, 226, '2023-10-07 14:54:18', '2023-10-07 16:13:18', 229),
    (1522, 16, 219, '2023-11-26 09:58:12', '2023-11-26 12:01:12', 217),
    (1523, 10, 218, '2023-11-09 22:54:01', '2023-11-10 00:27:01', 203),
    (1524, 4, 228, '2023-11-17 13:17:24', '2023-11-17 15:43:24', 217),
    (1525, 4, 203, '2023-11-11 05:14:43', '2023-11-11 07:11:43', 202),
    (1526, 9, 206, '2023-11-14 13:03:51', '2023-11-14 14:59:51', 215),
    (1527, 21, 223, '2023-10-16 22:43:29', '2023-10-17 01:10:29', 215),
    (1528, 3, 220, '2023-12-12 22:49:54', '2023-12-12 23:21:54', 211),
    (1529, 8, 210, '2023-12-01 15:03:46', '2023-12-01 16:43:46', 221);

insert into
    payment (pmt_id, log_id, cust_id, pmt_mode, pmt_amt, pmt_status)
values
    (500, 1513, 106, 'credit', 35, 'failed'),
    (501, 1518, 112, 'debit', 25, 'successful'),
    (502, 1508, 110, 'wallet', 30, 'successful'),
    (503, 1501, 105, 'google pay', 20, 'failed'),
    (504, 1524, 116, 'wallet', 25, 'successful'),
    (505, 1504, 104, 'debit', 55, 'successful'),
    (506, 1506, 112, 'google pay', 30, 'successful'),
    (507, 1502, 102, 'wallet', 55, 'successful'),
    (508, 1522, 109, 'credit', 20, 'failed'),
    (509, 1526, 107, 'debit', 60, 'failed'),
    (510, 1518, 104, 'debit', 25, 'successful'),
    (511, 1501, 105, 'google pay', 30, 'successful'),
    (512, 1517, 118, 'debit', 45, 'successful'),
    (513, 1513, 101, 'credit', 60, 'failed'),
    (514, 1516, 102, 'credit', 55, 'successful'),
    (515, 1515, 113, 'wallet', 60, 'failed'),
    (516, 1509, 101, 'debit', 50, 'successful'),
    (517, 1504, 106, 'credit', 25, 'successful'),
    (518, 1513, 103, 'debit', 60, 'failed'),
    (519, 1529, 103, 'wallet', 60, 'failed'),
    (520, 1528, 107, 'debit', 30, 'failed'),
    (521, 1510, 112, 'debit', 35, 'successful'),
    (522, 1526, 104, 'credit', 45, 'successful'),
    (523, 1529, 102, 'google pay', 80, 'successful'),
    (524, 1503, 106, 'credit', 60, 'failed');

select
    'CRUD OPERATIONS...' AS '';

select * from payment where pmt_id=524;
update payment set pmt_status='successful' where pmt_id=524;
select * from payment where pmt_id=524;
select * from parking_spot where spot_id=200;
update parking_spot set status='available' where spot_id=200;
select * from parking_spot where spot_id=200;

select * from parking_lot limit 3;
select r.*, c.first_name as cust_fname, c.phone_number from reservation r inner join customer c on r.cust_id=c.cust_id limit 3;

select * from parking_lot where lot_id=1001;
delete from parking_lot where lot_id=1001;
select * from parking_lot where lot_id=1001;

select count(*) from vehicle where vehicle_type='motorcycle';
delete from vehicle where vehicle_type='motorcycle';
select count(*) from vehicle where vehicle_type='motorcycle';

select
    'CREATING INDICES...' AS '';

create index vehicle_idx1 on vehicle (plate_number);

create index log_idx1 on parking_log (log_id, vehicle_id, spot_id);

create index cust_idx1 on customer (first_name);

select
    'CREATING VIEWS...' AS '';

create view
    parking_log_view as
select
    lg.*,
    cust.cust_id as cust_id,
    cust.first_name as cust_fname,
    pl.lot_name
from
    parking_log lg
    left join vehicle v on lg.vehicle_id = v.vehicle_id
    left join customer cust on cust.cust_id = v.cust_id
    left join parking_spot ps on ps.spot_id = lg.spot_id
    left join parking_lot pl on pl.lot_id = ps.lot_id;

create view
    reservation_confirmed as
select
    r.*,
    c.first_name as cust_fname
from
    reservation r
    left join customer c on c.cust_id = r.cust_id
where
    r.status = 'confirmed';

select
    'CREATING TEMP TABLES...' AS '';

create temporary table temp_parking_duration (log_id int, spot_id int, avg_duration int);

INSERT INTO
    temp_parking_duration (log_id, spot_id, avg_duration)
SELECT
    log_id,
    spot_id,
    checkout_time - checkin_time
FROM
    parking_log;

drop temporary table temp_parking_duration;

select
    'CREATING FUNCTIONS...' AS '';

delimiter //
create function get_hour_minues (seconds int)
returns varchar(30)
deterministic
begin
    declare result varchar(30);
    if seconds >= 3600 then
        set result = TIME_FORMAT(SEC_TO_TIME(seconds), '%kh %lm');
    else
        set result = TIME_FORMAT(SEC_TO_TIME(seconds), '%lm');
    end if;
    return result;
end; //
delimiter ;

select vehicle_id, get_hour_minues(checkout_time-checkin_time) as parking_duration from parking_log;


delimiter //
create function calc_fill_percent (total_spots int, available_spots int)
returns double
deterministic
begin
    return round((total_spots-available_spots)/total_spots*100,2);
end; //
delimiter ;

select lot_id, lot_name, calc_fill_percent(total_spots, available_spots) as fill_percent from parking_lot;

select
    'CREATING PROCEDURES...' AS '';

delimiter //
create procedure payment_success_task (log int)
begin
    declare spot, lot int;
    select spot_id into spot from parking_log where log_id = log;
    select lot_id into lot from parking_spot where spot_id = spot;
    update parking_spot
        set status = 'available'
        where spot_id = spot;
    update parking_lot
        set available_spots =  available_spots+1
        where lot_id = lot;
end; //
delimiter ;

delimiter //
create procedure parked_task (log int)
begin
    declare spot, lot int;
    select spot_id into spot from parking_log where log_id = log;
    select lot_id into lot from parking_spot where spot_id = spot;
    update parking_spot
        set status = 'occupied'
        where spot_id = spot;
    update parking_lot
        set available_spots =  available_spots-1
        where lot_id = lot;
end; //
delimiter ;

select s.status as spot_status, t.available_spots from parking_log l join parking_spot s on l.spot_id = s.spot_id and l.log_id=1500 join parking_lot t on t.lot_id = s.lot_id;
call parked_task(1500);
select s.status as spot_status, t.available_spots from parking_log l join parking_spot s on l.spot_id = s.spot_id and l.log_id=1500 join parking_lot t on t.lot_id = s.lot_id;

select
    'CREATING TRIGGERS...' AS '';

delimiter //
CREATE TRIGGER parking_lot_const before update
ON parking_lot
FOR EACH ROW
IF new.available_spots > new.total_spots THEN
SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Available spots can`t exceed total spots';
END IF; //
delimiter ;

update parking_lot 
    set available_spots=200
    where lot_id=1000;

delimiter //
CREATE TRIGGER trigger_parked_task after insert
ON parking_log
FOR EACH ROW
begin
    declare lot int;
    select lot_id into lot from parking_spot where spot_id = new.spot_id;
    update parking_spot
        set status = 'occupied'
        where spot_id = new.spot_id;
    update parking_lot
        set available_spots =  available_spots-1
        where lot_id = lot;
end; //
delimiter ;


select s.status as spot_status, t.available_spots from parking_spot s join parking_lot t on t.lot_id = s.lot_id and s.spot_id=202;
insert into
    parking_log (log_id, vehicle_id, spot_id, checkin_time, checkout_time, res_id)
values
    (1530, 2, 202, '2023-12-21 04:42:17', '2023-12-21 06:14:17', null);

select s.status as spot_status, t.available_spots from parking_spot s join parking_lot t on t.lot_id = s.lot_id and s.spot_id=202;

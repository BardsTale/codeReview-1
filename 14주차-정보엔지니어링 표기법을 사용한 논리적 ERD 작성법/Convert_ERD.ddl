-- ������ Oracle SQL Developer Data Modeler 17.4.0.355.2121
--   ��ġ:        2020-07-07 17:36:47 KST
--   ����Ʈ:      Oracle Database 11g
--   ����:      Oracle Database 11g



CREATE TABLE airport (
    serial_num   VARCHAR2(9 CHAR) NOT NULL,
    name         VARCHAR2(12 CHAR) NOT NULL,
    nation       VARCHAR2(12 CHAR) NOT NULL,
    city         VARCHAR2(12 CHAR) NOT NULL,
    phone_num    NUMBER(12) NOT NULL
);

ALTER TABLE airport ADD CONSTRAINT airport_pk PRIMARY KEY ( serial_num );

CREATE TABLE customer (
    id          NUMBER(4) NOT NULL,
    name        VARCHAR2(12 CHAR) NOT NULL,
    rrn         NUMBER(13) NOT NULL,
    passport    VARCHAR2(6 CHAR) NOT NULL,
    address     VARCHAR2(20 CHAR) NOT NULL,
    home_num    NUMBER(12),
    cell_num    NUMBER(12),
    birthdate   DATE NOT NULL
);

ALTER TABLE Customer ADD check ( birthdate &gt; date &apos;1900-01-01&apos;) 
;

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( id );

CREATE TABLE employee (
    id             NUMBER(4) NOT NULL,
    name           VARCHAR2(12 CHAR) NOT NULL,
    rrn            NUMBER(13) NOT NULL,
    address        VARCHAR2(20 CHAR) NOT NULL,
    home_phone     NUMBER(12),
    cell_phone     NUMBER(12),
    office_phone   NUMBER(12),
    branch         VARCHAR2(10 CHAR),
    position       VARCHAR2(8 CHAR) NOT NULL
);

ALTER TABLE employee
    ADD CHECK ( position IN (
        '����',
        '�븮',
        '����',
        '���',
        '����'
    ) );

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( id );

CREATE TABLE flight (
    flight_num   VARCHAR2(5 CHAR) NOT NULL,
    model        VARCHAR2(12 CHAR) NOT NULL,
    "1st_seat"   NUMBER(3) NOT NULL,
    "2nd_seat"   NUMBER(3) NOT NULL,
    "3nd_seat"   NUMBER(3) NOT NULL
);

ALTER TABLE flight ADD CONSTRAINT flight_pk PRIMARY KEY ( flight_num );

CREATE TABLE leg (
    leg_num      NUMBER(4) NOT NULL,
    flight_num   VARCHAR2(5 CHAR) NOT NULL,
    dep_time     TIMESTAMP NOT NULL,
    arriv_time   TIMESTAMP NOT NULL,
    departure    VARCHAR2(9 CHAR) NOT NULL,
    via          VARCHAR2(12 CHAR),
    arrival      VARCHAR2(9 CHAR) NOT NULL
);

ALTER TABLE leg ADD CONSTRAINT leg_pk PRIMARY KEY ( leg_num );

CREATE TABLE price (
    ticket_id   NUMBER(4) NOT NULL,
    departure   VARCHAR2(9 CHAR) NOT NULL,
    arrival     VARCHAR2(9 CHAR) NOT NULL,
    price       NUMBER(9) NOT NULL,
    class       VARCHAR2(5 CHAR) NOT NULL,
    period      VARCHAR2(3 CHAR) NOT NULL
);

ALTER TABLE price ADD CHECK ( price BETWEEN 100 AND 100000000 );

ALTER TABLE price
    ADD CHECK ( class IN (
        '1st',
        '2nd',
        '3nd'
    ) );

ALTER TABLE price
    ADD CHECK ( period IN (
        '�����',
        '������'
    ) );

ALTER TABLE price ADD CONSTRAINT price_pk PRIMARY KEY ( ticket_id );

CREATE TABLE reservation (
    reserv_num      NUMBER(4) NOT NULL,
    customer_id     NUMBER(4) NOT NULL,
    ticket_id       NUMBER(4) NOT NULL,
    reserv_date     DATE NOT NULL,
    customer_type   VARCHAR2(4) NOT NULL,
    ticket_type     VARCHAR2(2 CHAR) NOT NULL,
    emp_id          NUMBER(4) NOT NULL,
    trip_info       VARCHAR2(200 CHAR) NOT NULL,
    leg_num         NUMBER(4) NOT NULL
);

ALTER TABLE Reservation ADD check ( reserv_date &gt; date &apos;1900-01-01&apos;);
ALTER TABLE reservation
    ADD CHECK ( customer_type IN (
        '���γ�',
        '���ο�',
        '��̳�',
        '��̿�',
        '���Ƴ�',
        '���ƿ�',
        'û�ҳⳲ',
        'û�ҳ⿩'
    ) );

ALTER TABLE reservation
    ADD CHECK ( ticket_type IN (
        '�պ�',
        '��'
    ) );

ALTER TABLE reservation ADD CONSTRAINT reservation_pk PRIMARY KEY ( reserv_num );

ALTER TABLE leg
    ADD CONSTRAINT flight_leg FOREIGN KEY ( flight_num )
        REFERENCES flight ( flight_num );

ALTER TABLE leg
    ADD CONSTRAINT legs_arrival FOREIGN KEY ( arrival )
        REFERENCES airport ( serial_num );

ALTER TABLE leg
    ADD CONSTRAINT legs_departure FOREIGN KEY ( departure )
        REFERENCES airport ( serial_num );

ALTER TABLE price
    ADD CONSTRAINT prices_arrival FOREIGN KEY ( arrival )
        REFERENCES airport ( serial_num );

ALTER TABLE price
    ADD CONSTRAINT prices_departure FOREIGN KEY ( departure )
        REFERENCES airport ( serial_num );

ALTER TABLE reservation
    ADD CONSTRAINT reserv_price FOREIGN KEY ( ticket_id )
        REFERENCES price ( ticket_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_customer FOREIGN KEY ( customer_id )
        REFERENCES customer ( id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_leg FOREIGN KEY ( leg_num )
        REFERENCES leg ( leg_num );

ALTER TABLE reservation
    ADD CONSTRAINT responsibility FOREIGN KEY ( emp_id )
        REFERENCES employee ( id );

CREATE OR REPLACE VIEW Airport_Info  AS
SELECT a.name  AS ���׸�,
  l.departure  AS �����,
  l.via        AS ������,
  l.arriv_time AS �����ð�
FROM Airport a,
  Leg l
WHERE a.serial_num = l.arrival 
;

CREATE OR REPLACE VIEW Cust_Reservation ( "�� �̸�", �����, ������, ��߽ð�, �����ð�, �װ���, ����, ž�°���, "���� ��¥", ������� ) AS
SELECT c.name   AS "�� �̸�",
  l.departure   AS �����,
  l.arrival     AS ������,
  l.dep_time    AS ��߽ð�,
  l.arriv_time  AS �����ð�,
  l.flight_num  AS �װ���,
  p.price       AS ����,
  lc.c          AS ž�°���,
  r.reserv_date AS "���� ��¥",
  e.name        AS �������
FROM Customer c,
  Leg l,
  Price p,
  Employee e,
  Reservation r,
  (SELECT Reservation.leg_num,
    COUNT(*) c
  FROM Reservation
  GROUP BY Reservation.leg_num
  ) lc
WHERE c.id      = r.customer_id
AND r.leg_num   = l.leg_num
AND r.ticket_id = p.ticket_id
AND r.emp_id    = e.id
AND r.leg_num   = lc.leg_num 
;

CREATE OR REPLACE VIEW Emp_Manage  AS
SELECT e.name AS "���� �̸�",
  c.name      AS ����,
  l.departure AS �����,
  l.arrival   AS ������,
  c.name      AS "ž�°� �̸�",
  c.passport  AS "ž�°� ���ǹ�ȣ",
  f.model     AS "�װ��� ����"
FROM Customer c,
  Reservation r,
  Employee e,
  Leg l,
  Flight f
WHERE c.id       = r.customer_id
AND e.id         = r.emp_id
AND l.leg_num    = r.leg_num
AND f.flight_num = l.flight_num
ORDER BY "���� �̸�" 
;

CREATE OR REPLACE VIEW Flight_Schedule  AS
SELECT LPAD(Leg.dep_time, 10) AS ��¥,
  Leg.departure               AS �����,
  Leg.arrival                 AS ������,
  Leg.flight_num              AS "�װ��� ��ȣ",
  Leg.dep_time                AS ��߽ð�,
  Leg.arriv_time              AS �����ð�
FROM Leg
ORDER BY ��߽ð� 
;



-- Oracle SQL Developer Data Modeler ��� ����: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              4
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

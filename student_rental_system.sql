create table renter(
    renter_ic varchar2(40) 
        constraint renter_ic_pk primary key,
    renter_name varchar2(40)
        constraint renter_name_nn not null,
    renter_email varchar2(40)
        constraint renter_email_nn not null
        constraint renter_email_unique unique,
    renter_address varchar2(100)
        constraint renter_address_nn not null,
    renter_phoneNumber varchar2(40)
        constraint renter_phoneNumber_nn not null,
    renter_password varchar2(40)
        constraint renter_password_nn not null
);

         

create table landlord(
    landlord_ic varchar2(40) 
        constraint landlord_ic_pk primary key,
    landlord_name varchar2(40)
        constraint landlord_name_nn not null,
    landlord_email varchar2(40)
        constraint landlord_email_nn not null
        constraint landlord_email_unique unique,
    landlord_address varchar2(100)
        constraint landlord_address_nn not null,
    landlord_phoneNumber varchar2(40)
        constraint landlord_phoneNumber_nn not null,
    landlord_password varchar2(40)
        constraint landlord_password_nn not null,
    landlord_accountNumber varchar2(40)
        constraint landlord_accountNumber_nn not null,
    landlord_bankName varchar2(40)
        constraint landlord_bankName_nn not null
);


                 
create table house(
    house_id number(20)
        constraint house_id_pk primary key,
    house_address varchar2(40)
        constraint house_address_nn not null,
    house_area varchar2(40)
        constraint house_area_nn not null,
    house_price float(20)
        constraint house_price_nn not null,
    house_contract number(20)
        constraint house_contract_nn not null,
    house_capacity number(20)
        constraint house_capacity_nn not null,
    house_description varchar2(100)
        constraint house_description_nn not null,
    landlord_ic varchar2(40)
        constraint house_landlord_ic_fk references landlord(landlord_ic)
        constraint house_landlord_ic_name_nn not null
);



create table facility(
    facility_id number(20)
        constraint facility_id_pk primary key,
    facility_name varchar2(40)
        constraint facility_name_nn not null,
    facility_quantity number(20)
        constraint facility_quantity_nn not null,
    house_id number(20)
        constraint facility_house_id_fk references house(house_id)
        constraint facility_house_id_nn not null
);



create table rental(
    rental_id number(20)
        constraint rental_id_pk primary key,
    rental_register_date date default sysdate,
    rental_expired_date date default sysdate,
    rental_status varchar2(40)
        constraint rental_status_nn not null,
    renter_ic varchar2(40)
        constraint rental_renter_ic_fk references renter(renter_ic)
        constraint rental_renter_ic_nn not null,
    house_id number(20)
        constraint rental_house_id_fk references house(house_id)
        constraint rental_house_id_nn not null
);



create table payment(
    payment_id number(20)
        constraint payment_id_pk primary key,
    payment_date date default sysdate,
    payment_price float(20)
        constraint payment_price_nn not null,
    renter_ic varchar2(40)
        constraint payment_renter_ic_fk references renter(renter_ic)
        constraint payment_renter_ic_nn not null,
    landlord_ic varchar2(40)
        constraint payment_landlord_ic_fk references landlord(landlord_ic)
        constraint payment_landlord_ic_nn not null
);
create table film (
    film_id bigint auto_increment primary key,
    titel varchar(255) not null,
    dauer integer not null,
    inhalt mediumtext,
    fsk_freigabe integer,
    erscheinungsjahr date
);
create table gerne (
    gerne_id bigint auto_increment primary key,
    gerne varchar(255) not null
);
create table film_gerne (
    film_gerne_id bigint auto_increment primary key,
    film_id bigint not null,
    gerne_id bigint not null,
    foreign key (film_id) references film(film_id),
    foreign key (gerne_id) references gerne(gerne_id)
);
create table programm (
    programm_id bigint auto_increment primary key,
    film_id bigint not null,
    raum_id bigint not null,
    datum datetime not null,
    vorfuehrzeit datetime not null
    
)
create table raum (
    raum_id bigint auto_increment primary key,
    name varchar(255) not null,
    3d tinyint default 0 not null, 
    kapazitaet integer not null
);

create table sitzplatz (
    sitzplatz_id bigint auto_increment primary key,
    reihe integer not null,
    nummer integer not null,
    preise_kategorie_id varchar(50) not null,
    buchung_id bigint,
    raum_id bigint not null,
    foreign key (raum_id) references raum (raum_id)
);
create table kunde(
    kunde_id bigint auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null unique,
    passwort varchar(255) not null,
    geburstag date not null
)
create table preise_kategorie(
    preise_kategorie_id varchar(50) primary key,
    preis decimal(10,2) not null
)
create table buchung (
    buchung_id bigint auto_increment primary key,
    kunde_id bigint not null,
    programm_id bigint not null,
    buchungsdatum timestamp not null,
    foreign key (kunde_id) references kunde(kunde_id),
    foreign key (programm_id) references programm(programm_id)
);
create table werbung (
    werbung_id bigint auto_increment primary key,
    slogan mediumtext not null,
    startdatum date not null,
    enddatum date not null,
    menu_id bigint not null
);
create table menu (
    menu_id bigint auto_increment primary key,
    name varchar(255) not null,
    beschreibung mediumtext
);

alter table programm
    add foreign key (film_id) references film(film_id),
    add foreign key (raum_id) references raum(raum_id);

alter table sitzplatz
    add foreign key (buchung_id) references buchung(buchung_id);
    add foreign key (preise_kategorie_id) references preise_kategorie (preise_kategorie_id);

alter table werbung
    add foreign key (menu_id) references menu(menu_id);
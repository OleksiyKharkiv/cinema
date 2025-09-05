create table film (
    film_id bigint auto_increment primary key,
    titel varchar(255) not null,
    dauer integer not null,
    inhalt mediumtext,
    fsk_freigabe integer,
    erscheinungsjahr date
);
create table genre (
    genre_id bigint auto_increment primary key,
    genre varchar(255) not null
);
create table film_genre (
    film_genre_id bigint auto_increment primary key,
    film_id bigint not null,
    genre_id bigint not null,
    foreign key (film_id) references film(film_id),
    foreign key (genre_id) references genre(genre_id)
);
create table programm (
    programm_id bigint auto_increment primary key,
    film_id bigint not null,
    raum_id bigint not null,
    datum datetime not null,
    vorfuehrzeit datetime not null
    
);
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
    foreign key (raum_id) references raum(raum_id)
);
create table kunde(
    kunde_id bigint auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null unique,
    passwort varchar(255) not null,
    geburstag date not null
);
create table preise_kategorie(
    preise_kategorie_id varchar(50) primary key,
    preis decimal(10,2) not null
);
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
    add foreign key (buchung_id) references buchung(buchung_id),
    add foreign key (preise_kategorie_id) references preise_kategorie(preise_kategorie_id);

alter table werbung
    add foreign key (menu_id) references menu(menu_id);

insert into film (titel, dauer, inhalt, fsk_freigabe, erscheinungsjahr ) 
values (
    'Inception', 148, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 13, '2010-07-16'
),
('Revolver', 110, 'A gambler named Jake Green is released from prison after serving seven years for a crime he did not commit. He is determined to find the real culprits.', 16, '2005-12-02'),
('The Dark Knight', 152, 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 16, '2008-07-18'),
('Interstellar', 169, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', 13, '2014-11-07'),
('The Matrix', 136, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 16, '1999-03-31'),
('Gladiator', 155, 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery', 16, '2000-05-05'),
('Interstellar', 169, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', 13, '2014-11-07'),
('The Matrix', 136, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 16, '1999-03-31'),
('Gladiator', 155, 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into exile.', 16, '2000-05-05');
insert into genre (genre) values 
('Action'),
('Adventure'),
('Animation'),
('Sci-Fi'),
('Drama'),
('Thriller'),
('Crime'),
('Fantasy'),
('Comedy'),
('Biography'),
('History'),
('War'),
('Mystery'),
('Romance'),
('Family'),
('Musical'),
('Horror'),
('Sport'),
('Western'),
('Historical');
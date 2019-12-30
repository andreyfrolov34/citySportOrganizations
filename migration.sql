CREATE DATABASE city_sport_organizations;

-- CREATE TABLE "city" -----------------------------------------
CREATE TABLE IF NOT EXISTS city (
        id Serial primary key,
        name Character( 50 ) NOT NULL);
;
insert into city (name)
    values
        ('Zaporozhye'), ('Melitopol'), ('Enerhodar');
-- -------------------------------------------------------------

-- CREATE TABLE "club" -----------------------------------------
CREATE TABLE IF NOT EXISTS club (
        id Serial NOT NULL primary key,
        name Character( 50 ) NOT NULL,
        city_id integer references city(id));
;
insert into club (name, city_id)
    values
        ('Dinamo', 1), ('Spartak', 1), ('motor', 1);
-- -------------------------------------------------------------

-- CREATE TABLE "kind_sport" -----------------------------------------
CREATE TABLE IF NOT EXISTS kind_sport (
      id Serial primary key,
      name Character( 100 ) NOT NULL);
;
insert into kind_sport (name)
    values
        ('handball'), ('boxing'), ('swimming');
-- -------------------------------------------------------------

-- CREATE TABLE "trainer" -----------------------------------------
CREATE TABLE IF NOT EXISTS trainer (
       id Serial NOT NULL primary key,
       club_id integer references club ( id ),
       kind_sport_id integer references kind_sport ( id ))
;
-- -------------------------------------------------------------

-- CREATE TABLE "sportsman" -----------------------------------------
CREATE TABLE IF NOT EXISTS sportsman (
        id Serial NOT NULL primary key,
         name varchar( 50 ),
         kind_sport_id integer references kind_sport ( id ),
         club_id integer references club ( id ),
         sport_category_id integer references sport_category ( id ))
;
insert into sportsman (name, club_id, sport_category_id)
    values
        ('Vasya', 3, 5),
        ('Victor', 3, 4),
        ('Petya', 3, 4);
-- -------------------------------------------------------------

-- CREATE TABLE "medalist" -----------------------------------------
CREATE TABLE IF NOT EXISTS medalist (
        id Serial NOT NULL primary key,
        medal_value varchar( 50 ),
        sport_facility_id integer references sport_facility ( id ),
        sportsman_id integer references sportsman ( id ))
;
-- -------------------------------------------------------------

-- CREATE TABLE "sport_category" -----------------------------------------
CREATE TABLE IF NOT EXISTS sport_category (
         id Serial NOT NULL primary key,
         name varchar( 50 ),
         authority integer)
;
insert into sport_category (name, authority)
    values
        ('First-Class Sportsman', 1),
        ('Second-Class Sportsman', 2),
        ('Third-Class Sportsman', 3),
        ('Candidate for Master of Sport', 4),
        ('Master of Sport', 5),
        ('Master of sport international class', 6),
        ('Merited master of sport', 7);
    -- -------------------------------------------------------------

-- CREATE TABLE "sportsman_has_trainer" ------------------------------------
CREATE TABLE IF NOT EXISTS sportsman_has_trainer (
        sportsman_id integer NOT NULL,
        trainer_id integer  NOT NULL,
        primary key (sportsman_id, trainer_id),
        FOREIGN KEY (sportsman_id) REFERENCES sportsman ( id ),
        FOREIGN KEY (trainer_id ) REFERENCES trainer ( id ))
;
-- -------------------------------------------------------------

-- CREATE TABLE "sportsman_has_trainer" ------------------------------------
CREATE TABLE IF NOT EXISTS sportsman_has_kindSport (
        sportsman_id integer NOT NULL,
        kind_sport_id integer  NOT NULL,
        primary key (sportsman_id, kind_sport_id),
        FOREIGN KEY (sportsman_id) REFERENCES sportsman ( id ),
        FOREIGN KEY (kind_sport_id ) REFERENCES kind_sport ( id ))
;
-- -------------------------------------------------------------

-- CREATE TABLE "sport_facility_category" ------------------------------------
CREATE TABLE IF NOT EXISTS sport_facility_category (
        id serial not null primary key,
        name varchar ( 50 )
)
;
-- -------------------------------------------------------------

-- CREATE TABLE "sport_cover" ------------------------------------
CREATE TABLE IF NOT EXISTS sport_cover (
        id serial not null primary key,
        name varchar ( 50 )
)
;
-- -------------------------------------------------------------

-- CREATE TABLE "sport_facility" ------------------------------------
CREATE TABLE IF NOT EXISTS sport_facility (
        id serial not null primary key,
        city_id integer,
        seats_quantity integer,
        sports_facility_category_id integer,
        sports_cover_id integer,
        foreign key ( city_id) references city ( id ),
        foreign key ( sports_cover_id ) references sport_cover,
        foreign key ( sports_facility_category_id ) references sport_facility_category)
;
-- -------------------------------------------------------------

-- CREATE TABLE "sport_competition" ------------------------------------
CREATE TABLE IF NOT EXISTS sport_competition (
        id serial not null primary key,
        competition_organizer_id integer,
        start_date date,
        end_date date,
        name varchar ( 255 ),
        sport_facility_id integer,
        foreign key ( competition_organizer_id) references competition_organizer ( id ),
        foreign key ( sport_facility_id) references sport_facility ( id ))
;
-- -------------------------------------------------------------

-- CREATE TABLE "competition_organizer" ------------------------------------
CREATE TABLE IF NOT EXISTS competition_organizer (
        id serial not null primary key,
        name varchar ( 255 ))
;
-- -------------------------------------------------------------

CREATE SEQUENCE seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 30;

--PAROLE----------------------------------------------
CREATE TABLE parole
(
    parola_id number(5) constraint pk_parole primary key,
    parola_nume varchar(100) constraint parola_nume not null,
    nivel_securitate number(5) constraint securitate not null
);

INSERT INTO parole
VALUES (1, 'andrei2004', 5);

INSERT INTO parole
VALUES (2, 'asdasdasdasd', 7);

INSERT INTO parole
VALUES (3, '!Bucuresti2024', 9);

INSERT INTO parole
VALUES (4, '!AlexAvg 20', 10);

INSERT INTO parole
VALUES (5, 'tat', 2);

INSERT INTO parole
VALUES (6, 'Ianuarie2004', 8);

INSERT INTO parole
VALUES (7, 'a', 1);

INSERT INTO parole
VALUES (8, 'abc', 2);

INSERT INTO parole
VALUES (9, 'abc', 2);

INSERT INTO parole
VALUES (10, '!Ale 20', 9);

select *
from parole;

--ADRESE-------------------------------------------
CREATE TABLE adrese
(
    adresa_id number(5) constraint pk_adrese primary key,
    strada varchar(100) constraint strada not null,
    numar_strada number(5) constraint nr_strada not null,
    apartament number(5) constraint apartament not null
);

INSERT INTO adrese
VALUES (1, 'Aleea laleleor', 8, 12);

INSERT INTO adrese
VALUES (2, 'Aleea bratescu', 2, 3);

INSERT INTO adrese
VALUES (3, 'Aleea bratescu', 2, 23);

INSERT INTO adrese
VALUES (4, 'Aleea Drumul Taberei', 6, 1);

INSERT INTO adrese
VALUES (5, 'Aleea Arena', 11, 8);

select *
from adrese;

--LOCATII-----------------------------------------------
CREATE TABLE locatii
(
    locatie_id number(5) constraint pk_locatii primary key,
    adresa_id number(5),
    oras varchar(100) constraint oras not null,
    tara varchar(100) constraint tara not null,
    constraint fk_adresa FOREIGN KEY (adresa_id) REFERENCES adrese(adresa_id)
);

INSERT INTO locatii
VALUES (1, 1, 'Bucuresti', 'Romania');

INSERT INTO locatii
VALUES (2, 5, 'Bucuresti', 'Romania');

INSERT INTO locatii
VALUES (3, 2, 'Suceava', 'Romania');

INSERT INTO locatii
VALUES (4, 3, 'Atena', 'Grecia');

INSERT INTO locatii
VALUES (5, 4, 'Bucuresti', 'Romania');

select *
from locatii;

--UTILIZATORI--------------------------------------------------------
CREATE TABLE utilizatori
(
    utilizator_id number(5) constraint pk_utilizator primary key,
    nume varchar(100) constraint nume_utilizator not null,
    prenume varchar(100) constraint prenume_utilizator not null,
    email varchar(100) constraint email_utilizator not null,
    parola_id number(5),
    locatie_id number(5),
    data_inregistrare date,
    constraint fk_parola FOREIGN KEY (parola_id) REFERENCES parole(parola_id),
    constraint fk_locatie FOREIGN KEY (locatie_id) REFERENCES locatii(locatie_id)
    
);

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Popescu', 'Andrei', 'popescu_andrei@gmail.com', 1, 1, TO_DATE('04/12/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Dimitrie', 'Roxana', 'dimitrie_roxx@gmail.com', 3, 4, TO_DATE('12/06/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Ionescu', 'Maria', 'ionescu_maria@gmail.com', 2, 2, TO_DATE('05/11/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Georgescu', 'Mihai', 'georgescu_mihai@gmail.com', 5, 3, TO_DATE('06/10/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Vasilescu', 'Elena', 'vasilescu_elena@gmail.com', 4, 3, TO_DATE('22/12/2023', 'DD/MM/YYYY'));

INSERT INTO utilizatori
VALUES (seq.NEXTVAL, 'Ionescu', 'Elena', 'ionescu_elena@gmail.com', 7, 2, TO_DATE('05/11/2023', 'DD/MM/YYYY'));

select *
from utilizatori;

--GRUPURI--------------------------------------------------------------------------
CREATE TABLE grupuri
(
    grup_id number(5) constraint pk_grup primary key,
    denumire varchar(100) constraint denumire_grup not null
);

INSERT INTO grupuri
VALUES (100, 'Scoala');

INSERT INTO grupuri
VALUES (101, 'La munca');

select *
from grupuri;

--UTILIZATORI_SI_GRUPURI----------------------------------------------
CREATE TABLE utilizatori_si_grupuri
(
    utilizator_id number(5),
    grup_id number(5),
    constraint pk_util_gr primary key (utilizator_id, grup_id)
);

INSERT INTO utilizatori_si_grupuri
VALUES (21, 100);

INSERT INTO utilizatori_si_grupuri
VALUES (22, 100);

INSERT INTO utilizatori_si_grupuri
VALUES (21, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (23, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (24, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (25, 101);

INSERT INTO utilizatori_si_grupuri
VALUES (26, 101);

select *
from utilizatori_si_grupuri;

--FOTOGRAFII-------------------------------------------------
CREATE TABLE fotografii
(
    fotografie_id number(5) constraint pk_foto primary key,
    album_id number(5),
    titlu varchar(100) not null,
    constraint fk_album FOREIGN KEY (album_id) REFERENCES albume_fotografii(album_id)
);

INSERT INTO fotografii
VALUES (1, 100, 'Poza1');

INSERT INTO fotografii
VALUES (2, 100, 'Piscina');

INSERT INTO fotografii
VALUES (3, 100, 'Poza speciala');

INSERT INTO fotografii
VALUES (4, 101, 'Prima poza');

INSERT INTO fotografii
VALUES (5, 102, 'Rasarit');

INSERT INTO fotografii
VALUES (6, 102, 'La meci');

INSERT INTO fotografii
VALUES (7, 103, 'Poza Anglia');

INSERT INTO fotografii
VALUES (8, 104, 'Gratar');

select *
from fotografii;

--ALBUME_FOTOGRAFII-------------------------------------------------------------
CREATE TABLE albume_fotografii
(
    album_id number(5) constraint pk_album primary key,
    utilizator_id number(5),
    album_nume varchar(100) constraint nume_album not null,
    data_album date,
    constraint fk_util FOREIGN KEY (utilizator_id) REFERENCES utilizatori(utilizator_id)
);

INSERT INTO albume_fotografii
VALUES (100, 21, 'La mare', TO_DATE('25/12/2023', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (101, 21, 'Ziua mea', TO_DATE('01/02/2024', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (102, 23, 'Scoala', TO_DATE('29/11/2023', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (103, 24, 'Facultate', TO_DATE('15/08/2023', 'DD/MM/YYYY'));

INSERT INTO albume_fotografii
VALUES (104, 24, 'La mare', TO_DATE('02/03/2024', 'DD/MM/YYYY'));

select *
from albume_fotografii;

--PIESE--------------------------------------------------------------
CREATE TABLE piese
(
    piesa_id number(5) constraint pk_piesa primary key,
    piesa_nume varchar(100) not null,
    artist_nume varchar(100) not null
);

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (1, 'Shape of You', 'Ed Sheeran');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (2, 'Blinding Lights', 'The Weeknd');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (3, 'Levitating', 'Dua Lipa');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (4, 'Bad Guy', 'Billie Eilish');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (5, 'Rockstar', 'Post Malone');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (6, 'Old Town Road', 'Lil Nas X');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (7, 'Senorita', 'Camila Cabello');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (8, 'Circles', 'Post Malone');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (9, 'Havana', 'Camila Cabello');

INSERT INTO piese (piesa_id, piesa_nume, artist_nume)
VALUES (10, 'My Eyes', 'Travis Scott');

select *
from piese;

--plylisturi_muzicale---------------------------------------------------------------
CREATE TABLE playlisturi_muzicale
(
    playlist_id number(5) constraint pk_playlist primary key,
    playlist_nume varchar(100) not null
);

INSERT INTO playlisturi_muzicale
VALUES (1, 'Piesele mele');

INSERT INTO playlisturi_muzicale
VALUES (2, 'Distractie');

INSERT INTO playlisturi_muzicale
VALUES (3, 'Relaxare');

select *
from playlisturi_muzicale;

--PLAYLISTURI_SI_PIESE-----------------------------------------------------------------
CREATE TABLE playlisturi_si_piese
(
    piesa_id number(5),
    playlist_id number(5),
    utilizator_id number(5),
    constraint pk_playlist_piese primary key (piesa_id, playlist_id),
    constraint fk_utiliz foreign key (utilizator_id) REFERENCES utilizatori(utilizator_id)
);

INSERT INTO playlisturi_si_piese
VALUES (1, 1, 21);

INSERT INTO playlisturi_si_piese
VALUES (2, 1, 21);

INSERT INTO playlisturi_si_piese
VALUES (5, 1, 21);

INSERT INTO playlisturi_si_piese
VALUES (1, 2, 23);

INSERT INTO playlisturi_si_piese
VALUES (8, 3, 24);

INSERT INTO playlisturi_si_piese
VALUES (9, 3, 24);

INSERT INTO playlisturi_si_piese
VALUES (2, 3, 24);

select *
from playlisturi_si_piese;

--ISTORIC_PAROLE-----------------------------------------------------------------------
CREATE TABLE istoric_parole
(
    utilizator_id number(5),
    data_schimbare date,
    parola_id number(5),
    constraint pk_istoric primary key(utilizator_id, data_schimbare),
    constraint fk_parola_istoric foreign key (parola_id) references parole(parola_id)
);
 
INSERT INTO istoric_parole
VALUES (22, TO_DATE('27/12/2023', 'DD/MM/YYYY'), 8);

INSERT INTO istoric_parole
VALUES (22, TO_DATE('01/01/2024', 'DD/MM/YYYY'), 9);

INSERT INTO istoric_parole
VALUES (24, TO_DATE('30/12/2023', 'DD/MM/YYYY'), 10);
 
select *
from istoric_parole;
 
 --12

--1. Sa se afiseze utilizatorii care au creat playlisturi, piesele din aceste playlisturi si artistul fiec?rei piese, in ordine crescatoare dupa nume. 

SELECT u.nume, u.prenume, pm.playlist_nume, p.piesa_nume, p.artist_nume
FROM utilizatori u, playlisturi_muzicale pm, piese p, playlisturi_si_piese pp
WHERE u.utilizator_id = pp.utilizator_id
and pp.piesa_id = p.piesa_id
and pp.playlist_id = pm.playlist_id
order by 1;
 
--2. Sa se afiseze utilizatorii care au o parol? cu nivelul de securitate mai mare de 6, numele ?i prenumele lor,
--împreun? cu numele ora?ului, strada si parola. Utilizeaz? func?ii pe ?iruri de caractere pentru a transforma numele si prenumele în majuscule ?i
--pentru a concatena numele ?i prenumele. Filtreaz? rezultatele pentru a include doar utilizatorii înregistra?i în ultimele 10 luni.
SELECT UPPER(u.nume) nume, UPPER(u.prenume) prenume, CONCAT(u.nume, CONCAT(' ',u.prenume)) nume_complet, l.oras, a.strada,
                                                                                        p.parola_nume, p.nivel_securitate
FROM utilizatori u
JOIN parole p ON u.parola_id = p.parola_id
JOIN locatii l ON u.locatie_id = l.locatie_id
JOIN adrese a ON l.adresa_id = a.adresa_id
WHERE p.nivel_securitate > 6
  AND u.data_inregistrare > ADD_MONTHS(SYSDATE, -10);

--3.Selecteaz? utilizatorii care sunt membri ai grupului "La munca", împreun? cu numele albumelor lor ?i
--num?rul total de fotografii din aceste albume. Utilizeaz? DECODE pentru a afi?a un mesaj personalizat daca sunt una sau mai multe fotografii.
--Sa se ordoneze rezultatele obtinute dupa coloana numelui utilizatorului.
SELECT u.utilizator_id, u.nume, u.prenume, a.album_nume,(SELECT COUNT(*)
                                                         FROM fotografii f
                                                         WHERE f.album_id = a.album_id) numar_fotografii,
                                                         DECODE((SELECT COUNT(*)           
                                                         FROM fotografii f
                                                         WHERE f.album_id = a.album_id),
                                                         1, 'O singura fotografie',
                                                         'Mai multe fotografii') status_fotografii
FROM utilizatori u, utilizatori_si_grupuri ug, grupuri g, albume_fotografii a
WHERE u.utilizator_id = ug.utilizator_id
and  ug.grup_id = g.grup_id
and  u.utilizator_id = a.utilizator_id
and g.denumire = 'La munca'
ORDER BY u.nume;

--4. Selecteaz? utilizatorii care sunt membri ai grupului "Scoala", împreun? cu ora?ul în care
--locuiesc. Utilizeaz? un bloc de cerere WITH pentru a ob?ine utilizatorii din grupul "Scoala".
WITH utilizatori_grup_scoala as (
    SELECT ug.utilizator_id
    FROM utilizatori_si_grupuri ug, grupuri g
    WHERE ug.grup_id = g.grup_id
    and g.denumire = 'Scoala'
)
SELECT INITCAP(u.nume), INITCAP(u.prenume), l.oras
FROM utilizatori u, locatii l
WHERE u.locatie_id = l.locatie_id
and u.utilizator_id IN (SELECT utilizator_id FROM utilizatori_grup_scoala);

--5. Sa se afiseze ora?ele ?i num?rul de utilizatori din fiecare ora?.
--Filtreaz? rezultatele pentru a avea doar orase care contin litera 'u'.
SELECT l.oras, COUNT(u.utilizator_id) numar_utilizatori
FROM utilizatori u, locatii l
WHERE u.locatie_id = l.locatie_id
GROUP BY l.oras
HAVING l.oras like '%u%';

--a. ?terge toate albumele care nu con?in nicio fotografie.

INSERT INTO albume_fotografii
VALUES (110, 21, 'Album gol', TO_DATE('02/02/2024', 'DD/MM/YYYY'));

DELETE FROM albume_fotografii a
WHERE a.album_id NOT IN (
    SELECT f.album_id
    FROM fotografii f
);

--b. Actualizeaz? adresa utilizatorilor care au creat cel pu?in un album, setând num?rul str?zii la 99.
UPDATE adrese a
SET a.numar_strada = 99
WHERE a.adresa_id IN (
    SELECT l.adresa_id
    FROM locatii l
    JOIN utilizatori u ON l.locatie_id = u.locatie_id
    JOIN albume_fotografii af ON u.utilizator_id = af.utilizator_id
);

--c. Actualizeaz? nivelul de securitate al parolelor la 6 pentru utilizatorii care locuiesc în "Suceava".
UPDATE parole p
SET p.nivel_securitate = 6
WHERE p.parola_id IN (
    SELECT u.parola_id
    FROM utilizatori u
    JOIN locatii l ON u.locatie_id = l.locatie_id
    WHERE l.oras = 'Suceava'
);

--Ob?ine?i o list? cu to?i utilizatorii ?i informa?iile lor (nume, prenume, email), loca?iile lor (ora?, ?ar?), grupurile
--din care fac parte ?i numele albumelor lor, inclusiv utilizatorii care nu au loca?ii, grupuri sau albume asociate.
SELECT u.nume, u.prenume, u.email, l.oras, l.tara, g.denumire, af.album_nume
FROM utilizatori u
LEFT JOIN locatii l ON u.locatie_id = l.locatie_id
LEFT JOIN utilizatori_si_grupuri ug ON u.utilizator_id = ug.utilizator_id
LEFT JOIN grupuri g ON ug.grup_id = g.grup_id
LEFT JOIN albume_fotografii af ON u.utilizator_id = af.utilizator_id;


--G?si?i utilizatorii care au ad?ugat toate piesele artistului Post Malone în oricare dintre playlisturile lor.

SELECT u.utilizator_id, u.nume, u.prenume
FROM utilizatori u
WHERE NOT EXISTS (
    SELECT p.piesa_id
    FROM piese p
    WHERE p.artist_nume = 'The Weeknd'
    MINUS
    SELECT pp.piesa_id
    FROM playlisturi_si_piese pp
    WHERE pp.utilizator_id = u.utilizator_id
);


--G?si?i top 3 utilizatori care au creat cele mai multe albume.

SELECT *
FROM (
    SELECT u.utilizator_id, u.nume, u.prenume, COUNT(af.album_id) numar_albume
    FROM utilizatori u
    JOIN albume_fotografii af ON u.utilizator_id = af.utilizator_id
    GROUP BY u.utilizator_id, u.nume, u.prenume
    ORDER BY numar_albume DESC
)
WHERE ROWNUM <= 3;








 
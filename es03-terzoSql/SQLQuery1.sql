/*Film di  fellini dopo 1960*/
SELECT Titolo
FROM Film 
WHERE Regista='Fellini' 
AND AnnoProduzione>1960

/*Il titolo e la durata dei film di fantascienza giapponesi o francesi prodotti dopo il 1990*/
SELECT Titolo,Durata
FROM Film f
WHERE f.Genere='Fantascienza'
AND (f.Nazionalita='JP' OR f.Nazionalita='FR')
AND f.AnnoProduzione>1990

/*Il titolo dei film di fantascienza giapponesi prodotti dopo il 1990 oppure francesi*/
SELECT Titolo
FROM Film f
WHERE f.Genere='Fantascienza' 
AND ((f.Nazionalita='JP' AND f.AnnoProduzione>1990)OR Nazionalita='Fr')

/*I titolo dei film dello stesso regista di “Casablanca”*/
SELECT *
FROM Film f
WHERE f.Regista=(SELECT f1.Regista FROM Film f1 WHERE f1.Titolo='Casablanca')

/*Il titolo ed il genere dei film proiettati il giorno di Natale 2004*/
SELECT DISTINCT f.Titolo,f.Genere
FROM Film f,Proiezioni p
WHERE f.CodFilm=p.CodFilm
AND p.DataProiezione=/*'25/12/2004'*/'20041225'

/*Il titolo ed il genere dei film proiettati a Napoli il giorno di Natale 2004*/
SELECT DISTINCT f.Titolo,f.Genere
FROM Film f,Proiezioni p,Sale s
WHERE f.CodFilm=p.CodFilm AND p.CodSala=s.CodSala AND s.Citta='Napoli' 
AND p.DataProiezione='20041225'

/*I nomi delle sale di Napoli in cui il giorno di Natale 2004 è stato proiettato un film con R.Williams*/
SELECT DISTINCT s.Nome
FROM Sale s,Recita r, Proiezioni p,Attori a
WHERE s.CodSala=p.CodSala AND r.CodFilm=p.CodFilm AND r.CodAttore=a.CodAttore
AND p.DataProiezione='20041225' AND s.Citta='Napoli' AND a.Nome='R.Williams'

/*Il titolo dei film in cui recitano M. Mastroianni e S.Loren*/
SELECT *
FROM Film f,Attori a,Recita r
WHERE f.CodFilm=r.CodFilm AND a.CodAttore=r.CodAttore
and F.CodFilm IN
(SELECT f.Titolo
FROM Film f,Attori a,Recita r
WHERE f.CodFilm=r.CodFilm AND a.CodAttore=r.CodAttore
AND a.Nome='Mastroianni') AND a.Nome='Loren'


/*Per ogni film in cui recita un attore francese, il titolo del film e il nome dell’attore*/
SELECT DISTINCT f.Titolo,a.Nome
FROM Film f,Attori A, Recita r
WHERE f.CodFilm=r.CodFilm AND r.CodAttore=a.CodAttore
AND a.Nazionalita='FR'

/*Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala.*/
SELECT f.Titolo,s.Nome
FROM Film f, Sale s, Proiezioni p
WHERE f.CodFilm=p.CodFilm AND p.CodSala=s.CodSala
AND s.Citta='Pisa' AND p.DataProiezione BETWEEN '20050101' AND '20050131'


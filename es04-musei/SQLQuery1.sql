/*Per ciascun museo di Londra, il numero di opere di artisti italiani ivi conservate*/
SELECT m.NomeM,count(*) as NumeroOpere
FROM Artisti a,Opere o, Musei m
WHERE a.Nazionalità='IT'
AND a.NomeA=o.NomeA AND m.NomeM=o.NomeM
AND m.Città='Londra'
GROUP BY m.NomeM

/*Il nome dei musei di londra che non hanno opere di Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE m.Città='Londra'
AND NOT EXISTS(SELECT * 
			   FROM Opere o 
			   WHERE o.NomeA='Tiziano'
			   AND o.NomeM=m.NomeM)  /*devo collegarmi alla query esterna*/

/*9 2.0)Il nome dei musei di londra che non hanno opere di Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE m.Città='Londra'
AND 'Tiziano' NOT IN (SELECT * FROM Opere o WHERE o.NomeM=m.NomeM)

/*10)Il nome dei musei di londra che hanno opere di Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE m.Città='Londra'
AND NOT EXISTS(SELECT *   /*not exist restituisce un booleano*/
			   FROM Opere o 
			   WHERE o.NomeA<>'Tiziano'
			   AND o.NomeM=m.NomeM)

/*10 2.0)Il nome dei musei di londra che hanno opere di Tiziano*/
SELECT *
FROM Musei m
WHERE m.Città='Londra'
AND 'Tiziano'= ALL(SELECT o.NomeA
			   FROM Opere o 
			   WHERE o.NomeM=m.NomeM)

/*11) Per ciascun artista, il nome dell'artista e il numero di sue opere conservata alla galleria degli uffizzi*/
SELECT a.NomeA, count(*) as NumeroOpere
FROM Artisti a, Musei m, Opere o
WHERE a.NomeA=o.NomeA AND m.NomeM=o.NomeM
AND m.NomeM='Galleria degli uffizzi'
GROUP BY a.NomeA

/*12 i musei che conservano almeno 20 opere di artisti italiani*/
SELECT	o.NomeM
FROM Opere o,Artisti a
WHERE a.Nazionalita='IT' AND o.NomeA=a.NomeA
GROUP BY o.NomeM
HAVING Count(*)>=20 /*having lavora solo sui record della group by*/

SELECT *
FROM Opere o,Artisti a
WHERE 20<=(SELECT COUNT(*)
		   FROM Opere o,Artisti a
		   WHERE o.NomeA=a.NomeA
		   AND a.Nazionalita='IT')
/*13*/
SELECT a.NomeA, o.Titolo
FROM Artisti a, Personaggi p, Opere o
WHERE a.Nazionalita='IT'
AND p.Codice=o.Codice AND a.NomeA=o.NomeA
AND NOT EXISTS(SELECT *
			   FROM Personaggi p
			   WHERE p.Codice=o.Codice)

/*14 il nome dei musei di londra che non conservano opere di artisti italiani, eccetto tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE m.Città='Londra'
AND NOT EXISTS(SELECT * 
               FROM Opere o , Artisti a
               WHERE (o.NomeA<>'Tiziano' or a.Nazionalita = 'italiano')
               AND o.NomeM=m.NomeM)

/*15 Per ogni museo, il numero di opere divise per la nazionalità dell'artista*/
SELECT o.NomeM,a.Nazionalita, COUNT(*) AS nOpere
FROM Artisti a,Opere o
WHERE a.NomeA=o.NomeA
GROUP BY o.nomwM,a.Nazionalita
ORDER BY o.NomeM


UPDATE Artisti
SET Nazionalita='ES'
WHERE NomeA='Picasso'
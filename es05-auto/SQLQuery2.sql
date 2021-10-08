/*Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV*/
SELECT a.Targa, a.Marca
FROM Auto a
WHERE a.Cilindrata > 2000 or a.Potenza > 120 

/*Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV*/
SELECT p.Nome, a.Targa
FROM Proprietari p, Auto a
WHERE (a.Cilindrata > 2000 or a.Potenza > 120) and a.CodF=p.CodF

/*Targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV, assicurate presso la “SARA”*/
SELECT Targa, Proprietari.Nome
FROM Auto Au, Proprietari P, Assicurazioni Ass
WHERE (Au.Cilindrata > 2000 or Au.Potenza > 120) and Ass.Nome='Sara' and Au.CodF=P.CodF and
Au.CodAss=Ass.CodAss

/*Targa e Nome del proprietario delle Auto assicurate presso la “SARA” e coinvolte in sinistri il 20/01/02*/
SELECT Targa, Proprietari.Nome
FROM Auto Au, Proprietari P, Assicurazioni Ass, AutoCoinvolte AC, Sinistri S
WHERE Ass. Nome = 'Sara' and S.Data = 20/01/02 and Au.CodF = P.CodF
 and Au.CodAss = Ass.CodAss and Au.Targa = AC.Targa and ACo.CodS = S.CodS

/*Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate*/
SELECT Ass.Nome, Ass.Sede, count(*) as NumAuto
FROM Assicurazioni Ass, Auto Au
WHERE Au.CodAss = Ass.CodAss
GROUP BY Ass.CodAss, Ass.Nome, Ass.Sede

/*Per ciascuna auto “Fiat”, la targa dell’auto ed il numero di sinistri in cui è stata coinvolta*/
SELECT A.Targa, count(*) as NumSin
FROM Auto A, AutoCoinvolte AC
WHERE A. Marca='Fiat' and A.Targa=AC.Targa
GROUP BY A.Targa 

/*Per ciascuna auto coinvolta in più di un sinistro, la targa dell’auto, il nome dell’ Assicurazione ed il totale dei danni riportati*/
SELECT Au.Targa, Ass.Nome, sum(AC.ImportoDelDanno)
FROM AutoCoinvolte AC, Auto Au, Assicurazioni Ass
WHERE Au.Targa=AC.Targa and Au.CodAss=Ass.CodAss
GROUP BY Au,Targa, Ass.Nome
HAVING count(*) >1 

/*CodF e Nome di coloro che possiedono più di un’auto*/
SELECT P.CodF, P.Nome
FROM Proprietari P, Auto A
WHERE P.CodF = A.CodF
GROUP BY P.CodF, P.Nome
HAVING count(*) >1 

/*La targa delle auto che non sono state coinvolte in sinistri dopo il 20/01/01*/
SELECT A.Targa
FROM Auto A
WHERE A.Targa Not In (SELECT AC.Targa
					FROM AutoCoinvolte AC, Sinistri S
					WHERE AC.CodS=S.CodS and S.Data>20/01/01)

/* Il codice dei sinistri in cui non sono state coinvolte auto con cilindrata inferiore a 2000 cc*/
SELECT S.CodS
FROM Sinistri S
WHERE Not Exists ( SELECT *
				FROM AutoCoinvolte AC, Auto A
				WHERE A.Targa =AC.Targa and AC.CodS=S.CodS and A.Cilindrata<2000)
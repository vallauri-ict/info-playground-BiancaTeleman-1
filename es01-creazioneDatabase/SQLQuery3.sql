/*selezionare il nome e l'età e il salario
degli impiegati con più di 50 anni*/

SELECT nome,eta,salario
FROM Impiegato
WHERE eta>50;

/*2 le informazioni degli acquisti di item=2*/
SELECT *
FROM Acquisto
WHERE item=2;

/*3 nome,titolo e salario dei programmatori con salario >1400*/
SELECT nome,titolo,salario
FROM Impiegato
WHERE salario>1400
AND titolo='Programmatore';

/*4 nome di tutti i programmatori e analisti*/
SELECT nome
FROM Impiegato
WHERE titolo='Programmatore'
OR titolo='Analista';

/*5 Le diverse età degli impiegati*/
SELECT distinct eta /*distinct è per non ripetere*/
FROM Impiegato;

/*6 Stipendio medio degli impiegati*/
SELECT AVG(salario)  /*avg fa la media in automatico*/
FROM Impiegato;

/*7 tutti i dati di impiegato ordinati per salario dal maggiore al minore*/
SELECT *
FROM Impiegato
ORDER BY salario DESC /*dal più grande al più piccolo*/

/*8 tutti i dati di impiegato ordinati per salario e per etàdal maggiore al minore*/
SELECT *
FROM Impiegato
ORDER BY salario DESC,eta DESC /*dal più grande al più piccolo*/

/*9 Tutti i dati di Marta,Fabio e Ivan*/
SELECT *
FROM Impiegato
WHERE nome IN ('Marta','Fabio','Ivan') /*IN vuol dire: se il nome è tra questi, oppure utilizzo OR*/

/* tutti i dati degli impiegati tranne: Marta, Fabio e Ivan*/
SELECT *
FROM Impiegato
WHERE nome NOT IN ('Marta','Fabio','Ivan')

/* tutti i dati degli impiegati con età compresa tra 20 e 30*/
SELECT *
FROM Impiegato
WHERE eta BETWEEN 20 AND 30

/* per ogni acquisto il nome del cliente e il prezzo del prodotto*/
SELECT c.nome,a.prezzo
FROM Acquisto a,Cliente c
WHERE a.IdCliente=c.IdCliente

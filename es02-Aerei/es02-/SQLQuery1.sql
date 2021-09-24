/*Le città da cui partono voli per Roma in ordine alfabetico*/
SELECT DISTINCT	v.CittaPart
FROM Volo v
WHERE v.CittaArr='Roma'
ORDER BY v.CittaPart

/*Le città con aeroporto con numero di piste non noto*/
SELECT DISTINCT a.Citta
FROM Aeroporto a
WHERE a.NumPiste IS NULL

/*Per ogni volo Misto(sia merci e passeggeri):codice volo e dati di trasporto*/
SELECT DISTINCT v.IdVolo,a.QtaMerci,a.NumPasseggeri
FROM Aereo a,Volo v
WHERE a.TipoAereo=v.TipoAereo
AND a.QtaMerci>0 AND a.NumPasseggeri>0
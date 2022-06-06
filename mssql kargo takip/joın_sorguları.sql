-- INNER JOIN --
SELECT Musteri_table.musteri_isim AS AD, 
Musteri_table.musteri_soyisim AS SOYAD,					
Musteri_table.musteri_tc AS TC ,
Musteri_table.musteri_telefon AS TELEFON  FROM Musteri_table
INNER JOIN Kargo_bilgileri_table 
ON  Musteri_table.musteri_id = Kargo_bilgileri_table.kargo_veren_id 
--------------------------------------------------------------------------------------------------------
-- LEFT OUTER JOIN --
SELECT Arac_bilgileri_table.arac_sofor_id AS ÞOFÖR FROM Kargo_bilgileri_table
LEFT OUTER JOIN Arac_bilgileri_table
ON Kargo_bilgileri_table.kargo_araci_sofor_id=Arac_bilgileri_table.arac_sofor_id
INNER JOIN Personel_table ON Personel_table.id= Kargo_bilgileri_table.kargo_araci_sofor_id
--------------------------------------------------------------------------------------------------------
--FULL OUTER JOIN --
SELECT Personel_table.personel_isim as 'Personel Ýsim' ,
Personel_table.personel_soyisim as 'Personel Soyad',
Personel_table.personel_tc as 'Personel tc',
Personel_table.personel_maas as 'Personel Maas'
FROM Arac_bilgileri_table
FULL OUTER JOIN Personel_table
ON Arac_bilgileri_table.arac_sofor_id = Personel_table.id
WHERE Personel_table.personel_cinsiyet = 'E'
--------------------------------------------------------------------------------------------------------
SELECT * FROM Kargo_bilgileri_table
WHERE Kargo_bilgileri_table.kargo_cikis_tarihi > 2022/01/01
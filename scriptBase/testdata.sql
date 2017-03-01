delete from VEHICULE where 1=1;
delete from CONTACT_PROPRIETAIRE where 1=1;
delete from PROPRIETE where 1=1;
delete from CARACTERISTIQUE where 1=1;
delete from MARQUE where 1=1;
delete from MODELE where 1=1;
delete from CATEGORIE where 1=1;
delete from COULEUR where 1=1;


insert into CARACTERISTIQUE (RESERVOIR, NBR_PLACES, NBR_PORTES, PRIX_LOCATION_BASE) values (5.6, 5, 3, 17);

insert into MARQUE (LIBELLE_MARQUE) values ('Renault');

insert into MODELE (MODELE, PUISSANCE) values ('Twingo', '58-43/5250');

insert into PROPRIETE (NOM, PRENOMS, ADRESSE) values ('Randria', 'Naivotiana', 'LOT IV28 Tanjombato');

insert into CATEGORIE (LIBELLE_CATEGORIE) values ('Plaisir');

insert into COULEUR (LIBELLE_COULEUR) values ('Vert');

insert into CONTACT_PROPRIETAIRE (IDPROPRIETE, CONTACT) values (4, '+261332423432');

insert into VEHICULE (IMMATRICULATION, IDMARQUE, IDCOULEUR, IDMODELE, IDPROPRIETE, IDCATEGORIE, IDCARACTERISTIQUE, KMS, DATE_CIRCULATION) values ('4863 TBW', 4, 4, 4, 4, 4, 4, 950, '2012-01-01');

 

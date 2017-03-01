/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  01/03/2017 16:28:15                      */
/*==============================================================*/


drop index ADMIN_PK;

drop table ADMIN;

drop index CARACTERISTIQUE_PK;

drop table CARACTERISTIQUE;

drop index CATEGORIE_PK;

drop table CATEGORIE;

drop index CLIENT_PK;

drop table CLIENT;

drop index CONTACT_CLIENT_FK;

drop index CONTACT_PK;

drop table CONTACT;

drop index ASSOCIATION_11_FK;

drop index CONTACT_PROPRIETAIRE_PK;

drop table CONTACT_PROPRIETAIRE;

drop index ASSOCIATION_12_FK;

drop index LOUER_A_FK;

drop index CONTRAT_LOCATION_PK;

drop table CONTRAT_LOCATION;

drop index COULEUR_PK;

drop table COULEUR;

drop index MARQUE_PK;

drop table MARQUE;

drop index MODELE_PK;

drop table MODELE;

drop index PAYEMENT_CONTRAT_FK;

drop index PAYEMENT_PK;

drop table PAYEMENT;

drop index PROPRIETE_PK;

drop table PROPRIETE;

drop index APPARTIENT_A_FK;

drop index ASSOCIATION_5_FK;

drop index EST_DE_MODELE_FK;

drop index EST_DE_MARQUE_FK;

drop index EST_DE_CATEGORIE_DE_FK;

drop index ASSOCIATION_1_FK;

drop index VEHICULE_PK;

drop table VEHICULE;

/*==============================================================*/
/* Table : ADMIN                                                */
/*==============================================================*/
create table ADMIN (
   IDADMIN              SERIAL               not null,
   IDENTIFIANT          VARCHAR(100)         null,
   PASSE                VARCHAR(100)         null,
   constraint PK_ADMIN primary key (IDADMIN)
);

/*==============================================================*/
/* Index : ADMIN_PK                                             */
/*==============================================================*/
create unique index ADMIN_PK on ADMIN (
IDADMIN
);

/*==============================================================*/
/* Table : CARACTERISTIQUE                                      */
/*==============================================================*/
create table CARACTERISTIQUE (
   IDCARACTERISTIQUE    SERIAL               not null,
   RESERVOIR            DECIMAL              null,
   NBR_PLACES           INT4                 null,
   NBR_PORTES           INT4                 null,
   PRIX_LOCATION_BASE   DECIMAL              null,
   constraint PK_CARACTERISTIQUE primary key (IDCARACTERISTIQUE)
);

/*==============================================================*/
/* Index : CARACTERISTIQUE_PK                                   */
/*==============================================================*/
create unique index CARACTERISTIQUE_PK on CARACTERISTIQUE (
IDCARACTERISTIQUE
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE (
   IDCATEGORIE          SERIAL               not null,
   LIBELLE_CATEGORIE    VARCHAR(50)          null,
   constraint PK_CATEGORIE primary key (IDCATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIE_PK                                         */
/*==============================================================*/
create unique index CATEGORIE_PK on CATEGORIE (
IDCATEGORIE
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT (
   IDCLIENT             SERIAL               not null,
   NOM                  VARCHAR(100)         null,
   PRENOMS              VARCHAR(100)         null,
   SEXE                 CHAR(1)              null,
   ADRESSE              VARCHAR(100)         null,
   VILLE                VARCHAR(100)         null,
   DATE_PERMIS_CONDUIRE DATE                 null,
   DATE_NAISSANCE       DATE                 null,
   constraint PK_CLIENT primary key (IDCLIENT)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index CLIENT_PK on CLIENT (
IDCLIENT
);

/*==============================================================*/
/* Table : CONTACT                                              */
/*==============================================================*/
create table CONTACT (
   IDCONTACT            SERIAL               not null,
   IDCLIENT             INT4                 not null,
   CONTACT              VARCHAR(15)          null,
   constraint PK_CONTACT primary key (IDCONTACT)
);

/*==============================================================*/
/* Index : CONTACT_PK                                           */
/*==============================================================*/
create unique index CONTACT_PK on CONTACT (
IDCONTACT
);

/*==============================================================*/
/* Index : CONTACT_CLIENT_FK                                    */
/*==============================================================*/
create  index CONTACT_CLIENT_FK on CONTACT (
IDCLIENT
);

/*==============================================================*/
/* Table : CONTACT_PROPRIETAIRE                                 */
/*==============================================================*/
create table CONTACT_PROPRIETAIRE (
   IDCONTACT_P          SERIAL               not null,
   IDPROPRIETE          INT4                 not null,
   CONTACT              VARCHAR(15)          null,
   constraint PK_CONTACT_PROPRIETAIRE primary key (IDCONTACT_P)
);

/*==============================================================*/
/* Index : CONTACT_PROPRIETAIRE_PK                              */
/*==============================================================*/
create unique index CONTACT_PROPRIETAIRE_PK on CONTACT_PROPRIETAIRE (
IDCONTACT_P
);

/*==============================================================*/
/* Index : ASSOCIATION_11_FK                                    */
/*==============================================================*/
create  index ASSOCIATION_11_FK on CONTACT_PROPRIETAIRE (
IDPROPRIETE
);

/*==============================================================*/
/* Table : CONTRAT_LOCATION                                     */
/*==============================================================*/
create table CONTRAT_LOCATION (
   IDLOCATION           SERIAL               not null,
   IMMATRICULATION      VARCHAR(50)          not null,
   IDCLIENT             INT4                 not null,
   KM_DEPART            DECIMAL              null,
   KM_FIN               DECIMAL              null,
   DATE_DEBUT           DATE                 null,
   DATE_FIN             DATE                 null,
   MONTANT_LOCATION     DECIMAL              null,
   constraint PK_CONTRAT_LOCATION primary key (IDLOCATION)
);

/*==============================================================*/
/* Index : CONTRAT_LOCATION_PK                                  */
/*==============================================================*/
create unique index CONTRAT_LOCATION_PK on CONTRAT_LOCATION (
IDLOCATION
);

/*==============================================================*/
/* Index : LOUER_A_FK                                           */
/*==============================================================*/
create  index LOUER_A_FK on CONTRAT_LOCATION (
IDCLIENT
);

/*==============================================================*/
/* Index : ASSOCIATION_12_FK                                    */
/*==============================================================*/
create  index ASSOCIATION_12_FK on CONTRAT_LOCATION (
IMMATRICULATION
);

/*==============================================================*/
/* Table : COULEUR                                              */
/*==============================================================*/
create table COULEUR (
   IDCOULEUR            SERIAL               not null,
   LIBELLE_COULEUR      VARCHAR(50)          null,
   constraint PK_COULEUR primary key (IDCOULEUR)
);

/*==============================================================*/
/* Index : COULEUR_PK                                           */
/*==============================================================*/
create unique index COULEUR_PK on COULEUR (
IDCOULEUR
);

/*==============================================================*/
/* Table : MARQUE                                               */
/*==============================================================*/
create table MARQUE (
   IDMARQUE             SERIAL               not null,
   LIBELLE_MARQUE       VARCHAR(50)          null,
   constraint PK_MARQUE primary key (IDMARQUE)
);

/*==============================================================*/
/* Index : MARQUE_PK                                            */
/*==============================================================*/
create unique index MARQUE_PK on MARQUE (
IDMARQUE
);

/*==============================================================*/
/* Table : MODELE                                               */
/*==============================================================*/
create table MODELE (
   IDMODELE             SERIAL               not null,
   MODELE               VARCHAR(50)          null,
   PUISSANCE            VARCHAR(50)          null,
   constraint PK_MODELE primary key (IDMODELE)
);

/*==============================================================*/
/* Index : MODELE_PK                                            */
/*==============================================================*/
create unique index MODELE_PK on MODELE (
IDMODELE
);

/*==============================================================*/
/* Table : PAYEMENT                                             */
/*==============================================================*/
create table PAYEMENT (
   IDPAYEMENT           SERIAL               not null,
   IDLOCATION           INT4                 not null,
   DATE_PAYEMENT        DATE                 null,
   constraint PK_PAYEMENT primary key (IDPAYEMENT)
);

/*==============================================================*/
/* Index : PAYEMENT_PK                                          */
/*==============================================================*/
create unique index PAYEMENT_PK on PAYEMENT (
IDPAYEMENT
);

/*==============================================================*/
/* Index : PAYEMENT_CONTRAT_FK                                  */
/*==============================================================*/
create  index PAYEMENT_CONTRAT_FK on PAYEMENT (
IDLOCATION
);

/*==============================================================*/
/* Table : PROPRIETE                                            */
/*==============================================================*/
create table PROPRIETE (
   IDPROPRIETE          SERIAL               not null,
   NOM                  VARCHAR(100)         null,
   PRENOMS              VARCHAR(100)         null,
   ADRESSE              VARCHAR(100)         null,
   constraint PK_PROPRIETE primary key (IDPROPRIETE)
);

/*==============================================================*/
/* Index : PROPRIETE_PK                                         */
/*==============================================================*/
create unique index PROPRIETE_PK on PROPRIETE (
IDPROPRIETE
);

/*==============================================================*/
/* Table : VEHICULE                                             */
/*==============================================================*/
create table VEHICULE (
   IMMATRICULATION      VARCHAR(50)          not null,
   IDMARQUE             INT4                 not null,
   IDCOULEUR            INT4                 not null,
   IDMODELE             INT4                 not null,
   IDPROPRIETE          INT4                 not null,
   IDCATEGORIE          INT4                 not null,
   IDCARACTERISTIQUE    INT4                 not null,
   KMS                  DECIMAL              null,
   DATE_CIRCULATION     DATE                 null,
   constraint PK_VEHICULE primary key (IMMATRICULATION)
);

/*==============================================================*/
/* Index : VEHICULE_PK                                          */
/*==============================================================*/
create unique index VEHICULE_PK on VEHICULE (
IMMATRICULATION
);

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_1_FK on VEHICULE (
IDCARACTERISTIQUE
);

/*==============================================================*/
/* Index : EST_DE_CATEGORIE_DE_FK                               */
/*==============================================================*/
create  index EST_DE_CATEGORIE_DE_FK on VEHICULE (
IDCATEGORIE
);

/*==============================================================*/
/* Index : EST_DE_MARQUE_FK                                     */
/*==============================================================*/
create  index EST_DE_MARQUE_FK on VEHICULE (
IDMARQUE
);

/*==============================================================*/
/* Index : EST_DE_MODELE_FK                                     */
/*==============================================================*/
create  index EST_DE_MODELE_FK on VEHICULE (
IDMODELE
);

/*==============================================================*/
/* Index : ASSOCIATION_5_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_5_FK on VEHICULE (
IDCOULEUR
);

/*==============================================================*/
/* Index : APPARTIENT_A_FK                                      */
/*==============================================================*/
create  index APPARTIENT_A_FK on VEHICULE (
IDPROPRIETE
);

alter table CONTACT
   add constraint FK_CONTACT_CONTACT_C_CLIENT foreign key (IDCLIENT)
      references CLIENT (IDCLIENT)
      on delete restrict on update restrict;

alter table CONTACT_PROPRIETAIRE
   add constraint FK_CONTACT__ASSOCIATI_PROPRIET foreign key (IDPROPRIETE)
      references PROPRIETE (IDPROPRIETE)
      on delete restrict on update restrict;

alter table CONTRAT_LOCATION
   add constraint FK_CONTRAT__ASSOCIATI_VEHICULE foreign key (IMMATRICULATION)
      references VEHICULE (IMMATRICULATION)
      on delete restrict on update restrict;

alter table CONTRAT_LOCATION
   add constraint FK_CONTRAT__LOUER_A_CLIENT foreign key (IDCLIENT)
      references CLIENT (IDCLIENT)
      on delete restrict on update restrict;

alter table PAYEMENT
   add constraint FK_PAYEMENT_PAYEMENT__CONTRAT_ foreign key (IDLOCATION)
      references CONTRAT_LOCATION (IDLOCATION)
      on delete restrict on update restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_APPARTIEN_PROPRIET foreign key (IDPROPRIETE)
      references PROPRIETE (IDPROPRIETE)
      on delete restrict on update restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_ASSOCIATI_CARACTER foreign key (IDCARACTERISTIQUE)
      references CARACTERISTIQUE (IDCARACTERISTIQUE)
      on delete restrict on update restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_ASSOCIATI_COULEUR foreign key (IDCOULEUR)
      references COULEUR (IDCOULEUR)
      on delete restrict on update restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_EST_DE_CA_CATEGORI foreign key (IDCATEGORIE)
      references CATEGORIE (IDCATEGORIE)
      on delete restrict on update restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_EST_DE_MA_MARQUE foreign key (IDMARQUE)
      references MARQUE (IDMARQUE)
      on delete restrict on update restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_EST_DE_MO_MODELE foreign key (IDMODELE)
      references MODELE (IDMODELE)
      on delete restrict on update restrict;


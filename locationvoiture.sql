/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  27/04/2020 22:58:21                      */
/*==============================================================*/


drop table if exists Client;

drop table if exists Reservation;

drop table if exists TypeVoiture;

drop table if exists Voiture;

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   idClient             int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   dateDePermis         datetime,
   email                varchar(254),
   tel                  int,
   primary key (idClient)
);

/*==============================================================*/
/* Table : Reservation                                          */
/*==============================================================*/
create table Reservation
(
   idClient             int not null,
   idVoiture            int,
   idReservation        int,
   dateDebut            datetime,
   dateFinLocation      int,
   primary key (idClient)
);

/*==============================================================*/
/* Table : TypeVoiture                                          */
/*==============================================================*/
create table TypeVoiture
(
   idType               int not null,
   descriptionType      int,
   primary key (idType)
);

/*==============================================================*/
/* Table : Voiture                                              */
/*==============================================================*/
create table Voiture
(
   idType               int,
   idVoiture            int not null,
   marque               varchar(254),
   modele               int,
   topVitesse           int,
   primary key (idVoiture)
);

alter table Reservation add constraint FK_association1 foreign key (idVoiture)
      references Voiture (idVoiture) on delete restrict on update restrict;

alter table Reservation add constraint FK_association3 foreign key (idClient)
      references Client (idClient) on delete restrict on update restrict;

alter table Voiture add constraint FK_association2 foreign key (idType)
      references TypeVoiture (idType) on delete restrict on update restrict;


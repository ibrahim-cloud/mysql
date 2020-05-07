/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  07/05/2020 13:32:20                      */
/*==============================================================*/


drop table if exists Client;

drop table if exists Reservation;

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
   idType               int,
   idReservation        int,
   dateDebut            datetime,
   dateFinLocation      int,
   primary key (idClient)
);

/*==============================================================*/
/* Table : Voiture                                              */
/*==============================================================*/
create table Voiture
(
   idVoiture            int not null,
   marque               varchar(254),
   modele               int,
   topVitesse           int,
   idType               int not null,
   primary key (idVoiture, idType)
);

alter table Reservation add constraint FK_association1 foreign key (idVoiture, idType)
      references Voiture (idVoiture, idType) on delete restrict on update restrict;

alter table Reservation add constraint FK_association3 foreign key (idClient)
      references Client (idClient) on delete restrict on update restrict;


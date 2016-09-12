-- Group [Group]

create table "APP"."GROUP" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);




-- Module [Module]

create table "APP"."MODULE" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);




-- User [User]

create table "APP"."USER" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
  primary key ("OID")
);




-- Movie [ent1]

create table "APP"."MOVIE" (
   "OID"  integer  not null,
   "TITLE"  varchar(255),
   "RELEASEDATE"  date,
  primary key ("OID")
);




-- Comment [ent2]

create table "APP"."COMMENT" (
   "OID"  integer  not null,
   "COMMENT"  varchar(255),
   "UPDATE"  timestamp,
  primary key ("OID")
);




-- Category [ent3]

create table "APP"."CATEGORY" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);




-- Director [ent4]

create table "APP"."DIRECTOR" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
   "SURNAME"  varchar(255),
   "DATEOFBIRTH"  date,
  primary key ("OID")
);




-- Actor [ent5]

create table "APP"."ACTOR" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
   "SURNAME"  varchar(255),
   "DATEOFBIRTH"  date,
  primary key ("OID")
);




-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]

alter table "APP"."GROUP"  add column  "MODULE_OID"  integer;

alter table "APP"."GROUP"   add constraint FK_GROUP_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");




-- Group_Module [Group2Module_Module2Group]

create table "APP"."GROUP_MODULE" (
   "GROUP_OID"  integer not null,
   "MODULE_OID"  integer not null,
  primary key ("GROUP_OID", "MODULE_OID")
);

alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");

alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");




-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]

alter table "APP"."USER"  add column  "GROUP_OID"  integer;

alter table "APP"."USER"   add constraint FK_USER_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");




-- User_Group [User2Group_Group2User]

create table "APP"."USER_GROUP" (
   "USER_OID"  integer not null,
   "GROUP_OID"  integer not null,
  primary key ("USER_OID", "GROUP_OID")
);

alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "APP"."USER" ("OID");

alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");




-- User_Comment [rel1]

alter table "APP"."COMMENT"  add column  "USER_OID"  integer;

alter table "APP"."COMMENT"   add constraint FK_COMMENT_USER foreign key ("USER_OID") references "APP"."USER" ("OID");




-- Comment_Movie [rel2]

alter table "APP"."COMMENT"  add column  "MOVIE_OID"  integer;

alter table "APP"."COMMENT"   add constraint FK_COMMENT_MOVIE foreign key ("MOVIE_OID") references "APP"."MOVIE" ("OID");




-- User_Movie [rel4]

create table "APP"."USER_MOVIE" (
   "USER_OID"  integer not null,
   "MOVIE_OID"  integer not null,
  primary key ("USER_OID", "MOVIE_OID")
);

alter table "APP"."USER_MOVIE"   add constraint FK_USER_MOVIE_USER foreign key ("USER_OID") references "APP"."USER" ("OID");

alter table "APP"."USER_MOVIE"   add constraint FK_USER_MOVIE_MOVIE foreign key ("MOVIE_OID") references "APP"."MOVIE" ("OID");




-- Movie_Actor [rel5]

create table "APP"."MOVIE_ACTOR" (
   "MOVIE_OID"  integer not null,
   "ACTOR_OID"  integer not null,
  primary key ("MOVIE_OID", "ACTOR_OID")
);

alter table "APP"."MOVIE_ACTOR"   add constraint FK_MOVIE_ACTOR_MOVIE foreign key ("MOVIE_OID") references "APP"."MOVIE" ("OID");

alter table "APP"."MOVIE_ACTOR"   add constraint FK_MOVIE_ACTOR_ACTOR foreign key ("ACTOR_OID") references "APP"."ACTOR" ("OID");




-- Movie_Director [rel6]

alter table "APP"."MOVIE"  add column  "DIRECTOR_OID"  integer;

alter table "APP"."MOVIE"   add constraint FK_MOVIE_DIRECTOR foreign key ("DIRECTOR_OID") references "APP"."DIRECTOR" ("OID");




-- Movie_Category [rel7]

alter table "APP"."MOVIE"  add column  "CATEGORY_OID"  integer;

alter table "APP"."MOVIE"   add constraint FK_MOVIE_CATEGORY foreign key ("CATEGORY_OID") references "APP"."CATEGORY" ("OID");



/******************************************************************************/
/* script generate entity for authentification  an IdentitySrever 4  netcore3.1 blazor */
/****************  For firebird 2.5  *******************************/



/******************************************************************************/
/***                                Domains                                 ***/
/******************************************************************************/

CREATE DOMAIN BOOLEAN AS
SMALLINT
DEFAULT 0;

CREATE DOMAIN IDENTITY AS
INTEGER
NOT NULL;



/******************************************************************************/
/***                               Generators                               ***/
/******************************************************************************/

CREATE GENERATOR GN_IDENTITY;
SET GENERATOR GN_IDENTITY TO 1;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/



CREATE TABLE "__EFMigrationsHistory" (
    "MigrationId"     VARCHAR(150) NOT NULL,
    "ProductVersion"  VARCHAR(32) NOT NULL
);
GRANT SELECT, INSERT, UPDATE, DELETE ON   "__EFMigrationsHistory"   TO WEBUSER;

CREATE TABLE "AspNetRoleClaims" (
    "Id"          IDENTITY,
    "RoleId"      VARCHAR(256) NOT NULL,
    "ClaimType"   BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    "ClaimValue"  BLOB SUB_TYPE 1 SEGMENT SIZE 80
);
GRANT SELECT, INSERT, UPDATE, DELETE ON  "AspNetRoleClaims"    TO WEBUSER;

CREATE TABLE "AspNetRoles" (
    "Id"                VARCHAR(256) NOT NULL,
    "Name"              VARCHAR(256),
    "NormalizedName"    VARCHAR(256),
    "ConcurrencyStamp"  BLOB SUB_TYPE 1 SEGMENT SIZE 80
);
GRANT SELECT, INSERT, UPDATE, DELETE ON   "AspNetRoles"    TO WEBUSER;

CREATE TABLE "AspNetUserClaims" (
    "Id"          IDENTITY,
    "UserId"      VARCHAR(256) NOT NULL,
    "ClaimType"   BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    "ClaimValue"  BLOB SUB_TYPE 1 SEGMENT SIZE 80
);
GRANT SELECT, INSERT, UPDATE, DELETE ON  "AspNetUserClaims"    TO WEBUSER;

CREATE TABLE "AspNetUserLogins" (
    "LoginProvider"        VARCHAR(128) NOT NULL,
    "ProviderKey"          VARCHAR(128) NOT NULL,
    "ProviderDisplayName"  BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    "UserId"               VARCHAR(256) NOT NULL
);
GRANT SELECT, INSERT, UPDATE, DELETE ON   "AspNetUserLogins"    TO WEBUSER;

CREATE TABLE "AspNetUserRoles" (
    "UserId"  VARCHAR(256) NOT NULL,
    "RoleId"  VARCHAR(256) NOT NULL
);
GRANT SELECT, INSERT, UPDATE, DELETE ON  "AspNetUserRoles"    TO WEBUSER;

CREATE TABLE "AspNetUsers" (
    "Id"                    VARCHAR(256) NOT NULL,
    "UserName"              VARCHAR(256),
    "NormalizedUserName"    VARCHAR(256),
    "Email"                 VARCHAR(256),
    "NormalizedEmail"       VARCHAR(256),
    "EmailConfirmed"        BOOLEAN NOT NULL,
    "PasswordHash"          BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    "SecurityStamp"         BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    "ConcurrencyStamp"      BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    "PhoneNumber"           BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    "PhoneNumberConfirmed"  BOOLEAN NOT NULL,
    "TwoFactorEnabled"      BOOLEAN NOT NULL,
    "LockoutEnd"            VARCHAR(48),
    "LockoutEnabled"        BOOLEAN NOT NULL,
    "AccessFailedCount"     INTEGER NOT NULL
);
GRANT SELECT, INSERT, UPDATE, DELETE ON  "AspNetUsers"    TO WEBUSER;

CREATE TABLE "AspNetUserTokens" (
    "UserId"         VARCHAR(256) NOT NULL,
    "LoginProvider"  VARCHAR(128) NOT NULL,
    "Name"           VARCHAR(128) NOT NULL,
    "Value"          BLOB SUB_TYPE 1 SEGMENT SIZE 80
);
GRANT SELECT, INSERT, UPDATE, DELETE ON  "AspNetUserTokens"    TO WEBUSER;

CREATE TABLE "DeviceCodes" (
    "UserCode"      VARCHAR(200) NOT NULL,
    "DeviceCode"    VARCHAR(200) NOT NULL,
    "SubjectId"     VARCHAR(200),
    "ClientId"      VARCHAR(200) NOT NULL,
    "CreationTime"  TIMESTAMP NOT NULL,
    "Expiration"    TIMESTAMP NOT NULL,
    "Data"          BLOB SUB_TYPE 1 SEGMENT SIZE 80 NOT NULL
);
GRANT SELECT, INSERT, UPDATE, DELETE ON  "DeviceCodes"     TO WEBUSER;

CREATE TABLE "PersistedGrants" (
    "Key"           VARCHAR(200) NOT NULL,
    "Type"          VARCHAR(50) NOT NULL,
    "SubjectId"     VARCHAR(200),
    "ClientId"      VARCHAR(200) NOT NULL,
    "CreationTime"  TIMESTAMP NOT NULL,
    "Expiration"    TIMESTAMP,
    "Data"          BLOB SUB_TYPE 1 SEGMENT SIZE 80 NOT NULL
);
GRANT SELECT, INSERT, UPDATE, DELETE ON  "PersistedGrants"    TO WEBUSER;



/******************************************************************************/
/***                              Primary keys                              ***/
/******************************************************************************/

ALTER TABLE "AspNetRoleClaims" ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");
ALTER TABLE "AspNetRoles" ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");
ALTER TABLE "AspNetUserClaims" ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");
ALTER TABLE "AspNetUserLogins" ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");
ALTER TABLE "AspNetUserRoles" ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");
ALTER TABLE "AspNetUserTokens" ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");
ALTER TABLE "AspNetUsers" ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");
ALTER TABLE "DeviceCodes" ADD CONSTRAINT "PK_DeviceCodes" PRIMARY KEY ("UserCode");
ALTER TABLE "PersistedGrants" ADD CONSTRAINT "PK_PersistedGrants" PRIMARY KEY ("Key");
ALTER TABLE "__EFMigrationsHistory" ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


/******************************************************************************/
/***                              Foreign keys                              ***/
/******************************************************************************/

ALTER TABLE "AspNetRoleClaims" ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRole~" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "AspNetUserClaims" ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUser~" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "AspNetUserLogins" ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUser~" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "AspNetUserRoles" ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles~" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "AspNetUserRoles" ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers~" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "AspNetUserTokens" ADD CONSTRAINT "FK_AspNetUserTokens_AspNetUser~" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers" ("Id") ON DELETE CASCADE ON UPDATE NO ACTION;


/******************************************************************************/
/***                                Indices                                 ***/
/******************************************************************************/

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" ("RoleId");
CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" ("NormalizedName");
CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" ("UserId");
CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" ("UserId");
CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" ("RoleId");
CREATE INDEX "EmailIndex" ON "AspNetUsers" ("NormalizedEmail");
CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" ("NormalizedUserName");
CREATE UNIQUE INDEX "IX_DeviceCodes_DeviceCode" ON "DeviceCodes" ("DeviceCode");
CREATE INDEX "IX_DeviceCodes_Expiration" ON "DeviceCodes" ("Expiration");
CREATE INDEX "IX_PersistedGrants_Expiration" ON "PersistedGrants" ("Expiration");
CREATE INDEX "IX_PersistedGrants_SubjectId_C~" ON "PersistedGrants" ("SubjectId", "ClientId", "Type");


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: ASPNETROLECLAIMS_BI0 */
CREATE TRIGGER ASPNETROLECLAIMS_BI0 FOR "AspNetRoleClaims"
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  new."Id" = gen_id(gn_identity,1);
end
^

/* Trigger: ASPNETUSERCLAIMS_BI0 */
CREATE TRIGGER ASPNETUSERCLAIMS_BI0 FOR "AspNetUserClaims"
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  new."Id" = gen_id(gn_identity,1);
end
^
SET TERM ; ^


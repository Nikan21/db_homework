DROP TABLE "goods";

CREATE TABLE "goods"(
    "id_goods" SERIAL PRIMARY KEY,
    "name_goods" VARCHAR(42) NOT NULL CHECK("name_goods" != ''),
    "price" SMALLINT NOT NULL CHECK("price" > 1)
);

INSERT INTO "goods" ("name_goods", "price") VALUES ('phone', 25)
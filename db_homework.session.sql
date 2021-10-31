/*TABLE GOODS*/
DROP TABLE "goods";

CREATE TABLE "goods"(
    "id_goods" SERIAL PRIMARY KEY,
    "name_goods" VARCHAR(42) NOT NULL CHECK("name_goods" != ''),
    "price" SMALLINT NOT NULL CHECK("price" > 1)
);

INSERT INTO "goods" ("name_goods", "price")
VALUES ('Phone', 25)

/*TABLE ORDERS*/
DROP TABLE "orders";

CREATE TABLE "orders"(
    "id_orders" SERIAL PRIMARY KEY,
    "name_orders" VARCHAR(42) NOT NULL CHECK("name_orders" != ''),
    "adress" VARCHAR(36) NOT NULL CHECK("adress" != ''),
    "phone_number" VARCHAR(10) NOT NULL CHECK("phone_number" != ''),
    "contract_number" SERIAL,
    "date_conclusion_of_a_contract" DATE DEFAULT current_date,
    "name_goods" VARCHAR(42) NOT NULL CHECK("name_goods" != ''),
    "planned_delivery" SMALLINT NOT NULL CHECK("planned_delivery" > 0)
);

INSERT INTO "orders" (
        "name_orders",
        "adress",
        "phone_number",
        "name_goods",
        "planned_delivery"
    )
VALUES ('Phones', 'St.Walls', '4855226564', 'Phones', 4)

/*TABLE Orders_and_goods*/
DROP TABLE "orders_and_goods";

CREATE TABLE "orders_and_goods"(
    "id_orders" int,
    FOREIGN KEY ("id_orders") REFERENCES "orders",
    "id_goods" int,
    FOREIGN KEY ("id_goods") REFERENCES "goods"
);

INSERT INTO "orders_and_goods"
VALUES (1, 1)
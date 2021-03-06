/*TABLE GOODS*/
DROP TABLE "goods";

CREATE TABLE "goods"(
    "id" SERIAL PRIMARY KEY,
    "name_good" VARCHAR(42) NOT NULL CHECK("name_goods" != ''),
    "price" SMALLINT NOT NULL CHECK("price" > 1)
);

INSERT INTO "goods" ("name_goods", "price")
VALUES ('Car', 1050)

/*TABLE USERS*/
DROP TABLE "users";

CREATE TABLE "users"(
    "id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR(42) NOT NULL CHECK("first_orders" != ''),
    "last_name" VARCHAR(68) NOT NULL CHECK("last_orders" != ''),    
    "adress" VARCHAR(36) NOT NULL CHECK("adress" != ''),
    "phone_number" VARCHAR(10) UNIQUE NOT NULL CHECK("phone_number" != ''),
);

INSERT INTO "users" ("first_name", "last_name", "adress", "phone_number", "contract_number") VALUES ('Nikolay', 'Grachev', 'Str.Puskina', '21312131', 1)

/*TABLE ORDERS*/
DROP TABLE "orders";

CREATE TABLE "orders"(
    "id" SERIAL PRIMARY KEY,
    "name_orders" VARCHAR(42) NOT NULL CHECK("name_orders" != ''),
    "date_conclusion_of_a_contract" DATE DEFAULT current_date,
    "planned_delivery" SMALLINT NOT NULL CHECK("planned_delivery" > 0)
    "contract_number_user" int,
    FOREIGN KEY ("contract_number_user") REFERENCES "users"
    "user_order" int, 
    FOREIGN KEY ("user_order") REFERENCES "users"
);

INSERT INTO "orders" (
        "name_orders",
        "adress",
        "phone_number",
        "name_goods",
        "planned_delivery",
        "contract_number_user",
        "user_order"
    )
VALUES ('Car', 'St.LasVegas', '1851126454', 4, 5, 1, 5)

/*TABLE Orders_and_goods*/
DROP TABLE "orders_and_goods";

CREATE TABLE "orders_and_goods"(
    "id_orders" int,
    FOREIGN KEY ("id_orders") REFERENCES "orders",
    "id_goods" int,
    FOREIGN KEY ("id_goods") REFERENCES "goods"
);

INSERT INTO "orders_and_goods"
VALUES (4, 4)

/*TABLE shipment_of_goods*/
DROP TABLE "shipment_of_goods";

CREATE TABLE "shipment_of_goods"(
    "id" SERIAL PRIMARY KEY,
    "id_orders" int,
    FOREIGN KEY ("id_orders") REFERENCES "orders",
    "date_shipment" DATE DEFAULT current_date,
    "receiving_address" VARCHAR(36) NOT NULL CHECK("receiving_address" != ''),
    "goods_shipped" SMALLINT NOT NULL CHECK("goods_shipped" > 0)
);

INSERT INTO "shipment_of_goods" ("id_orders", "receiving_address", "goods_shipped")
VALUES (4, 'St.Yellow', 25)

/*TABLE shipment_and_goods*/
DROP TABLE "shipment_and_goods";

CREATE TABLE "shipment_and_goods"(
    "id_shipment" int,
    FOREIGN KEY ("id_shipment") REFERENCES "shipment_of_goods",
    "id_goods" int,
    FOREIGN KEY ("id_goods") REFERENCES "goods"
);

INSERT INTO "shipment_and_goods"
VALUES (4, 4)

SELECT "shipment_of_goods".goods_shipped - "orders".planned_delivery FROM "shipment_of_goods", "orders"
WHERE "shipment_of_goods".id_shipment = "orders".id_orders;

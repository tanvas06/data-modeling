CREATE TABLE "users" (
  "first_name" varchar(15),
  "last_name" varchar(20),
  "user_id" SERIAL PRIMARY KEY,
  "user_email" varchar(50),
  "user_password" varchar(50)
);

CREATE TABLE "recipes" (
  "recipe_id" SERIAL PRIMARY KEY,
  "recipe_name" varchar(100),
  "creator_id" INT NOT NULL,
  "ingredients_needed" INT NOT NULL,
  "instructions" varchar(5000),
  "private" BOOLEAN,
  "occasion" INT NOT NULL
);

CREATE TABLE "recipe_ingredients" (
  "recipe_ingredient_id" SERIAL PRIMARY KEY,
  "recipe_id" INT NOT NULL,
  "ingredients" INT NOT NULL,
  "quantity" INT NOT NULL
);

CREATE TABLE "ingredients" (
  "ingredient_id" SERIAL PRIMARY KEY,
  "ingredient_name" varchar(50)
);

CREATE TABLE "grocery_list" (
  "author_id" INT NOT NULL,
  "ingredients_added" INT NOT NULL
);

CREATE TABLE "occasions" (
  "occassion_id" SERIAL PRIMARY KEY,
  "author_id" INT NOT NULL,
  "occassion_name" varchar(50),
  "recipe" INT NOT NULL
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("creator_id") REFERENCES "users" ("user_id");

ALTER TABLE "recipes" ADD FOREIGN KEY ("ingredients_needed") REFERENCES "recipe_ingredients" ("recipe_ingredient_id");

ALTER TABLE "recipes" ADD FOREIGN KEY ("occasion") REFERENCES "occasions" ("occassion_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("recipe_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("ingredients") REFERENCES "ingredients" ("ingredient_id");

ALTER TABLE "grocery_list" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "grocery_list" ADD FOREIGN KEY ("ingredients_added") REFERENCES "recipe_ingredients" ("recipe_ingredient_id");

ALTER TABLE "occasions" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("user_id");

ALTER TABLE "occasions" ADD FOREIGN KEY ("recipe") REFERENCES "recipes" ("recipe_id");

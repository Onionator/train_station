CREATE TABLE "trains" (
	"train_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "trains_pk" PRIMARY KEY ("train_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "riders" (
	"rider_id" serial NOT NULL,
	"train_id" integer NOT NULL,
	CONSTRAINT "riders_pk" PRIMARY KEY ("rider_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "stops" (
	"stop_id" serial NOT NULL,
	"train_id" integer NOT NULL,
	"city_id" integer NOT NULL,
	CONSTRAINT "stops_pk" PRIMARY KEY ("stop_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "cities" (
	"city_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("city_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "riders" ADD CONSTRAINT "riders_fk0" FOREIGN KEY ("train_id") REFERENCES "trains"("train_id");

ALTER TABLE "stops" ADD CONSTRAINT "stops_fk0" FOREIGN KEY ("train_id") REFERENCES "trains"("train_id");
ALTER TABLE "stops" ADD CONSTRAINT "stops_fk1" FOREIGN KEY ("city_id") REFERENCES "cities"("city_id");

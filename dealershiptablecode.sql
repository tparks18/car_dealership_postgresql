CREATE TABLE "customer" (
	"customer_id" serial NOT NULL UNIQUE,
	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"address" varchar(255) NOT NULL,
	"phone_number" VARCHAR(255) NOT NULL,
	"account_id" integer NOT NULL UNIQUE,
	"credit_score" integer NOT NULL,
	"date_created" TIMESTAMP,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "car" (
	"car_id" serial NOT NULL UNIQUE,
	"make" varchar(255) NOT NULL,
	"model" varchar(255) NOT NULL,
	"year" integer,
	"vehicle_type" VARCHAR(255) NOT NULL,
	"full_amount" DECIMAL NOT NULL,
	"account_id" serial NOT NULL UNIQUE,
	"down_payment" FLOAT NOT NULL,
	CONSTRAINT "car_pk" PRIMARY KEY ("car_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "payment" (
	"payment_id" serial NOT NULL,
	"payment_amount" FLOAT NOT NULL,
	"date_created" TIMESTAMP,
	"late_fee" FLOAT,
	"due_date" TIMESTAMP NOT NULL,
	"car_id" integer NOT NULL,
	"payment_type" VARCHAR(255) NOT NULL,
	"account_id" integer NOT NULL UNIQUE,
	CONSTRAINT "payment_pk" PRIMARY KEY ("payment_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "loan" (
	"loan_id" serial NOT NULL UNIQUE,
	"car_id" integer NOT NULL,
	"repayment_start_date" TIMESTAMP,
	"account_id" integer NOT NULL,
	"repayment_end_date" TIMESTAMP,
	"monthly_repayment" FLOAT NOT NULL,
	"balance" FLOAT NOT NULL,
	CONSTRAINT "loan_pk" PRIMARY KEY ("loan_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "insurance" (
	"policy_id" serial NOT NULL UNIQUE,
	"car_id" serial NOT NULL UNIQUE,
	"policy_start_date" DATE,
	"policy_renewal_date" DATE,
	"monthly_payment" FLOAT NOT NULL,
	"insurance_company_id" integer NOT NULL,
	"account_id" integer NOT NULL,
	CONSTRAINT "insurance_pk" PRIMARY KEY ("policy_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "maintenance" (
	"service_id" serial NOT NULL,
	"mechanic_id" serial NOT NULL,
	"serviceticket_id" integer NOT NULL,
	"hours" FLOAT NOT NULL,
	"rate" FLOAT NOT NULL,
	"car_id" integer NOT NULL,
	"mx_date" TIMESTAMP NOT NULL,
	CONSTRAINT "maintenance_pk" PRIMARY KEY ("service_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "account" (
	"account_id" serial NOT NULL UNIQUE,
	"customer_id" integer NOT NULL,
	"loan_id" integer NOT NULL UNIQUE,
	"service_id" serial NOT NULL,
	"policy_id" serial NOT NULL UNIQUE,
	CONSTRAINT "account_pk" PRIMARY KEY ("account_id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "car" DROP CONSTRAINT "car_fk0" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");

ALTER TABLE "payment" ADD CONSTRAINT "payment_fk0" FOREIGN KEY ("car_id") REFERENCES "car"("car_id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk1" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");

ALTER TABLE "loan" ADD CONSTRAINT "loan_fk0" FOREIGN KEY ("car_id") REFERENCES "car"("car_id");
ALTER TABLE "loan" ADD CONSTRAINT "loan_fk1" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");

ALTER TABLE "insurance" ADD CONSTRAINT "insurance_fk0" FOREIGN KEY ("car_id") REFERENCES "car"("car_id");
ALTER TABLE "insurance" ADD CONSTRAINT "insurance_fk1" FOREIGN KEY ("account_id") REFERENCES "account"("account_id");

ALTER TABLE "maintenance" ADD CONSTRAINT "maintenance_fk0" FOREIGN KEY ("car_id") REFERENCES "car"("car_id");

ALTER TABLE "account" ADD CONSTRAINT "account_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE "account" ADD CONSTRAINT "account_fk1" FOREIGN KEY ("loan_id") REFERENCES "loan"("loan_id");
ALTER TABLE "account" ADD CONSTRAINT "account_fk2" FOREIGN KEY ("service_id") REFERENCES "maintenance"("service_id");
ALTER TABLE "account" ADD CONSTRAINT "account_fk3" FOREIGN KEY ("policy_id") REFERENCES "insurance"("policy_id");
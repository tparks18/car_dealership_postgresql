-- ALTER TABLE payment ENABLE TRIGGER ALL;
-- insert into account (
-- account_id, customer_id, loan_id, service_id, policy_id
-- )
-- values (5, 5, 5, 5, 5)

--car dealership question 1:
-- select date_created
-- from customer

--car dealership question 2:
-- select credit_score
-- from customer
-- where credit_score >= 650

--car dealership question 3:
-- begin;
-- update payment set payment_amount = payment_amount - 20.00
-- where payment_id = 1;
-- commit;

--car dealership question 4:
-- begin;
-- update payment set payment_amount = payment_amount + late_fee
-- where payment_id = 2;
-- commit;

--car dealership question 5:
-- select payment_amount, due_date
-- from payment

--car dealership question 6:
-- -CREATE VIEW amount_due AS
-- SELECT payment_amount, due_date
-- FROM payment
--WHERE payment_amount > 200

--car dealership question 7:
-- select mx_date
-- from maintenance
-- where car_id = 1

--car dealership question 8:
-- SELECT first_name, last_name, make, model
-- FROM car
-- JOIN customer on customer.account_id = car.account_id

select *
from customer

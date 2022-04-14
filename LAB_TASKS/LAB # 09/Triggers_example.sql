 use sale_co;
 select * from product;  --Normal termination by colon

 --In case of delimeter 
 delimiter $$
 select * from product
 ; --Colon not work because we create delimeter now 
 --Now terminate statement is $$

 $$
CREATE PROCEDURE PRG_PROD()
BEGIN
UPDATE PRODUCT
SET P_DISCOUNT = (P_DISCOUNT*0.05)+ P_DISCOUNT
WHERE P_ONHAND >= P_MIN*2;
END $$
DELIMITER ; /*to change the delimiter back*/

DELIMITER $$
CREATE PROCEDURE my_procedure_Local_Variables()
BEGIN /* declare local variables */
DECLARE a INT DEFAULT 10;
DECLARE b, c INT; /* using the local variables */
SET a = a + 100;
SET b = 2;
SET c = a + b;
BEGIN /* local variable in nested block */
DECLARE c INT;
SET c = 5;
/* local variable c takes precedence over the one of the
same name declared in the enclosing block. */
SELECT a, b, c;
END;
SELECT a, b, c;
END$$
DELIMITER ;
CALL my_procedure_Local_Variables();

--Parameter Inn Example
DELIMITER $$
CREATE PROCEDURE my_proc_IN (IN var1 INT)
BEGIN
SELECT * FROM PRODUCT where P_ONHAND = var1;
END$$
DELIMITER ;
call my_proc_IN(8);
DELIMITER $$


CREATE PROCEDURE LIMIT_ROW (IN var1 INT)
BEGIN
SELECT * FROM PRODUCT LIMIT var1;
END$$
DELIMITER ;
call LIMIT_ROW (8);

--Parameter Out Example
DELIMITER $$
CREATE PROCEDURE PRG_AVG_PRICE(out avg_price decimal)
BEGIN
SELECT AVG(P_PRICE) INTO avg_price FROM PRODUCT;
END$$

call prg_avg_price(@out);
SELECT @out;


 
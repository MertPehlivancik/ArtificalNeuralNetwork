CREATE DEFINER=`root`@`localhost` PROCEDURE `callspancleanE`()
BEGIN
DECLARE count INT Default 0;
DECLARE count2 INT Default 0;
	simple_loop: LOOP
		SET @a := count + 1;
		SET @b := (select person_oid from randomperson as r where r.person_id = @a);
		/*loop1*/
        
		/*loop1*/
		simple_loop2: LOOP
			SET @c := count2 + 1;
			/*loop2*/
			SET @statement = CONCAT('Create table callspanclean3_',@b,'t_e_',@c,' as select x.phonenumber_oid,x.descid,x.dirid,x.stime,x.duration,x.class from callspanclean3_',@b,'t_all_',@c,' as x;');
			PREPARE stmt FROM @statement;
                 EXECUTE stmt;
                 DEALLOCATE PREPARE stmt;
			/*loop2*/
			SET count2 = count2 +1;
				IF count2=10 THEN
					SET count2 := count2 - 10;
					SET @c := count2 + 0;
					LEAVE simple_loop2;
				END IF;
		END LOOP simple_loop2;  
      
      
      
		SET count = count + 1;
			IF count=20 THEN
              LEAVE simple_loop;
			END IF; 
	END LOOP simple_loop;
END
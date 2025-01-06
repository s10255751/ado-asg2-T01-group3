UPDATE Product_Reviews 

SET ReviewText = CASE 

                    WHEN Rating = 5 THEN 'Excellent product!' 

                    WHEN Rating = 4 THEN 'Very good quality.' 

                    WHEN Rating = 3 THEN 'Average, could be better.' 

                    WHEN Rating = 2 THEN 'Not satisfied.' 

                    ELSE 'Poor quality.' 

                 END; 
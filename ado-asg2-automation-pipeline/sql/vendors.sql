-- Update the PHONE column by removing non-numeric characters
UPDATE COLLECTIBLE_DIECAST.VENDORS
SET PHONE = REGEXP_REPLACE(PHONE, '[^0-9]', '');



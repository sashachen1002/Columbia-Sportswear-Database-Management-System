--1 BRAND
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (1, 'Columbia', 'Outdoor Apparel and Footwear');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (2, 'Mountain Hardwear', 'High-Performance Outdoor Equipment');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (3, 'Sorel', 'Winter Boots and Footwear');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (4, 'PrAna', 'Sustainable Activewear');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (5, 'Montrail', 'Trail Running Shoes');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (6, 'OutDry', 'Waterproof Technology');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (7, 'Pacific Trail', 'Outdoor Gear and Apparel');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (8, 'Columbia Kids', 'Outdoor Clothing for Kids');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (9, 'MHW Kids', 'Outdoor Gear for Kids');
INSERT INTO BRAND (brandCode, brandName, brandDescription) VALUES (10, 'Columbia Golf', 'Golf Apparel and Accessories');

--2 AUDIT_1
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(1, 'Spring', 'April', 'Quality Check on New Releases');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(2, 'Fall', 'September', 'Inventory Audit');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(3, 'Winter', 'December', 'Year-End Financial Audit');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(4, 'Summer', 'June', 'Product Compliance Check');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(5, 'Spring', 'March', 'Supplier Evaluation');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(6, 'Fall', 'October', 'Marketing Campaign Audit');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(7, 'Winter', 'January', 'Internal Process Review');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(8, 'Summer', 'July', 'Customer Service Evaluation');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(9, 'Spring', 'May', 'New Product Launch Audit');
INSERT INTO AUDIT_1 (auditID, season, month, description) VALUES(10, 'Fall', 'November', 'Supply Chain Assessment');

--3 Accounting Firm
SET DEFINE OFF;
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(1, 'Smith & Co. Accounting', 'John Smith', '123-456-7890', 'john.smith@smithco.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(2, 'Excel Financial Services', 'Alice Johnson', '987-654-3210', 'alice.johnson@excel-financial.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(3, 'Summit Auditors', 'David Brown', '456-789-0123', 'david.brown@summit-auditors.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(4, 'Peak Financial Consultants', 'Emma Davis', '789-012-3456', 'emma.davis@peak-finance.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(5, 'Alpine Audit Associates', 'Michael White', '234-567-8901', 'michael.white@alpine-audit.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(6, 'Cascade Financial Solutions', 'Olivia Wilson', '567-890-1234', 'olivia.wilson@cascade-finance.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(7, 'Everest Audit Group', 'Ethan Miller', '345-678-9012', 'ethan.miller@everest-audit.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(8, 'Glacier Financial Advisors', 'Sophia Taylor', '678-901-2345', 'sophia.taylor@glacier-finance.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(9, 'Mountainview Auditing', 'Daniel Johnson', '901-234-5678', 'daniel.johnson@mountainview-audit.com');
INSERT INTO ACCOUNTING_FIRM (firmID, firmName, contactName, contactPhoneNo, contactEmail) VALUES(10, 'Summit Financial Consultants', 'Ava Smith', '123-234-5678', 'ava.smith@summit-finance.com');

--4 Card Details
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('1234567890123456', '123', TO_DATE('2025-12-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('2345678901234567', '234', TO_DATE('2024-11-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('3456789012345678', '345', TO_DATE('2023-10-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('4567890123456789', '456', TO_DATE('2026-09-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('5678901234567890', '567', TO_DATE('2022-08-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('6789012345678901', '678', TO_DATE('2025-07-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('7890123456789012', '789', TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('8901234567890123', '890', TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('9012345678901234', '901', TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO CARD_DETAILS (CardNo, CVV, CardExpirationDate) VALUES('1122334455667788', '112', TO_DATE('2023-03-01', 'YYYY-MM-DD'));

--5 category
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(1, 'Outerwear', 'Hiking', 'Male');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(2, 'Footwear', 'Running', 'Female');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(3, 'Accessories', 'Camping', 'Unisex');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(4, 'Activewear', 'Yoga', 'Female');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(5, 'Footwear', 'Trail Running', 'Male');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(6, 'Outerwear', 'Skiing', 'Male');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(7, 'Accessories', 'Hiking', 'Unisex');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(8, 'Activewear', 'Gym', 'Male');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(9, 'Footwear', 'Walking', 'Female');
INSERT INTO CATEGORY (catID, productType, activity, gender) VALUES(10, 'Golf Apparel', 'Golf', 'Male');

--6 certificate_details
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(1, 'ISO 9001:2015 Quality Management System');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(2, 'ISO 14001:2015 Environmental Management System');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(3, 'OHSAS 18001:2007 Occupational Health and Safety Management System');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(4, 'Bluesign® System Partner');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(5, 'Fair Labor Association (FLA) Certification');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(6, 'REACH Compliance Certificate');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(7, 'Global Organic Textile Standard (GOTS)');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(8, 'Cruelty-Free Certification');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(9, 'Rainforest Alliance Certification');
INSERT INTO CERTIFICATE_DETAILS (certID, description) VALUES(10, 'Carbon Neutral Certification');

--7 collection
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(1, 'Winter Expedition', 'Winter', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-02-28', 'YYYY-MM-DD'), 'Explore our latest winter gear designed for extreme conditions.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(2, 'Spring Adventure', 'Spring', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'Gear up for spring with our versatile outdoor collection.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(3, 'Summer Essentials', 'Summer', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Stay cool and comfortable with our summer essentials.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(4, 'Fall Discovery', 'Fall', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), 'Discover the latest trends for fall exploration.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(5, 'Holiday Specials', 'Winter', TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'Celebrate the holidays with our special collection.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(6, 'Trailblazer Series', 'All Seasons', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'Designed for those who blaze their own trail.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(7, 'Sustainable Living', 'All Seasons', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-07-31', 'YYYY-MM-DD'), 'Explore our eco-friendly and sustainable collection.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(8, 'Active Lifestyle', 'All Seasons', TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-10-15', 'YYYY-MM-DD'), 'Live an active lifestyle with our performance-driven products.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(9, 'Winter Wonderland', 'Winter', TO_DATE('2024-11-15', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'), 'Experience the magic of winter with our cozy and stylish collection.');
INSERT INTO COLLECTION (collectionID, collectionName, season, releaseDate, endDate, description) VALUES(10, 'Spring Awakening', 'Spring', TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-04-15', 'YYYY-MM-DD'), 'Embrace the season of renewal with our vibrant spring collection.');

--9 location --10 more rows for newly-added employees
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('97201', 'Portland', 'Oregon', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('80202', 'Denver', 'Colorado', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('98101', 'Seattle', 'Washington', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('84101', 'Salt Lake City', 'Utah', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('83702', 'Boise', 'Idaho', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('85001', 'Phoenix', 'Arizona', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('87501', 'Santa Fe', 'New Mexico', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('89501', 'Reno', 'Nevada', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('59101', 'Billings', 'Montana', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('82001', 'Cheyenne', 'Wyoming', 'United States');

INSERT INTO LOCATION (zipcode, city, state, country) VALUES('12345', 'Springfield', 'Illinois', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('23456', 'Rivertown', 'California', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('34567', 'Lakeview', 'Texas', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('45678', 'Greenfield', 'New York', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('56789', 'Meadowville', 'Florida', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('67890', 'Harbor City', 'Washington', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('78901', 'Pinecrest', 'Georgia', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('89012', 'Crestwood', 'North Carolina', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('90123', 'Hilltop', 'Ohio', 'United States');
INSERT INTO LOCATION (zipcode, city, state, country) VALUES('01234', 'Valley Springs', 'Arizona', 'United States');



--8 fullfillment centre
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(1, 'Large', '97201');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(2, 'Medium', '80202');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(3, 'Small', '98101');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(4, 'Large', '84101');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(5, 'Medium', '83702');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(6, 'Small', '85001');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(7, 'Large', '87501');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(8, 'Medium', '89501');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(9, 'Small', '59101');
INSERT INTO FULFILLMENT_CENTER (fcID, size1, zipcode) VALUES(10, 'Large', '82001');

--10 manufacturer
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(1, 'OutdoorTech Manufacturing', '97201', '123-456-7890', 'info@outdoortech.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(2, 'TrailBlaze Gear Co.', '80202', '234-567-8901', 'contact@trailblazegear.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(3, 'Summit Performance Labs', '98101', '345-678-9012', 'info@summitlabs.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(4, 'EcoWare Innovations', '84101', '456-789-0123', 'sales@ecoware.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(5, 'PeakFootwear Inc.', '83702', '567-890-1234', 'info@peakfootwear.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(6, 'Everest Textile Works', '85001', '678-901-2345', 'contact@everesttextile.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(7, 'SantaFe Outdoors Manufacturing', '87501', '789-012-3456', 'sales@santafeoutdoors.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(8, 'Sierra Equipment Co.', '89501', '890-123-4567', 'info@sierraequipment.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(9, 'MountainGoods Ltd.', '59101', '901-234-5678', 'contact@mountaingoods.com');
INSERT INTO MANUFACTURER (manufacturerID, name, zipcode, contactPhoneNo, contactEmail) VALUES(10, 'Wilderness Creations', '82001', '234-567-8901', 'info@wildernesscreations.com');

--11 Promotions
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(1, 'HolidaySale2023', 'Celebrate the season with special discounts!', 20, 'Seasonal');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(2, 'OutdoorAdventureDeal', 'Get ready for your next adventure with exclusive offers.', 15, 'Adventure');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(3, 'BackToSchoolSale', 'Gear up for school with amazing discounts on selected items.', 10, 'Seasonal');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(4, 'SummerClearance', 'Beat the heat with hot deals on cool gear.', 25, 'Clearance');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(5, 'NewYearNewGear', 'Start the year fresh with new outdoor essentials.', 30, 'Seasonal');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(6, 'TrailblazerDiscounts', 'Exclusive discounts for those who blaze their own trail.', 18, 'Adventure');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(7, 'EcoFriendlyChoices', 'Support sustainability with discounts on eco-friendly products.', 15, 'Environmental');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(8, 'FitnessFrenzySale', 'Achieve your fitness goals with discounts on activewear and gear.', 20, 'Fitness');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(9, 'WinterWarmthSale', 'Stay warm and stylish with winter essentials at discounted prices.', 25, 'Seasonal');
INSERT INTO PROMOTIONS (promotionID, name, description, discountPercentage, type) VALUES(10, 'SpringIntoAction', 'Step into spring with great deals on outdoor gear and apparel.', 12, 'Seasonal');

--12 Customer
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(1, 'John Doe', 'john.doe@email.com', '123-456-7890', '97201');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(2, 'Alice Johnson', 'alice.j@email.com', '234-567-8901', '80202');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(3, 'Bob Smith', 'bob.smith@email.com', '345-678-9012', '98101');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(4, 'Emma Davis', 'emma.d@email.com', '456-789-0123', '84101');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(5, 'Michael White', 'michael.w@email.com', '567-890-1234', '83702');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(6, 'Olivia Wilson', 'olivia.w@email.com', '678-901-2345', '85001');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(7, 'Daniel Johnson', 'daniel.j@email.com', '789-012-3456', '87501');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(8, 'Sophia Taylor', 'sophia.t@email.com', '890-123-4567', '89501');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(9, 'Ethan Miller', 'ethan.m@email.com', '901-234-5678', '59101');
INSERT INTO CUSTOMER (CustomerID, name, emailAddress, PhoneNumber, zipcode) VALUES(10, 'Ava Smith', 'ava.s@email.com', '123-234-5678', '82001');

--13 Social media Presence
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(1, 'Instagram');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(2, 'Twitter');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(3, 'Facebook');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(4, 'Pinterest');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(5, 'LinkedIn');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(6, 'YouTube');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(7, 'TikTok');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(8, 'Snapchat');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(9, 'Reddit');
INSERT INTO SOCIALMEDIA_PRESENCE (smID, platform) VALUES(10, 'Tumblr');

-- 14 Store --manually insert 11th row for online store -- manually change "storeType"
INSERT INTO STORE (storeID, storeType) VALUES(1, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(2, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(3, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(4, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(5, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(6, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(7, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(8, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(9, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(10, 'Physical');
INSERT INTO STORE (storeID, storeType) VALUES(11, 'Online');

-- 15 Online_Store --manually add one row for online store
INSERT INTO ONLINE_STORE (OnlineStoreID) VALUES(11);

--16 Physical Store
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(1, '123-456-7890', 500, '97201');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(2, '234-567-8901', 300, '80202');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(3, '345-678-9012', 200, '98101');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(4, '456-789-0123', 400, '84101');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(5, '567-890-1234', 250, '83702');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(6, '678-901-2345', 150, '85001');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(7, '789-012-3456', 300, '87501');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(8, '890-123-4567', 200, '89501');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(9, '901-234-5678', 100, '59101');
INSERT INTO PHYSICAL_STORE (PhysicalStoreID, phoneNo, storeCapacity, zipcode) VALUES(10, '123-234-5678', 150, '82001');

--17 Product Type
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(1, 'Titanium Jacket', 150, 75, 1, 1);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(2, 'Trail Running Shoes', 120, 60, 5, 5);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(3, 'Sustainable Leggings', 50, 25, 4, 4);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(4, 'Winter Boots', 110, 55, 3, 1);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(5, 'Waterproof Backpack', 80, 40, 1, 3);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(6, 'Golf Polo Shirt', 70, 35, 10, 10);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(7, 'Ski Jacket', 180, 90, 1, 6);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(8, 'Camping Gear Set', 200, 100, 7, 3);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(9, 'Hiking Boots', 130, 65, 1, 7);
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(10, 'Running Shorts', 40, 20, 2, 2);

--Test for the front-end
UPDATE PRODUCTS_TYPE SET purchasingPrice = 80 WHERE prodID = 1;
DELETE FROM PRODUCTS_TYPE WHERE prodID = 10;
INSERT INTO PRODUCTS_TYPE (prodID, productName, sellingPrice, purchasingPrice, brandCode, catID) VALUES(11, 'Running Top', 40, 20, 2, 2);
DELETE FROM PRODUCTS_TYPE WHERE prodID = 11;


--18 Can_Supply
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(1, 1);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(2, 5);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(3, 4);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(4, 3);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(5, 1);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(6, 10);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(7, 7);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(8, 1);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(9, 1);
INSERT INTO CAN_SUPPLY (prodID, manufacturerID) VALUES(10, 2);

--19 Clearance Sale --manually insert one row for online store
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(1, TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-15', 'YYYY-MM-DD'), 1);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(2, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 2);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(3, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), 3);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(4, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 4);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(5, TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'), 5);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(6, TO_DATE('2024-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 6);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(7, TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), 7);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(8, TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), 8);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(9, TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'), 9);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(10, TO_DATE('2025-11-01', 'YYYY-MM-DD'), TO_DATE('2025-11-15', 'YYYY-MM-DD'), 10);
INSERT INTO CLEARANCE_SALE (saleID, saleStart, saleEnd, storeID) VALUES(11, TO_DATE('2025-12-01', 'YYYY-MM-DD'), TO_DATE('2026-01-15', 'YYYY-MM-DD'), 11);

--20 Clearance_detail --manually change the last row for online store
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(1, 1, '10%-50%', 100);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(2, 2, '20%-60%', 75);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(3, 3, '15%-40%', 50);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(4, 4, '25%-70%', 80);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(5, 5, '30%-50%', 60);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(6, 6, '10%-45%', 90);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(7, 7, '20%-55%', 120);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(8, 8, '15%-40%', 70);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(9, 9, '25%-60%', 110);
INSERT INTO CLEARANCE_DETAIL (prodID, saleID, discountrange, quantity) VALUES(10, 11, '30%-50%', 95);

--21 Guide --manually change every OnlineStoreID to 11
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(1, 'Outdoor Adventure Guide', 'Adventure', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(2, 'Fitness Essentials Guide', 'Fitness', TO_DATE('2023-03-20', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(3, 'Winter Fashion Lookbook', 'Fashion', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(4, 'Sustainable Living Tips', 'Sustainability', TO_DATE('2023-09-05', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(5, 'Backpacking Essentials', 'Adventure', TO_DATE('2023-12-12', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(6, 'Camping Gear Selection', 'Outdoor', TO_DATE('2024-02-28', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(7, 'Skiing Techniques', 'Winter Sports', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(8, 'Trail Running Basics', 'Running', TO_DATE('2024-08-15', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(9, 'Urban Fashion Trends', 'Fashion', TO_DATE('2024-11-30', 'YYYY-MM-DD'), 11);
INSERT INTO GUIDE (guideID, guideName, guideType, releaseDate, OnlineStoreID) VALUES(10, 'Hiking Trails Guide', 'Adventure', TO_DATE('2025-02-18', 'YYYY-MM-DD'), 11);

--22 Inventory
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(1, 500, 1);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(2, 300, 2);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(3, 200, 3);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(4, 400, 4);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(5, 250, 5);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(6, 150, 6);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(7, 300, 7);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(8, 200, 8);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(9, 100, 9);
INSERT INTO INVENTORY (inventoryID, expectedQuantity, fcID) VALUES(10, 150, 10);

--23 Membership
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(1, 50, TO_DATE('2022-03-15', 'YYYY-MM-DD'), TO_DATE('2023-03-15', 'YYYY-MM-DD'), 1);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(2, 60, TO_DATE('2022-05-20', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), 2);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(3, 45, TO_DATE('2022-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-10', 'YYYY-MM-DD'), 3);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(4, 55, TO_DATE('2022-09-25', 'YYYY-MM-DD'), TO_DATE('2023-09-25', 'YYYY-MM-DD'), 4);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(5, 70, TO_DATE('2022-11-12', 'YYYY-MM-DD'), TO_DATE('2023-11-12', 'YYYY-MM-DD'), 5);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(6, 65, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 6);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(7, 75, TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 7);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(8, 80, TO_DATE('2023-06-20', 'YYYY-MM-DD'), TO_DATE('2024-06-20', 'YYYY-MM-DD'), 8);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(9, 90, TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2024-08-15', 'YYYY-MM-DD'), 9);
INSERT INTO MEMBERSHIP (membershipID, annualCost, startDate, endDate, CustomerID) VALUES(10, 100, TO_DATE('2023-10-30', 'YYYY-MM-DD'), TO_DATE('2024-10-30', 'YYYY-MM-DD'), 10);

--24 Orders
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(1, 'Online', 'Processing', 2, 200, TO_DATE('2023-01-02 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(2, 'In-Store', 'Shipped', 1, 120, TO_DATE('2023-03-15 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(3, 'Online', 'Delivered', 3, 150, TO_DATE('2023-05-20 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(4, 'In-Store', 'Processing', 1, 80, TO_DATE('2023-08-01 14:20:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(5, 'Online', 'Shipped', 2, 220, TO_DATE('2023-10-10 11:10:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(6, 'In-Store', 'Delivered', 1, 120, TO_DATE('2024-01-05 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 6);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(7, 'Online', 'Processing', 2, 160, TO_DATE('2024-03-20 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 7);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(8, 'In-Store', 'Shipped', 1, 90, TO_DATE('2024-06-10 17:15:00', 'YYYY-MM-DD HH24:MI:SS'), 8);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(9, 'Online', 'Delivered', 3, 190, TO_DATE('2024-09-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9);
INSERT INTO ORDERS (orderID, orderType, status, quantity, TotalPrice, timestamp, CustomerID) VALUES(10, 'In-Store', 'Processing', 1, 110, TO_DATE('2024-12-12 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 10);

--25 Online _Order --manually change "OnlineStoreID" to 11
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(1, 'ABC123', 11, 1);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(2, 'DEF456', 11, 2);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(3, 'GHI789', 11, 3);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(4, 'JKL012', 11, 4);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(5, 'MNO345', 11, 5);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(6, 'PQR678', 11, 6);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(7, 'STU901', 11, 7);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(8, 'VWX234', 11, 8);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(9, 'YZA567', 11, 9);
INSERT INTO ONLINE_ORDER (OnlineOrderID, TrackingNo, OnlineStoreID, fcID) VALUES(10, 'BCD890', 11, 10);

--26 Physical_Order
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(1, 'PHYS123', 1);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(2, 'PHYS456', 2);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(3, 'PHYS789', 3);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(4, 'PHYS012', 4);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(5, 'PHYS345', 5);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(6, 'PHYS678', 6);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(7, 'PHYS901', 7);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(8, 'PHYS234', 8);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(9, 'PHYS567', 9);
INSERT INTO PHYSICAL_ORDER (PhysicalOrderID, receiptNo, PhysicalStoreID) VALUES(10, 'PHYS890', 10);

--27 Payment
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(1, 'Credit Card', TO_DATE('2023-01-02', 'YYYY-MM-DD'), 200, 1, 'Online', 1);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(2, 'Debit Card', TO_DATE('2023-03-15', 'YYYY-MM-DD'), 120, 2, 'In-Store', 2);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(3, 'Credit Card', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 150, 3, 'Online', 3);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(4, 'Cash', TO_DATE('2023-08-01', 'YYYY-MM-DD'), 80, 4, 'In-Store', 4);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(5, 'Credit Card', TO_DATE('2023-10-10', 'YYYY-MM-DD'), 220, 5, 'Online', 5);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(6, 'Debit Card', TO_DATE('2024-01-05', 'YYYY-MM-DD'), 120, 6, 'In-Store', 6);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(7, 'Credit Card', TO_DATE('2024-03-20', 'YYYY-MM-DD'), 160, 7, 'Online', 7);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(8, 'Cash', TO_DATE('2024-06-10', 'YYYY-MM-DD'), 90, 8, 'In-Store', 8);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(9, 'Credit Card', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 190, 9, 'Online', 9);
INSERT INTO PAYMENT (paymentID, paymentMethod, paymentDate, amount, CustomerID, type, orderID) VALUES(10, 'Debit Card', TO_DATE('2024-12-12', 'YYYY-MM-DD'), 110, 10, 'In-Store', 10);

--28 Online Payment --manually delete OnlinepaymentID --only 5 rows left
INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(1, '1111222233334444', 'Completed');
--INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(2, '5555666677778888', 'Completed');
INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(3, '9999000011112222', 'Completed');
--INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(4, '3333444455556666', 'Pending');
INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(5, '7777888899990000', 'Completed');
--INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(6, '1234123412345678', 'Completed');
INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(7, '8765876587658765', 'Pending');
--INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(8, '4321432143214321', 'Completed');
INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(9, '9876987698769876', 'Pending');
--INSERT INTO ONLINE_PAYMENT (OnlinepaymentID, CardNo, paymentStatus) VALUES(10, '2468246824682468', 'Completed');

--29 Offline-Payment --manually delete OnlinepaymentID --only 5 rows left
--INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(1, 'TRN123456');
INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(2, 'TRN234567');
--INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(3, 'TRN345678');
INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(4, 'TRN456789');
--INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(5, 'TRN567890');
INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(6, 'TRN678901');
--INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(7, 'TRN789012');
INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(8, 'TRN890123');
--INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(9, 'TRN901234');
INSERT INTO OFFLINE_PAYMENT (OfflinepaymentID, transaction_Reference_No) VALUES(10, 'TRN012345');

--30 Items --error unsolved
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(1, 50, 1, 1, 1);--unique constraint error
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(2, 40, 2, 2, 5);
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(3, 60, 3, 3, 4);
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(4, 35, 4, 4, 3);
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(5, 75, 5, 5, 1);
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(6, 55, 6, 6, 10);
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(7, 65, 7, 7, 7);--unique constraint error
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(8, 30, 8, 8, 1);
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(9, 90, 9, 9, 1);
INSERT INTO ITEMS (itemID, listPrice, inventoryID, prodID, manufacturerID) VALUES(10, 70, 10, 10, 2);

--31 customer_shippment_details --manually delete physical orders --5 rows left
INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(1, 1, 1, TO_DATE('2023-01-03', 'YYYY-MM-DD'), TO_DATE('2023-01-10', 'YYYY-MM-DD'));
--INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(2, 2, 2, TO_DATE('2023-03-18', 'YYYY-MM-DD'), TO_DATE('2023-03-25', 'YYYY-MM-DD'));
INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(3, 3, 3, TO_DATE('2023-05-22', 'YYYY-MM-DD'), TO_DATE('2023-05-29', 'YYYY-MM-DD'));
--INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(4, 4, 4, TO_DATE('2023-08-03', 'YYYY-MM-DD'), TO_DATE('2023-08-10', 'YYYY-MM-DD'));
INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(5, 5, 5, TO_DATE('2023-10-12', 'YYYY-MM-DD'), TO_DATE('2023-10-19', 'YYYY-MM-DD'));
--INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(6, 6, 6, TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_DATE('2024-01-14', 'YYYY-MM-DD'));
INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(7, 7, 7, TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-29', 'YYYY-MM-DD'));
--INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(8, 8, 8, TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2024-06-22', 'YYYY-MM-DD'));
INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(9, 9, 9, TO_DATE('2024-09-10', 'YYYY-MM-DD'), TO_DATE('2024-09-17', 'YYYY-MM-DD'));
--INSERT INTO CUSTOMER_SHIPMENT_DETAILS (shipmentID, CustomerID, orderID, startDate, arriveDate) VALUES(10, 10, 10, TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_DATE('2024-12-24', 'YYYY-MM-DD'));

--32 Exchange
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(1, 'Wrong Size');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(2, 'Defective Item');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(3, 'Changed Mind');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(4, 'Received Wrong Product');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(5, 'Item Not as Described');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(6, 'Damaged in Transit');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(7, 'Duplicate Order');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(8, 'Expired Product');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(9, 'Unsatisfactory Quality');
INSERT INTO EXCHANGE (ExchangeOrderID, reason) VALUES(10, 'No Longer Needed');

--33 Exchange Details --"reason" deleted
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(1, 1, 1, 25);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(2, 2, 1, 20);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(3, 3, 1, 30);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(4, 4, 1, 15);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(5, 5, 1, 35);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(6, 6, 1, 25);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(7, 7, 1, 30);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(8, 8, 1, 10);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(9, 9, 1, 45);
INSERT INTO EXCHANGE_DETAILS (ExchangeOrderID, itemID, quantity, amount) VALUES(10, 10, 1, 35);

--34 Return
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(1, 'Wrong Size');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(2, 'Defective Item');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(3, 'Changed Mind');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(4, 'Received Wrong Product');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(5, 'Item Not as Described');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(6, 'Damaged in Transit');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(7, 'Duplicate Order');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(8, 'Expired Product');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(9, 'Unsatisfactory Quality');
INSERT INTO RETURN (ReturnOrderID, reason) VALUES(10, 'No Longer Needed');

--35 Return_Details --Delete "reason", we already have that in "RETURN" table
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(1, 1, 1, 1, 25);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(2, 2, 2, 1, 20);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(3, 3, 3, 1, 30);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(4, 4, 4, 1, 15);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(5, 5, 5, 1, 35);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(6, 6, 6, 1, 25);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(7, 7, 7, 1, 30);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(8, 8, 8, 1, 10);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(9, 9, 9, 1, 45);
INSERT INTO RETURN_DETAIL (ReturnOrderID, itemID, returnID, quantity, amount) VALUES(10, 10, 10, 1, 35);

--36 reviews
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(1, TO_DATE('2023-01-05', 'YYYY-MM-DD'), NULL, 'Great product, fits perfectly!', 1, 1);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(2, TO_DATE('2023-03-20', 'YYYY-MM-DD'), NULL, 'Excellent quality, fast delivery.', 2, 2);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(3, TO_DATE('2023-05-25', 'YYYY-MM-DD'), NULL, 'Changed my mind, want a refund.', 3, 3);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(4, TO_DATE('2023-08-05', 'YYYY-MM-DD'), NULL, 'Received the wrong size, disappointed.', 4, 4);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(5, TO_DATE('2023-10-15', 'YYYY-MM-DD'), NULL, 'Not as described, returning.', 5, 5);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(6, TO_DATE('2024-01-10', 'YYYY-MM-DD'), NULL, 'Damaged during transit, need a replacement.', 6, 6);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(7, TO_DATE('2024-03-25', 'YYYY-MM-DD'), NULL, 'Duplicate order, what do I do?', 7, 7);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(8, TO_DATE('2024-06-15', 'YYYY-MM-DD'), NULL, 'Expired product received, not happy.', 8, 8);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(9, TO_DATE('2024-09-10', 'YYYY-MM-DD'), NULL, 'Unsatisfactory quality, want a refund.', 9, 9);
INSERT INTO REVIEWS (reviewID, reviewDate, image, content, CustomerID, productID) VALUES(10, TO_DATE('2024-12-20', 'YYYY-MM-DD'), NULL, 'No longer needed, can I return it?', 10, 10);

--37 Employees --30 rows in total, 10 rows for each type of employee respectively 
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(1, 'John', 'Doe', 'john.doe@example.com', 'Sales Associate', 'Retail Store Employee', TO_DATE('2020-01-10', 'YYYY-MM-DD'), '12345', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Manager', 'Retail Store Employee', TO_DATE('2020-02-15', 'YYYY-MM-DD'), '23456', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 'Cashier', 'Retail Store Employee', TO_DATE('2020-03-20', 'YYYY-MM-DD'), '34567', 1);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(4, 'Emily', 'Williams', 'emily.williams@example.com', 'Store Associate', 'Retail Store Employee', TO_DATE('2020-04-25', 'YYYY-MM-DD'), '45678', 2);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(5, 'Daniel', 'Brown', 'daniel.brown@example.com', 'Supervisor', 'Retail Store Employee', TO_DATE('2020-05-30', 'YYYY-MM-DD'), '56789', 3);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(6, 'Sophia', 'Jones', 'sophia.jones@example.com', 'Sales Associate', 'Retail Store Employee', TO_DATE('2020-06-05', 'YYYY-MM-DD'), '67890', 4);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(7, 'Matthew', 'Miller', 'matthew.miller@example.com', 'Manager', 'Retail Store Employee', TO_DATE('2020-07-10', 'YYYY-MM-DD'), '78901', 5);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(8, 'Olivia', 'Davis', 'olivia.davis@example.com', 'Cashier', 'Retail Store Employee', TO_DATE('2020-08-15', 'YYYY-MM-DD'), '89012', 6);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(9, 'William', 'Martinez', 'william.martinez@example.com', 'Store Associate', 'Retail Store Employee', TO_DATE('2020-09-20', 'YYYY-MM-DD'), '90123', 7);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(10, 'Ava', 'Taylor', 'ava.taylor@example.com', 'Supervisor', 'Retail Store Employee', TO_DATE('2020-10-25', 'YYYY-MM-DD'), '01234', 8);

INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(11, 'Isaac', 'Cooper', 'isaac.cooper@example.com', 'Financial Analyst', 'Corporate Employee', TO_DATE('2023-11-11', 'YYYY-MM-DD'), '12345', 20);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(12, 'Scarlett', 'Reyes', 'scarlett.reyes@example.com', 'Marketing Specialist', 'Corporate Employee', TO_DATE('2023-11-12', 'YYYY-MM-DD'), '23456', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(13, 'Lucas', 'Riley', 'lucas.riley@example.com', 'IT Manager', 'Corporate Employee', TO_DATE('2023-11-13', 'YYYY-MM-DD'), '34567', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(14, 'Aria', 'Harrison', 'aria.harrison@example.com', 'HR Manager', 'Corporate Employee', TO_DATE('2023-11-14', 'YYYY-MM-DD'), '45678', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(15, 'Carter', 'Ford', 'carter.ford@example.com', 'Legal Counsel', 'Corporate Employee', TO_DATE('2023-11-15', 'YYYY-MM-DD'), '56789', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(16, 'Eva', 'Owens', 'eva.owens@example.com', 'Data Scientist', 'Corporate Employee', TO_DATE('2023-11-16', 'YYYY-MM-DD'), '67890', 13);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(17, 'Hudson', 'Gomez', 'hudson.gomez@example.com', 'Public Relations Manager', 'Corporate Employee', TO_DATE('2023-11-17', 'YYYY-MM-DD'), '78901', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(18, 'Natalie', 'Knight', 'natalie.knight@example.com', 'Customer Success Manager', 'Corporate Employee', TO_DATE('2023-11-18', 'YYYY-MM-DD'), '89012', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(19, 'Logan', 'Bryant', 'logan.bryant@example.com', 'Software Developer', 'Corporate Employee', TO_DATE('2023-11-19', 'YYYY-MM-DD'), '90123', 13);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(20, 'Penelope', 'Wells', 'penelope.wells@example.com', 'Finance Manager', 'Corporate Employee', TO_DATE('2023-11-20', 'YYYY-MM-DD'), '01234', NULL);

INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(22, 'Gabriel', 'Thomas', 'gabriel.thomas@example.com', 'Inventory Manager', 'FC Employee', TO_DATE('2023-11-02', 'YYYY-MM-DD'), '23456', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(25, 'Liam', 'Ward', 'liam.ward@example.com', 'Packing Supervisor', 'FC Employee', TO_DATE('2023-11-05', 'YYYY-MM-DD'), '56789', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(27, 'Jackson', 'Barnes', 'jackson.barnes@example.com', 'Inventory Manager', 'FC Employee', TO_DATE('2023-11-07', 'YYYY-MM-DD'), '78901', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(30, 'Luna', 'Adams', 'luna.adams@example.com', 'Packing Supervisor', 'FC Employee', TO_DATE('2023-11-10', 'YYYY-MM-DD'), '01234', NULL);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(21, 'Ella', 'Anderson', 'ella.anderson@example.com', 'Warehouse Associate', 'FC Employee', TO_DATE('2023-11-01', 'YYYY-MM-DD'), '12345', 22);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(23, 'Aiden', 'Hill', 'aiden.hill@example.com', 'Shipping Coordinator', 'FC Employee', TO_DATE('2023-11-03', 'YYYY-MM-DD'), '34567', 22);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(24, 'Mila', 'Baker', 'mila.baker@example.com', 'Quality Control Specialist', 'FC Employee', TO_DATE('2023-11-04', 'YYYY-MM-DD'), '45678', 22);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(26, 'Zoe', 'Fisher', 'zoe.fisher@example.com', 'Warehouse Associate', 'FC Employee', TO_DATE('2023-11-06', 'YYYY-MM-DD'), '67890', 27);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(28, 'Avery', 'Coleman', 'avery.coleman@example.com', 'Shipping Coordinator', 'FC Employee', TO_DATE('2023-11-08', 'YYYY-MM-DD'), '89012', 27);
INSERT INTO EMPLOYEES (empID, fname, lname, employee_email, position, employeeType, startDate, zipcode, supervisorID) VALUES(29, 'Ethan', 'Gray', 'ethan.gray@example.com', 'Quality Control Specialist', 'FC Employee', TO_DATE('2023-11-09', 'YYYY-MM-DD'), '90123', 27);

--38 FC_employees
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(21, 15.50, 'Inventory', 40);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(22, 18.75, 'Inventory', 35);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(23, 16.20, 'Shipping', 30);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(24, 20.00, 'Quality Control', 45);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(25, 17.50, 'Packing', 38);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(26, 19.00, 'Inventory', 42);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(27, 16.75, 'Inventory', 35);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(28, 22.00, 'Shipping', 40);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(29, 18.25, 'Quality Control', 50);
INSERT INTO FC_EMPLOYEE (fc_empId, hourlyRate, categoryIncharge, HoursPerWeek) VALUES(30, 21.50, 'Packing', 38);

--39 Retail Store Employees
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(1, 50);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(2, 65);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(3, 30);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(4, 75);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(5, 60);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(6, 45);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(7, 80);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(8, 55);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(9, 70);
INSERT INTO RETAIL_STORE_EMPLOYEE (retail_empID, salesMade) VALUES(10, 90);

--40 Corporate Employees
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(11, 75000, '100 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(12, 90000, '150 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(13, 80000, '120 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(14, 100000, '200 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(15, 85000, '140 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(16, 95000, '180 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(17, 90000, '150 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(18, 110000, '220 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(19, 95000, '180 RSUs');
INSERT INTO CORPORATE_EMPLOYEE (corp_empID, basesalary, rsuDetails) VALUES(20, 105000, '200 RSUs');

--41 Customer Support
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(1, 'Technical Support', 'Assistance with website navigation', 1, 11);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(2, 'Product Inquiry', 'Information about product specifications', 2, 12);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(3, 'Order Issues', 'Assistance with order tracking', 3, 13);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(4, 'Returns and Exchanges', 'Guidance on the return process', 4, 14);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(5, 'Billing Inquiry', 'Questions about invoice and payment', 5, 15);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(6, 'General Inquiry', 'General assistance and information', 6, 16);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(7, 'Technical Support', 'Assistance with website navigation', 7, 17);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(8, 'Product Inquiry', 'Information about product specifications', 8, 18);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(9, 'Order Issues', 'Assistance with order tracking', 9, 19);
INSERT INTO CUSTOMER_SUPPORT (supportID, supportType, supportDescription, CustomerID, corp_empID) VALUES(10, 'Returns and Exchanges', 'Guidance on the return process', 10, 20);

--42 Order-Line
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(1, 1);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(2, 2);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(3, 3);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(4, 4);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(5, 5);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(6, 6);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(7, 7);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(8, 8);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(9, 9);
INSERT INTO ORDER_LINE (orderID, item_id) VALUES(10, 10);

--43 Account Mnaagement
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(1, 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 50000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(2, 2, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 75000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(3, 3, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 60000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(4, 4, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 80000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(5, 5, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 70000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(6, 6, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 55000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(7, 7, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 90000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(8, 8, TO_DATE('2023-08-01', 'YYYY-MM-DD'), 65000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(9, 9, TO_DATE('2023-09-01', 'YYYY-MM-DD'), 75000);
INSERT INTO ACCOUNT_MANAGEMENT (storeID, smID, startDate, NumOfFollowers) VALUES(10, 10, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 100000);

--44 Employee_Training
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(1, 'Customer Service Training', 'On-site', 16);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(2, 'Product Knowledge', 'Online', 10);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(3, 'Management Skills', 'On-site', 20);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(4, 'Technical Support Certification', 'Online', 12);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(5, 'Sales Techniques', 'On-site', 18);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(6, 'Product Safety Guidelines', 'Online', 8);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(7, 'Conflict Resolution', 'On-site', 14);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(8, 'Financial Management', 'Online', 15);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(9, 'Inventory Management', 'On-site', 22);
INSERT INTO EMPLOYEE_TRAINING (trainingID, trainingName, trainingType, trainingDuration) VALUES(10, 'Data Security Awareness', 'Online', 10);

--45 certifications
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(1, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(2, 2, TO_DATE('2023-02-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(3, 3, TO_DATE('2023-03-25', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(4, 4, TO_DATE('2023-04-30', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(5, 5, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(6, 6, TO_DATE('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(7, 7, TO_DATE('2023-07-25', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(8, 8, TO_DATE('2023-08-30', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(9, 9, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(10, 10, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(11, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(12, 2, TO_DATE('2023-02-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(13, 3, TO_DATE('2023-03-25', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(14, 4, TO_DATE('2023-04-30', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(15, 5, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(16, 6, TO_DATE('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(17, 7, TO_DATE('2023-07-25', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(18, 8, TO_DATE('2023-08-30', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(19, 9, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(20, 10, TO_DATE('2023-10-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(21, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(22, 2, TO_DATE('2023-02-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(23, 3, TO_DATE('2023-03-25', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(24, 4, TO_DATE('2023-04-30', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(25, 5, TO_DATE('2023-05-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(26, 6, TO_DATE('2023-06-20', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(27, 7, TO_DATE('2023-07-25', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(28, 8, TO_DATE('2023-08-30', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(29, 9, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO CERTIFICATIONS (empID, trainingID, issueDate) VALUES(30, 10, TO_DATE('2023-10-20', 'YYYY-MM-DD'));

--46 EMPLOYEE-PhoneNo
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(1, '123-456-7890');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(2, '234-567-8901');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(3, '345-678-9012');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(4, '456-789-0123');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(5, '567-890-1234');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(6, '678-901-2345');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(7, '789-012-3456');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(8, '890-123-4567');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(9, '901-234-5678');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(10, '012-345-6789');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(11, '555-111-1111');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(12, '555-222-2222');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(13, '555-333-3333');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(14, '555-444-4444');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(15, '555-555-5555');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(16, '555-666-6666');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(17, '555-777-7777');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(18, '555-888-8888');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(19, '555-999-9999');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(20, '555-000-0000');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(21, '555-123-4567');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(22, '555-765-4321');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(23, '555-111-9876');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(24, '555-987-6543');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(25, '555-111-1357');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(26, '555-246-8024');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(27, '555-333-2468');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(28, '555-135-7924');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(29, '555-444-7890');
INSERT INTO EMPLOYEE_PHONENO (empID, phoneNo) VALUES(30, '555-678-0123');

--47 fc_schedule
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(1, 21, 1);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(2, 22, 2);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(3, 23, 3);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(4, 24, 4);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(5, 25, 5);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(6, 26, 6);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(7, 27, 7);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(8, 28, 8);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(9, 29, 9);
INSERT INTO FC_SCHEDULE (fcID, empID, scheduleID) VALUES(10, 30, 10);

--48 FC_schedule_workdays
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(1, 21, 1, 'Monday, Wednesday, Friday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(2, 22, 2, 'Tuesday, Thursday, Saturday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(3, 23, 3, 'Monday, Wednesday, Friday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(4, 24, 4, 'Tuesday, Thursday, Saturday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(5, 25, 5, 'Monday, Wednesday, Friday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(6, 26, 6, 'Tuesday, Thursday, Saturday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(7, 27, 7, 'Monday, Wednesday, Friday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(8, 28, 8, 'Tuesday, Thursday, Saturday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(9, 29, 9, 'Monday, Wednesday, Friday');
INSERT INTO FC_SCHEDULE_WORKDAYS (fcID, empID, scheduleID, workdays) VALUES(10, 30, 10, 'Tuesday, Thursday, Saturday');

--49 Hold table --manually add rows for online store
INSERT INTO HOLD (saleID, storeID) VALUES(1, 1);
INSERT INTO HOLD (saleID, storeID) VALUES(2, 2);
INSERT INTO HOLD (saleID, storeID) VALUES(3, 3);
INSERT INTO HOLD (saleID, storeID) VALUES(4, 4);
INSERT INTO HOLD (saleID, storeID) VALUES(5, 5);
INSERT INTO HOLD (saleID, storeID) VALUES(6, 6);
INSERT INTO HOLD (saleID, storeID) VALUES(7, 7);
INSERT INTO HOLD (saleID, storeID) VALUES(8, 8);
INSERT INTO HOLD (saleID, storeID) VALUES(9, 9);
INSERT INTO HOLD (saleID, storeID) VALUES(10, 10);
INSERT INTO HOLD (saleID, storeID) VALUES(1, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(2, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(3, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(4, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(5, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(6, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(7, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(8, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(9, 11);
INSERT INTO HOLD (saleID, storeID) VALUES(10, 11);

-- 50 Manages --delete the online ones
--INSERT INTO MANAGES (empID, storeID, orderID) VALUES(1, 1, 1);
INSERT INTO MANAGES (empID, storeID, orderID) VALUES(2, 2, 2);
--INSERT INTO MANAGES (empID, storeID, orderID) VALUES(3, 3, 3);
INSERT INTO MANAGES (empID, storeID, orderID) VALUES(4, 4, 4);
--INSERT INTO MANAGES (empID, storeID, orderID) VALUES(5, 5, 5);
INSERT INTO MANAGES (empID, storeID, orderID) VALUES(6, 6, 6);
--INSERT INTO MANAGES (empID, storeID, orderID) VALUES(7, 7, 7);
INSERT INTO MANAGES (empID, storeID, orderID) VALUES(8, 8, 8);
--INSERT INTO MANAGES (empID, storeID, orderID) VALUES(9, 9, 9);
INSERT INTO MANAGES (empID, storeID, orderID) VALUES(10, 10, 10);


--51 Peform_audit
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (1, 1, 1);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (2, 2, 2);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (3, 3, 3);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (4, 4, 4);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (5, 5, 5);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (6, 6, 6);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (7, 7, 7);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (8, 8, 8);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (9, 9, 9);
INSERT INTO PERFORM_AUDIT (firmID, storeID, auditID) VALUES (10, 10, 10);

--52 Promo Code --manually delete physical ones --5 rows left
INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1);
--INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(2, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 2);
INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(3, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 3);
--INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(4, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 4);
INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(5, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 5);
--INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(6, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 6);
INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(7, TO_DATE('2023-07-01', 'YYYY-MM-DD'), 7);
--INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(8, TO_DATE('2023-08-01', 'YYYY-MM-DD'), 8);
INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(9, TO_DATE('2023-09-01', 'YYYY-MM-DD'), 9);
--INSERT INTO PROMOCODE (promoID, validity, OnlinepaymentID) VALUES(10, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 10);

--53 voucher --manually delete online ones --5 rows left
--INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(2, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 2, 2);
--INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(3, TO_DATE('2023-03-25', 'YYYY-MM-DD'), 3, 3);
INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(4, TO_DATE('2023-04-30', 'YYYY-MM-DD'), 4, 4);
--INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(5, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 5, 5);
INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(6, TO_DATE('2023-06-20', 'YYYY-MM-DD'), 6, 6);
--INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(7, TO_DATE('2023-07-25', 'YYYY-MM-DD'), 7, 7);
INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(8, TO_DATE('2023-08-30', 'YYYY-MM-DD'), 8, 8);
--INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(9, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 9, 9);
INSERT INTO VOUCHERS (voucherID, expDate, NumOfAllowedUsage, OfflinepaymentID) VALUES(10, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 10, 10);

--54 Partners
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(1, 'Partner 1', 'John Doe', '123-456-7890', 'partner1@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(2, 'Partner 2', 'Jane Smith', '234-567-8901', 'partner2@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(3, 'Partner 3', 'Michael Johnson', '345-678-9012', 'partner3@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(4, 'Partner 4', 'Emily Williams', '456-789-0123', 'partner4@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(5, 'Partner 5', 'Daniel Brown', '567-890-1234', 'partner5@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(6, 'Partner 6', 'Sophia Jones', '678-901-2345', 'partner6@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(7, 'Partner 7', 'Matthew Miller', '789-012-3456', 'partner7@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(8, 'Partner 8', 'Olivia Davis', '890-123-4567', 'partner8@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(9, 'Partner 9', 'William Martinez', '901-234-5678', 'partner9@example.com');
INSERT INTO PARTNER (partnerID, partnerName, contactName, contactPhoneNum, contactEmail) VALUES(10, 'Partner 10', 'Ava Taylor', '012-345-6789', 'partner10@example.com');

DELETE FROM PARTNER WHERE partnerID = 10;
UPDATE PARTNER SET partnerName = 'John Doe jr.' WHERE partnerID = 1;

-----------------------------------------------------------------------------------------------------------------
--Update values for queries!!!
--REVIEWS
UPDATE REVIEWS SET rating = 4 WHERE reviewID = 1;
UPDATE REVIEWS SET rating = 5 WHERE reviewID = 2;
UPDATE REVIEWS SET rating = 3 WHERE reviewID = 3;
UPDATE REVIEWS SET rating = 1 WHERE reviewID = 4;
UPDATE REVIEWS SET rating = 1 WHERE reviewID = 5;
UPDATE REVIEWS SET rating = 1 WHERE reviewID = 6;
UPDATE REVIEWS SET rating = 2 WHERE reviewID = 7;
UPDATE REVIEWS SET rating = 1 WHERE reviewID = 8;
UPDATE REVIEWS SET rating = 1 WHERE reviewID = 9;
UPDATE REVIEWS SET rating = 3 WHERE reviewID = 10;

--CATEGORY
-- Updated rows
UPDATE CATEGORY SET season = 'Fall' WHERE catID = 1;
UPDATE CATEGORY SET season = 'Spring' WHERE catID = 2;
UPDATE CATEGORY SET season = 'Summer' WHERE catID = 3;
UPDATE CATEGORY SET season = 'Winter' WHERE catID = 4;
UPDATE CATEGORY SET season = 'Fall' WHERE catID = 5;
UPDATE CATEGORY SET season = 'Winter' WHERE catID = 6;
UPDATE CATEGORY SET season = 'Spring' WHERE catID = 7;
UPDATE CATEGORY SET season = 'Summer' WHERE catID = 8;
UPDATE CATEGORY SET season = 'Fall' WHERE catID = 9;
UPDATE CATEGORY SET season = 'Spring' WHERE catID = 10;

-- New rows
INSERT INTO CATEGORY VALUES(11, 'Apparel', 'Running', 'Male', 'Summer');
INSERT INTO CATEGORY VALUES(12, 'Footwear', 'Hiking', 'Female', 'Fall');
INSERT INTO CATEGORY VALUES(13, 'Accessories', 'Cycling', 'Unisex', 'Spring');
INSERT INTO CATEGORY VALUES(14, 'Outerwear', 'Yoga', 'Male', 'Winter');
INSERT INTO CATEGORY VALUES(15, 'Sportswear', 'Team Sports', 'Female', 'Summer');
INSERT INTO CATEGORY VALUES(16, 'Footwear', 'Gym', 'Unisex', 'Fall');
INSERT INTO CATEGORY VALUES(17, 'Accessories', 'Climbing', 'Male', 'Spring');
INSERT INTO CATEGORY VALUES(18, 'Outerwear', 'Running', 'Female', 'Winter');
INSERT INTO CATEGORY VALUES(19, 'Apparel', 'Cycling', 'Unisex', 'Summer');
INSERT INTO CATEGORY VALUES(20, 'Sportswear', 'Yoga', 'Male', 'Fall');
INSERT INTO CATEGORY VALUES(21, 'Footwear', 'Team Sports', 'Female', 'Spring');
INSERT INTO CATEGORY VALUES(22, 'Accessories', 'Gym', 'Unisex', 'Winter');
INSERT INTO CATEGORY VALUES(23, 'Outerwear', 'Climbing', 'Male', 'Summer');
INSERT INTO CATEGORY VALUES(24, 'Apparel', 'Running', 'Female', 'Fall');
INSERT INTO CATEGORY VALUES(25, 'Sportswear', 'Hiking', 'Unisex', 'Spring');
INSERT INTO CATEGORY VALUES(26, 'Footwear', 'Cycling', 'Male', 'Winter');
INSERT INTO CATEGORY VALUES(27, 'Accessories', 'Yoga', 'Female', 'Summer');
INSERT INTO CATEGORY VALUES(28, 'Outerwear', 'Team Sports', 'Unisex', 'Fall');
INSERT INTO CATEGORY VALUES(29, 'Apparel', 'Gym', 'Male', 'Spring');
INSERT INTO CATEGORY VALUES(30, 'Sportswear', 'Climbing', 'Female', 'Winter');
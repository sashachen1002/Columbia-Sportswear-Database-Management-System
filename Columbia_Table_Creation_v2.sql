--1 Brand Table

CREATE TABLE BRAND (
    brandCode NUMBER,
    brandName VARCHAR2(100),
    brandDescription VARCHAR2(255),
    CONSTRAINT pk_brand PRIMARY KEY (brandCode)
);

--2 Audit Table 

CREATE TABLE AUDIT_1 (
    auditID NUMBER,
    season VARCHAR2(50),
    month VARCHAR2(20),
    description VARCHAR2(255),
    CONSTRAINT pk_audit PRIMARY KEY (auditID)
);

--3 Accounting Firm

CREATE TABLE ACCOUNTING_FIRM (
    firmID NUMBER PRIMARY KEY,
    firmName VARCHAR2(100),
    contactName VARCHAR2(100),
    contactPhoneNo VARCHAR2(15),
    contactEmail VARCHAR2(100),
    CONSTRAINT uc_accounting_firm_email UNIQUE (contactEmail)
);

--4 Card Details

CREATE TABLE CARD_DETAILS (
    CardNo VARCHAR2(16) PRIMARY KEY,
    CVV VARCHAR2(4),
    CardExpirationDate DATE
);

--5 category

CREATE TABLE CATEGORY (
    catID NUMBER PRIMARY KEY,
    productType VARCHAR2(100),
    activity VARCHAR2(100),
    gender VARCHAR2(10)
);

--6 certificate_details

CREATE TABLE CERTIFICATE_DETAILS (
    certID NUMBER PRIMARY KEY,
    description VARCHAR2(255)
);

--7 collection
CREATE TABLE COLLECTION (
    collectionID NUMBER PRIMARY KEY,
    collectionName VARCHAR2(100),
    season VARCHAR2(50),
    releaseDate DATE,
    endDate DATE,
    description VARCHAR2(255)
);

--8 fullfillment centre

CREATE TABLE FULFILLMENT_CENTER (
    fcID NUMBER PRIMARY KEY,
    size1 VARCHAR2(100),
    city VARCHAR2(100),
    state VARCHAR2(100),
    zipcode VARCHAR2(10)
);

-- 8-1 fullfillment centre (foreign key constraint changed)

CREATE TABLE FULFILLMENT_CENTER (
    fcID NUMBER PRIMARY KEY,
    size1 VARCHAR2(100),
    zipcode VARCHAR2(10),
    CONSTRAINT fk_fulfillmentCenter_location FOREIGN KEY (zipcode) REFERENCES LOCATION(zipcode)
);

--9 location
CREATE TABLE LOCATION (
    zipcode VARCHAR2(10) PRIMARY KEY,
    city VARCHAR2(100),
    state VARCHAR2(100),
    country VARCHAR2(100)
);

--10 manufacturer

CREATE TABLE MANUFACTURER (
    manufacturerID NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    zipcode VARCHAR2(10),
    contactPhoneNo VARCHAR2(15),
    contactEmail VARCHAR2(100),
    CONSTRAINT fk_manufacturer_location FOREIGN KEY (zipcode) REFERENCES LOCATION(zipcode)
);

--11 Promotions

CREATE TABLE PROMOTIONS (
    promotionID NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    description VARCHAR2(255),
    discountPercentage NUMBER,
    type VARCHAR2(50),
    CONSTRAINT chk_promotions_discount CHECK (discountPercentage >= 0 AND discountPercentage <= 100)
);

--12 Customer

CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    emailAddress VARCHAR2(100),
    PhoneNumber VARCHAR2(15),
    zipcode VARCHAR2(10),
    CONSTRAINT uc_customer_email UNIQUE (emailAddress),
    CONSTRAINT fk_customer_zipcode FOREIGN KEY (zipcode) REFERENCES LOCATION(zipcode)
);


--13 Social media Presence

CREATE TABLE SOCIALMEDIA_PRESENCE (
    smID NUMBER PRIMARY KEY,
    platform VARCHAR2(100)
);

-- 14 Store 
CREATE TABLE STORE (
    storeID NUMBER PRIMARY KEY,
    storeType VARCHAR2(50)
);

-- 15 Online_Store
CREATE TABLE ONLINE_STORE (
    OnlineStoreID NUMBER PRIMARY KEY,
    CONSTRAINT fk_online_store_storeID FOREIGN KEY (OnlineStoreID) REFERENCES STORE(storeID)
);

--16 Physical Store
CREATE TABLE PHYSICAL_STORE (
    PhysicalStoreID NUMBER PRIMARY KEY,
    phoneNo VARCHAR2(15),
    storeCapacity NUMBER,
    zipcode VARCHAR2(10),
    CONSTRAINT uc_physical_store_phoneNo UNIQUE (phoneNo),
    CONSTRAINT fk_physical_store_storeID FOREIGN KEY (PhysicalStoreID) REFERENCES STORE(storeID),
    CONSTRAINT fk_physical_store_zipcode FOREIGN KEY (zipcode) REFERENCES LOCATION(zipcode)
);

--17 Product Type
CREATE TABLE PRODUCTS_TYPE (
    prodID NUMBER PRIMARY KEY,
    productName VARCHAR2(100),
    sellingPrice NUMBER,
    purchasingPrice NUMBER,
    brandCode NUMBER,
    catID NUMBER,
    CONSTRAINT fk_products_type_brandCode FOREIGN KEY (brandCode) REFERENCES BRAND(brandCode),
    CONSTRAINT fk_products_type_catID FOREIGN KEY (catID) REFERENCES CATEGORY(catID)
);

--18 Can_Supply
CREATE TABLE CAN_SUPPLY (
    prodID NUMBER,
    manufacturerID NUMBER,
    PRIMARY KEY (prodID, manufacturerID),
    CONSTRAINT fk_can_supply_prodID FOREIGN KEY (prodID) REFERENCES PRODUCTS_TYPE(prodID),
    CONSTRAINT fk_can_supply_manufacturerID FOREIGN KEY (manufacturerID) REFERENCES MANUFACTURER(manufacturerID)
);

--19 Clearance Sale
CREATE TABLE CLEARANCE_SALE (
    saleID NUMBER PRIMARY KEY,
    saleStart DATE,
    saleEnd DATE,
    storeID NUMBER,
    CONSTRAINT fk_clearance_sale_storeID FOREIGN KEY (storeID) REFERENCES STORE(storeID)
);

--20 Clearance_detail
CREATE TABLE CLEARANCE_DETAIL (
    prodID NUMBER,
    saleID NUMBER,
    discountrange VARCHAR2(50),
    quantity NUMBER,
    PRIMARY KEY (prodID, saleID),
    CONSTRAINT fk_clearance_detail_prodID FOREIGN KEY (prodID) REFERENCES PRODUCTS_TYPE(prodID),
    CONSTRAINT fk_clearance_detail_saleID FOREIGN KEY (saleID) REFERENCES CLEARANCE_SALE(saleID)
);

--21 Guide

CREATE TABLE GUIDE (
    guideID NUMBER PRIMARY KEY,
    guideName VARCHAR2(100),
    guideType VARCHAR2(100),
    releaseDate DATE,
    OnlineStoreID NUMBER,
    CONSTRAINT fk_guide_storeID FOREIGN KEY (OnlineStoreID) REFERENCES ONLINE_STORE(OnlineStoreID)
);


--22 Inventory

CREATE TABLE INVENTORY (
    inventoryID NUMBER PRIMARY KEY,
    expectedQuantity NUMBER,
    fcID NUMBER,
    CONSTRAINT fk_inventory_fcID FOREIGN KEY (fcID) REFERENCES FULFILLMENT_CENTER(fcID)
);

--23 Membership

CREATE TABLE MEMBERSHIP (
    membershipID NUMBER PRIMARY KEY,
    annualCost NUMBER,
    startDate DATE,
    endDate DATE,
    CustomerID NUMBER,
    CONSTRAINT fk_membership_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);


--24 Orders
CREATE TABLE ORDERS (
    orderID NUMBER PRIMARY KEY,
    orderType VARCHAR2(50),
    status VARCHAR2(50),
    quantity NUMBER,
    TotalPrice NUMBER,
    timestamp DATE,
    CustomerID NUMBER,
    CONSTRAINT fk_orders_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

--25 Online _Order

CREATE TABLE ONLINE_ORDER (
    OnlineOrderID NUMBER PRIMARY KEY,
    TrackingNo VARCHAR2(50),
    OnlineStoreID NUMBER,
    fcID NUMBER,
    CONSTRAINT fk_online_order_orderID FOREIGN KEY (OnlineOrderID) REFERENCES ORDERS(orderID),
    CONSTRAINT fk_online_order_OnlineStoreID FOREIGN KEY (OnlineStoreID) REFERENCES ONLINE_STORE(OnlineStoreID),
    CONSTRAINT fk_online_order_fcID FOREIGN KEY (fcID) REFERENCES FULFILLMENT_CENTER(fcID)
);

--26 Physical_Order
CREATE TABLE PHYSICAL_ORDER (
    PhysicalOrderID NUMBER PRIMARY KEY,
    receiptNo VARCHAR2(50),
    PhysicalStoreID NUMBER,
    CONSTRAINT fk_physical_order_orderID FOREIGN KEY (PhysicalOrderID) REFERENCES ORDERS(orderID),
    CONSTRAINT fk_physical_order_PhysicalStoreID FOREIGN KEY (PhysicalStoreID) REFERENCES PHYSICAL_STORE(PhysicalStoreID)
);

--27 Payment 
CREATE TABLE PAYMENT (
    paymentID NUMBER PRIMARY KEY,
    paymentMethod VARCHAR2(50),
    paymentDate DATE,
    amount NUMBER,
    CustomerID NUMBER,
    type VARCHAR2(50),
    orderID NUMBER,
    CONSTRAINT fk_payment_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_payment_orderID FOREIGN KEY (orderID) REFERENCES ORDERS(orderID)
);

--28 Online Payment
CREATE TABLE ONLINE_PAYMENT (
    OnlinepaymentID NUMBER PRIMARY KEY,
    CardNo VARCHAR2(16),
    paymentStatus VARCHAR2(50),
    CONSTRAINT fk_online_payment_PaymentID FOREIGN KEY (OnlinepaymentID) REFERENCES PAYMENT(paymentID),
    CONSTRAINT uc_online_payment_CardNo UNIQUE (CardNo),
    CONSTRAINT chk_online_payment_status CHECK (paymentStatus IN ('Pending', 'Completed', 'Failed'))
);


--29 Offline-Payment
CREATE TABLE OFFLINE_PAYMENT (
    OfflinepaymentID NUMBER PRIMARY KEY,
    transaction_Reference_No VARCHAR2(50),
    CONSTRAINT fk_offline_payment_PaymentID FOREIGN KEY (OfflinepaymentID) REFERENCES PAYMENT(paymentID),
    CONSTRAINT uc_offline_payment_transRefNo UNIQUE (transaction_Reference_No)
);

--30 Items

CREATE TABLE ITEMS (
    itemID NUMBER PRIMARY KEY,
    listPrice NUMBER,
    inventoryID NUMBER,
    prodID NUMBER,
    manufacturerID NUMBER,
    CONSTRAINT fk_items_inventoryID FOREIGN KEY (inventoryID) REFERENCES INVENTORY(inventoryID),
    CONSTRAINT fk_items_can_supply FOREIGN KEY (prodID, manufacturerID) REFERENCES CAN_SUPPLY(prodID, manufacturerID)
);

--31 customer_shippment_details
CREATE TABLE CUSTOMER_SHIPMENT_DETAILS (
    shipmentID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    orderID NUMBER,
    startDate DATE,
    arriveDate DATE,
    CONSTRAINT fk_customer_shipment_details_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_customer_shipment_details_orderID FOREIGN KEY (orderID) REFERENCES ORDERS(orderID),
    CONSTRAINT chk_customer_shipment_dates CHECK (startDate <= arriveDate)
);

--32 Exchange
CREATE TABLE EXCHANGE (
    ExchangeOrderID NUMBER PRIMARY KEY,
    reason VARCHAR2(255),
    CONSTRAINT fk_exchange_orderID FOREIGN KEY (ExchangeOrderID) REFERENCES ORDERS(orderID)
);

--33 Exchange Details --"reason" deleted

CREATE TABLE EXCHANGE_DETAILS (
    ExchangeOrderID NUMBER,
    itemID NUMBER,
    quantity NUMBER,
    amount NUMBER,
    PRIMARY KEY (ExchangeOrderID, itemID),
    CONSTRAINT fk_exchange_details_orderID FOREIGN KEY (ExchangeOrderID) REFERENCES EXCHANGE(ExchangeOrderID),
    CONSTRAINT fk_exchange_details_itemID FOREIGN KEY (itemID) REFERENCES ITEMS(itemID)
);

--34 Return
CREATE TABLE RETURN (
    ReturnOrderID NUMBER PRIMARY KEY,
    reason VARCHAR2(255),
    CONSTRAINT fk_return_orderID FOREIGN KEY (ReturnOrderID) REFERENCES ORDERS(orderID)
);

--35 Return_Details
--Delete "reason", we already have that in "RETURN" table

CREATE TABLE RETURN_DETAIL (
    ReturnOrderID NUMBER,
    itemID NUMBER,
    returnID NUMBER PRIMARY KEY,
    quantity NUMBER,
    amount NUMBER,
    CONSTRAINT fk_return_detail_orderID FOREIGN KEY (ReturnOrderID) REFERENCES RETURN(ReturnOrderID),
    CONSTRAINT fk_return_detail_itemID FOREIGN KEY (itemID) REFERENCES ITEMS(itemID)
);

--36 reviews
CREATE TABLE REVIEWS (
    reviewID NUMBER PRIMARY KEY,
    reviewDate DATE,  -- Renamed from 'date' to 'reviewDate'
    image BLOB,
    content VARCHAR2(1000),
    CustomerID NUMBER,
    productID NUMBER,
    CONSTRAINT fk_reviews_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_reviews_productID FOREIGN KEY (productID) REFERENCES PRODUCTS_TYPE(prodID)
);

--37 Employees --"storeID" deleted
CREATE TABLE EMPLOYEES (
    empID NUMBER PRIMARY KEY,
    fname VARCHAR2(100),
    lname VARCHAR2(100),
    employee_email VARCHAR2(100), -- Renamed email column to employee_email
    position VARCHAR2(100),
    employeeType VARCHAR2(50),
    startDate DATE,
    zipcode VARCHAR2(10),
    supervisorID NUMBER,
    CONSTRAINT uc_employees_employee_email UNIQUE (employee_email),
    CONSTRAINT fk_employees_supervisorID FOREIGN KEY (supervisorID) REFERENCES EMPLOYEES(empID),
    CONSTRAINT chk_employees_startDate CHECK (startDate >= TO_DATE('1900-01-01', 'YYYY-MM-DD')),
    CONSTRAINT fk_employees_zipcode FOREIGN KEY (zipcode) REFERENCES LOCATION(zipcode)
);

--38 FC_employees

CREATE TABLE FC_EMPLOYEE (
    fc_empId NUMBER PRIMARY KEY,
    hourlyRate NUMBER CHECK (hourlyRate > 0),
    categoryIncharge VARCHAR2(100),
    HoursPerWeek NUMBER CHECK (HoursPerWeek BETWEEN 0 AND 168),
    CONSTRAINT fk_fc_employee_empID FOREIGN KEY (fc_empId) REFERENCES EMPLOYEES(empID)
    -- Ensuring hourlyRate and HoursPerWeek are within reasonable bounds
);

--39 Retail Store Employees

CREATE TABLE RETAIL_STORE_EMPLOYEE (
    retail_empID NUMBER PRIMARY KEY,
    salesMade NUMBER CHECK (salesMade >= 0),
    CONSTRAINT fk_retail_store_employee_empID FOREIGN KEY (retail_empID) REFERENCES EMPLOYEES(empID)
    -- Ensuring salesMade is non-negative
);

--40 Corporate Employees

CREATE TABLE CORPORATE_EMPLOYEE (
    corp_empID NUMBER PRIMARY KEY,
    basesalary NUMBER CHECK (basesalary >= 0),
    rsuDetails VARCHAR2(255),
    CONSTRAINT fk_corporate_employee_empID FOREIGN KEY (corp_empID) REFERENCES EMPLOYEES(empID)
    -- Ensuring basesalary is non-negative
);

--41 Customer Support

CREATE TABLE CUSTOMER_SUPPORT (
    supportID NUMBER PRIMARY KEY,
    supportType VARCHAR2(50),
    supportDescription VARCHAR2(255),
    CustomerID NUMBER,
    corp_empID NUMBER,
    CONSTRAINT fk_customer_support_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    CONSTRAINT fk_customer_support_corp_empID FOREIGN KEY (corp_empID) REFERENCES CORPORATE_EMPLOYEE(corp_empID)
);

--42 Order-Line

CREATE TABLE ORDER_LINE (
    orderID NUMBER,
    item_id NUMBER,
    PRIMARY KEY (orderID, item_id),
    CONSTRAINT fk_order_line_orderID FOREIGN KEY (orderID) REFERENCES ORDERS(orderID),
    CONSTRAINT fk_order_line_item_id FOREIGN KEY (item_id) REFERENCES ITEMS(itemID)
);

--43 Account Mnaagement
CREATE TABLE ACCOUNT_MANAGEMENT (
    storeID NUMBER,
    smID NUMBER,
    startDate DATE,
    NumOfFollowers NUMBER CHECK (NumOfFollowers >= 0),
    PRIMARY KEY (storeID, smID),
    CONSTRAINT fk_account_management_storeID FOREIGN KEY (storeID) REFERENCES STORE(storeID),
    CONSTRAINT fk_account_management_smID FOREIGN KEY (smID) REFERENCES SOCIALMEDIA_PRESENCE(smID)
);

--44 Employee_Training

CREATE TABLE EMPLOYEE_TRAINING (
    trainingID NUMBER PRIMARY KEY,
    trainingName VARCHAR2(100),
    trainingType VARCHAR2(50),
    trainingDuration NUMBER, -- Assuming this is in hours
    CONSTRAINT uc_employee_training_name UNIQUE (trainingName),
    CONSTRAINT chk_employee_training_duration CHECK (trainingDuration > 0)
    -- Ensuring training duration is positive
);

--45 certifications 

CREATE TABLE CERTIFICATIONS (
    empID NUMBER,
    trainingID NUMBER,
    issueDate DATE,
    PRIMARY KEY (empID, trainingID),
    CONSTRAINT fk_certifications_empID FOREIGN KEY (empID) REFERENCES EMPLOYEES(empID),
    CONSTRAINT fk_certifications_trainingID FOREIGN KEY (trainingID) REFERENCES EMPLOYEE_TRAINING(trainingID)
);

--46 EMPLOYEE-PhoneNo

CREATE TABLE EMPLOYEE_PHONENO (
    empID NUMBER,
    phoneNo VARCHAR2(15),
    PRIMARY KEY (empID, phoneNo),
    CONSTRAINT fk_employee_phoneno_empID FOREIGN KEY (empID) REFERENCES EMPLOYEES(empID),
    CONSTRAINT uc_employee_phoneno UNIQUE (phoneNo)
    -- Ensuring each phone number is unique across all employees
);

--47 fc_schedule

CREATE TABLE FC_SCHEDULE (
    fcID NUMBER,
    empID NUMBER,
    scheduleID NUMBER,
    PRIMARY KEY (fcID, empID, scheduleID),
    CONSTRAINT fk_fc_schedule_fcID FOREIGN KEY (fcID) REFERENCES FULFILLMENT_CENTER(fcID),
    CONSTRAINT fk_fc_schedule_empID FOREIGN KEY (empID) REFERENCES FC_EMPLOYEE(fc_empId)
);

--48 FC_schedule_workdays;

CREATE TABLE FC_SCHEDULE_WORKDAYS (
    fcID NUMBER,
    empID NUMBER,
    scheduleID NUMBER,
    workdays VARCHAR2(100),
    PRIMARY KEY (fcID, empID, scheduleID, workdays),
    CONSTRAINT fk_fc_schedule_workdays FOREIGN KEY (fcID, empID, scheduleID) REFERENCES FC_SCHEDULE(fcID, empID, scheduleID)
);

--49 Hold table
CREATE TABLE HOLD (
    saleID NUMBER,
    storeID NUMBER,
    PRIMARY KEY (saleID, storeID),
    CONSTRAINT fk_hold_saleID FOREIGN KEY (saleID) REFERENCES CLEARANCE_SALE(saleID),
    CONSTRAINT fk_hold_storeID FOREIGN KEY (storeID) REFERENCES STORE(storeID)
   
);


-- 50 Manages

CREATE TABLE MANAGES (
    empID NUMBER,
    storeID NUMBER,
    orderID NUMBER,
    PRIMARY KEY (empID, storeID, orderID),
    CONSTRAINT fk_manages_empID FOREIGN KEY (empID) REFERENCES RETAIL_STORE_EMPLOYEE(retail_empID),
    CONSTRAINT fk_manages_storeID FOREIGN KEY (storeID) REFERENCES PHYSICAL_STORE(PhysicalStoreID),
    CONSTRAINT fk_manages_orderID FOREIGN KEY (orderID) REFERENCES ORDERS(orderID)
);

--51 Peform_audit
CREATE TABLE PERFORM_AUDIT (
    firmID NUMBER,
    storeID NUMBER,
    auditID NUMBER,
    PRIMARY KEY (firmID, storeID, auditID),
    CONSTRAINT fk_perform_audit_firmID FOREIGN KEY (firmID) REFERENCES ACCOUNTING_FIRM(firmID),
    CONSTRAINT fk_perform_audit_storeID FOREIGN KEY (storeID) REFERENCES STORE(storeID),
    CONSTRAINT fk_perform_audit_auditID FOREIGN KEY (auditID) REFERENCES AUDIT_1(auditID)
);

--52 Promo Code
CREATE TABLE PROMOCODE (
    promoID NUMBER,
    validity DATE,
    OnlinepaymentID NUMBER,
    PRIMARY KEY (promoID),
    CONSTRAINT fk_promocode_promoID FOREIGN KEY (promoID) REFERENCES PROMOTIONS(promotionID),
    CONSTRAINT fk_promocode_OnlinepaymentID FOREIGN KEY (OnlinepaymentID) REFERENCES ONLINE_PAYMENT(OnlinepaymentID)
);

--53 voucher
CREATE TABLE VOUCHERS (
    voucherID NUMBER,
    expDate DATE,
    NumOfAllowedUsage NUMBER CHECK (NumOfAllowedUsage >= 0),
    OfflinepaymentID NUMBER,
    PRIMARY KEY (voucherID),
    CONSTRAINT fk_vouchers_voucherID FOREIGN KEY (voucherID) REFERENCES PROMOTIONS(promotionID),
    CONSTRAINT fk_vouchers_OfflinepaymentID FOREIGN KEY (OfflinepaymentID) REFERENCES OFFLINE_PAYMENT(OfflinepaymentID)
);

--54 Partners
CREATE TABLE PARTNER (
    partnerID NUMBER PRIMARY KEY,
    partnerName VARCHAR2(100),
    contactName VARCHAR2(100),
    contactPhoneNum VARCHAR2(15),
    contactEmail VARCHAR2(100),
    CONSTRAINT uc_partner_contactEmail UNIQUE (contactEmail)
    -- Ensuring each partner has a unique contact email
);

--55 Release-Collection
CREATE TABLE RELEASE_COLLECTION (
    collectionID NUMBER,
    partnerID NUMBER,
    storeID NUMBER,
    PRIMARY KEY (collectionID, partnerID, storeID),
    CONSTRAINT fk_release_collection_collectionID FOREIGN KEY (collectionID) REFERENCES COLLECTION(collectionID),
    CONSTRAINT fk_release_collection_partnerID FOREIGN KEY (partnerID) REFERENCES PARTNER(partnerID),
    CONSTRAINT fk_release_collection_storeID FOREIGN KEY (storeID) REFERENCES STORE(storeID)
    -- No additional UNIQUE or CHECK constraints seem necessary here
);


--56 Supply

CREATE TABLE SUPPLY (
    itemID NUMBER,
    manufacturerID NUMBER,
    fcID NUMBER,
    PRIMARY KEY (itemID, manufacturerID, fcID),
    CONSTRAINT fk_supply_itemID FOREIGN KEY (itemID) REFERENCES ITEMS(itemID),
    CONSTRAINT fk_supply_manufacturerID FOREIGN KEY (manufacturerID) REFERENCES MANUFACTURER(manufacturerID),
    CONSTRAINT fk_supply_fcID FOREIGN KEY (fcID) REFERENCES FULFILLMENT_CENTER(fcID)
    
);
-----------------------------------------------------------------------------------------------------------------
--Add columns for queries!!!

-- REVIEWS
ALTER TABLE REVIEWS 
ADD rating NUMBER CHECK (rating BETWEEN 1 AND 5);

-- CATEGORY
ALTER TABLE CATEGORY 
ADD season VARCHAR2(10);



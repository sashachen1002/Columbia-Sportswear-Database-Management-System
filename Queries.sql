--Sales Management

--Q11: Retrieve Top Selling Brands and Their Total Sales
SELECT B.brandName, COUNT(I.itemID) AS TotalSales 
FROM BRAND B 
JOIN PRODUCTS_TYPE PT ON B.brandCode = PT.brandCode 
JOIN ITEMS I ON PT.prodID = I.prodID 
JOIN ORDER_LINE OL ON I.itemID = OL.item_id 
GROUP BY B.brandName 
ORDER BY TotalSales DESC;

--Q28: Customer Loyalty Analysis (changable: timestamp, numOfOrders)
SELECT C.CustomerID, C.name, AVG(P.amount) AS AvgPurchaseAmount, COUNT(DISTINCT O.orderID) AS NumOfOrders
FROM CUSTOMER C 
JOIN ORDERS O ON C.CustomerID = O.CustomerID 
LEFT JOIN PAYMENT P ON O.orderID = P.orderID 
WHERE O.timestamp BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-31', 'YYYY-MM-DD') --changable
GROUP BY C.CustomerID, C.name 
HAVING COUNT(DISTINCT O.orderID) > 0 --changable
ORDER BY AvgPurchaseAmount DESC;

--Q4: Find the Top 3 Customers with the Highest Total Spending 
SELECT c.CustomerID, c.name, SUM(o.TotalPrice) AS TotalSpending 
FROM CUSTOMER c 
JOIN ORDERS o ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.name 
ORDER BY TotalSpending DESC 
FETCH FIRST 3 ROWS ONLY;

--Q50: Customer Lifetime Value Calculation (CTE with Aggregate): 
WITH CustomerSpending AS ( 
  SELECT CustomerID, SUM(TotalPrice) AS LifetimeSpending 
  FROM Orders 
  GROUP BY CustomerID 
) 

SELECT c.CustomerID, c.name, cs.LifetimeSpending 
FROM Customer c 
JOIN CustomerSpending cs ON c.CustomerID = cs.CustomerID;

--Q19: Identify Popular Brands by Monthly Sales (changable: TotalOrders, TotalSales--here
SELECT B.brandName, EXTRACT(MONTH FROM O.timestamp) AS Month, 
       COUNT(DISTINCT O.orderID) AS TotalOrders, 
       SUM(I.listPrice) AS TotalSales 
FROM BRAND B 
JOIN PRODUCTS_TYPE PT ON B.brandCode = PT.brandCode 
JOIN ITEMS I ON PT.prodID = I.prodID 
JOIN ORDER_LINE OL ON I.itemID = OL.item_id 
JOIN ORDERS O ON OL.orderID = O.orderID 
GROUP BY B.brandName, EXTRACT(MONTH FROM O.timestamp) 
HAVING COUNT(DISTINCT O.orderID) > 0 AND SUM(I.listPrice) > 0 --changable
ORDER BY B.brandName, TotalSales DESC;

--Q29: Product Popularity Across Seasons (changable: NumOfOrders, season) --change: ADD "season" in "CATEGORY" table
SELECT P. prodID, P.productName, C.season,
    COUNT(DISTINCT O.orderID) AS NumOfOrders,
    SUM(O.quantity) AS TotalQuantity 
FROM PRODUCTS_TYPE P 
JOIN CATEGORY C ON P.catID = C.catID 
JOIN ITEMS I ON P.prodID = I.prodID 
JOIN ORDER_LINE OL ON I.itemID = OL.item_id 
JOIN ORDERS O ON OL.orderID = O.orderID 
WHERE C.season IN ('Spring', 'Summer') --changable
GROUP BY P.prodID, P.productName, C.season 
HAVING COUNT(DISTINCT O.orderID) > 0 --changable
ORDER BY TotalQuantity DESC;

--Q29-1: Product Popularity Across Seasons (changable: NumOfOrders, season) --change: ADD "season" in "CATEGORY" table
SELECT P. prodID, P.productName, C.season,
    COUNT(DISTINCT O.orderID) AS NumOfOrders,
    COUNT(I.itemID) AS TotalQuantity --changed
FROM PRODUCTS_TYPE P 
JOIN CATEGORY C ON P.catID = C.catID 
JOIN ITEMS I ON P.prodID = I.prodID 
JOIN ORDER_LINE OL ON I.itemID = OL.item_id 
JOIN ORDERS O ON OL.orderID = O.orderID 
WHERE C.season IN ('Spring', 'Summer') --changable
GROUP BY P.prodID, P.productName, C.season 
HAVING COUNT(DISTINCT O.orderID) > 0 --changable
ORDER BY TotalQuantity DESC;

--Q24: Product Ranking by Customer Reviews (changable: NumOfReviews) --change: ADD "rating" in "REVIEWS" table
WITH ProductReviews AS ( 
  SELECT P. prodID, AVG(R.rating) AS AvgRating 
  FROM PRODUCTS_TYPE P 
  JOIN REVIEWS R ON P. prodID = R.productID 
  GROUP BY P. prodID 
  HAVING COUNT(R.reviewID) > 0 --changable
)

SELECT P. prodID, P.productName, P.sellingPrice, PR.AvgRating, 
       RANK() OVER (ORDER BY PR.AvgRating DESC) AS ProductRank 
FROM PRODUCTS_TYPE P 
JOIN ProductReviews PR ON P. prodID = PR.prodID 
ORDER BY ProductRank;

--Q26: Order Statistics with Promotions --error
SELECT O.orderID, O.orderType, COUNT(OL.item_id) AS NumOfItems, 
       SUM(OL.quantity) AS TotalQuantity, SUM(OL.quantity * OL.listPrice) AS Revenue 
FROM ORDERS O 
JOIN ORDER_LINE OL ON O.orderID = OL.orderID 
LEFT JOIN PROMOTIONS P ON O.CustomerID = P.CustomerID 
GROUP BY O.orderID, O.orderType 
HAVING COUNT(O.item_id) > 3 AND SUM(OL.quantity) > 5 
ORDER BY Revenue DESC;

--Q26-1: Order Statistics with Promotions (changable: NumOfProductType, TotalQuantity)
SELECT O.orderType, COUNT(DISTINCT PT.prodID) AS NumOfProductType, 
       COUNT (DISTINCT I.itemID) AS TotalQuantity, SUM(I.listPrice) AS Revenue 
FROM ORDERS O 
JOIN ORDER_LINE OL ON O.orderID = OL.orderID
JOIN ITEMS I ON I.itemID = OL.item_id
JOIN PRODUCTS_TYPE PT ON PT.prodID = I.prodID
WHERE O.orderID IN (
SELECT O2.orderID
FROM PROMOCODE PR
JOIN ONLINE_PAYMENT OP ON OP.OnlinepaymentID = PR.OnlinepaymentID
JOIN PAYMENT PM ON OP.OnlinepaymentID = PM.paymentID
JOIN ORDERS O2 ON O2.orderID = PM.orderID
UNION
SELECT O2.orderID
FROM VOUCHERS V
JOIN OFFLINE_PAYMENT OFP ON OFP.OfflinepaymentID = V.OfflinepaymentID
JOIN PAYMENT PM ON OFP.OfflinepaymentID = PM.paymentID
JOIN ORDERS O2 ON O2.orderID = PM.orderID
)
GROUP BY O.orderType 
HAVING COUNT(DISTINCT PT.prodID) > 0 AND COUNT (DISTINCT I.itemID) > 0 --changable
ORDER BY Revenue DESC;

--Q23-1: Employee Sales Performance Comparison  (changable: TotalOrders)
SELECT E.empID, E.fname, E.lname,  
       COUNT(DISTINCT O.orderID) AS TotalOrders,  
       SUM(I.listPrice) AS TotalSales,  
        AVG(I.listPrice) AS AvgOrderValue,  
        RANK() OVER (ORDER BY SUM(I.listPrice) DESC) AS SalesRank  
FROM EMPLOYEES E
JOIN RETAIL_STORE_EMPLOYEE RSE ON E.empID = RSE.retail_empID
LEFT JOIN MANAGES M ON M.empID = RSE.retail_empID
LEFT JOIN ORDERS O ON M.orderID = O.orderID
LEFT JOIN PHYSICAL_ORDER PO ON PO.PhysicalOrderID = O.orderID
LEFT JOIN ORDER_LINE OL ON O.orderID = OL.orderID  
LEFT JOIN ITEMS I ON OL.item_id = I.itemID
GROUP BY E.empID, E.fname, E.lname 
HAVING COUNT(DISTINCT O.orderID) > 0 --changable  
ORDER BY SalesRank;

--Q51-1: Top 3 Reviewed Products in Each Category (Complex Joins and Subquery): (changable: Top3/5 etc.)
SELECT catID, productName, ReviewCount 
FROM ( 
  SELECT pt.catID, pt.productName, COUNT(r.reviewID) AS ReviewCount, 
         ROW_NUMBER() OVER (PARTITION BY pt.catID ORDER BY COUNT(r.reviewID) DESC) AS rn 
  FROM Products_Type pt 
  LEFT JOIN Reviews r ON pt. prodID = r.productID 
  GROUP BY pt.catID, pt.productName 
)
WHERE rn <= 3; --changable 

-- Q5-1: Find Stores with Sales Below the Average
SELECT s.storeID, ps.phoneNo,ps.zipcode, SUM(o.TotalPrice) AS TotalSales
FROM STORE S
JOIN PHYSICAL_STORE PS ON S.storeID = PS.PhysicalStoreID
LEFT JOIN PHYSICAL_ORDER PO ON PO.PhysicalStoreID = PS.PhysicalStoreID
LEFT JOIN ORDERS O ON PO.PhysicalOrderID = O.orderID
GROUP BY s.storeID, ps.phoneNo,ps.zipcode
HAVING SUM(o.TotalPrice) < (
    SELECT AVG(TotalSales)
    FROM (
        SELECT s.storeID, SUM(o.TotalPrice) AS TotalSales
        FROM STORE S
        JOIN PHYSICAL_STORE PS ON S.storeID = PS.PhysicalStoreID
        LEFT JOIN PHYSICAL_ORDER PO ON PO.PhysicalStoreID = PS.PhysicalStoreID
        LEFT JOIN ORDERS O ON PO.PhysicalOrderID = O.orderID
        GROUP BY s.storeID
    )
);
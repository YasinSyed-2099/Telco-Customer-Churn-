Create database Telco;

CREATE TABLE TelcoCustomerChurn (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen TINYINT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);

SELECT * FROM telcocustomerchurn;

-- Count Table 
SELECT Count(*) FROM telcocustomerchurn;

DESCRIBE telcocustomerchurn;


-- Q1.How many customers churned vs stayed?
SELECT Churn, COUNT(*) AS Customer_Count
FROM TelcoCustomerChurn
GROUP BY Churn;


-- Q2.How many customers churned by contract type?
SELECT Contract,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
       COUNT(*) AS Total_Customers
FROM TelcoCustomerChurn
GROUP BY Contract;


-- Q3.How many customers churned by gender?
SELECT gender, 
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
       COUNT(*) AS TotalCustomers
FROM TelcoCustomerChurn
GROUP BY gender;



-- Q4.How many customers churned by internet service?
SELECT InternetService, 
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned,
       COUNT(*) AS TotalCustomers
FROM TelcoCustomerChurn
GROUP BY InternetService;


-- Q5.What is the average monthly charge of churned vs retained customers?
SELECT Churn, ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM TelcoCustomerChurn
GROUP BY 1;
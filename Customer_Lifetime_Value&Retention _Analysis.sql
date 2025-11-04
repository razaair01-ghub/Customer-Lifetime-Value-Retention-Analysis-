
--CLV,AvgOrderValue,no. of purchases,Recency

SELECT c.CustomerKey,c.FirstName+' '+c.LastName CustomerName,SUM(s.SalesAmount) TotalSpent,AVG(s.SalesAmount) AvgOrderValue,COUNT(s.OrderQuantity) TotalOrders

	,SUM(s.SalesAmount-s.TotalProductCost) CLV_Profit,
	COUNT(DISTINCT s.SalesOrderLineNumber) Num_purchases,FORMAT(MAX(s.OrderDate),'yyyy-MM-dd') lAST_PURCHASE_DATE,
	DateDiff(day,Max(s.OrderDate),
'2014-01-28 00:00:00.000') As Recency
			
FROM dbo.FactInternetSales s
JOIN dbo.DimCustomer c
ON c.CustomerKey=s.CustomerKey
GROUP BY  c.CustomerKey,c.FirstName+' '+c.LastName
ORDER BY TotalSpent desc,Recency asc


--




/*High CLV + Low Recency → loyal, active customers

High CLV + High Recency → valuable but may be at risk (haven’t purchased recently)

Low CLV + Low Recency → new or low-value frequent buyers

Low CLV + High Recency → churned customers */




---optional--Retention,Retained Customer

/*
--Retention Rate=
Customers who purchased in previous month/
Customers who purchased in consecutive months)
	
×100  */
SELECT ct.OrderMonth,COUNT(DISTINCT ct.CustomerKey) Current_Month_Customer,
		COUNT(Distinct Next.CustomerKey) as Retained_customer


FROM (SELECT Distinct
CustomerKey,Format(OrderDate,'yyyy-MM') as OrderMonth
FROM dbo.FactInternetSales) ct
LEFT JOIN (SELECT Distinct
CustomerKey,Format(OrderDate,'yyyy-MM') as OrderMonth
FROM dbo.FactInternetSales) Next 
On ct.CustomerKey=Next.CustomerKey
AND DATEADD(MONTH,1,ct.OrderMonth+'-01')= Next.OrderMonth + '-01'


GROUP BY ct.OrderMonth
Order by Retained_customer desc

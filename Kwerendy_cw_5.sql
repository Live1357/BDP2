--a)
SELECT  a.OrderDate, count(a.OrderDate) AS Orders_cnt FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] AS a 
group by a.OrderDate
having count(a.OrderDate) <100
order by Orders_cnt DESC;

--b)
SELECT b.OrderDate, b.UnitPrice FROM 
(
SELECT  a.OrderDate, 
 ROW_NUMBER() OVER(PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS "Rows",
 UnitPrice
 FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] AS a 
) b where [Rows] <=3
 order by OrderDate;
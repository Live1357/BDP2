CREATE PROCEDURE cw_3_304192

@yearsAgo int = 8

AS
BEGIN
SELECT * FROM AdventureWorksDW2019.dbo.FactCurrencyRate AS FCR INNER JOIN AdventureWorksDW2019.dbo.DimCurrency AS DC 
ON DC.CurrencyKey=FCR.CurrencyKey WHERE DATEPART(YEAR, FCR.Date) < DATEPART(YEAR, GETDATE()) - @yearsAgo 
AND DATEPART(MONTH, GETDATE()) < DATEPART(MONTH, FCR.Date) AND  DATEPART(DAY, GETDATE()) < DATEPART(DAY, FCR.Date)
AND (DC.CurrencyAlternateKey = 'EUR' OR DC.CurrencyAlternateKey = 'GBP');
END

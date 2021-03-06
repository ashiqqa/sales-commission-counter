USE [SalePurchaseAccountantDb]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSalary]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_GetSalary]
@ProcessedMonth VARCHAR(6),
@Code VARCHAR(6)
AS BEGIN
SELECT sm.Name, d.Name As Designation,s.Code, s.ProcessedMonth, s.SalesCommission, s.OrdinalCommission, 0 AS InboundCommission, 0 AS OutboundCommission
, s.GbCommission, (s.SalesCommission+s.OrdinalCommission+s.GbCommission) as Total  FROM tblSalaries s
JOIN tblSalesman sm ON sm.Code = s.Code
JOIN tblDesignations d ON d.Id = sm.Designation
 WHERE ProcessedMonth=@ProcessedMonth AND s.Code = CASE WHEN @Code IS NULL THEN s.Code ELSE @Code END

UNION
SELECT sm.Name, (CASE WHEN m.MemberType=2 THEN 'Alpha' ELSE 'Beta' END) AS Designation,m.Code, s.ProcessedMonth, 0 AS SalesCommission, 0 AS OrdinalCommission, s.InboundCommission, s.OutboundCommission
, 0 AS GbCommission, (s.InboundCommission+s.OutboundCommission) As Total FROM tblSalaries s
JOIN tblMembers m ON m.Sidc = s.Code
JOIN tblSalesman sm ON sm.Code = s.Code
WHERE ProcessedMonth=@ProcessedMonth AND s.Code = CASE WHEN @Code IS NULL THEN s.Code ELSE @Code END
END
GO

USE [SalePurchaseAccountantDb]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateSalaryAcc]    Script Date: 10/1/2020 12:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CreateSalaryAcc] @SalaryMonth VARCHAR(6)
AS
BEGIN
DELETE tblSalaries WHERE ProcessedMonth = @SalaryMonth
INSERT INTO tblSalaries (Code, ProcessedMonth) 
SELECT Code, @SalaryMonth AS ProcessedMonth FROM tblSalesman
END
GO

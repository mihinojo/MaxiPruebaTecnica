USE MAXI_DB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Add Employee
-- =============================================
CREATE PROCEDURE [dbo].[spr_AddEmployee]
(
	@FirstName NVARCHAR(100) ,
	@LastName NVARCHAR(100) ,
	@DateOfBirth datetime,
	@EmployeeNumber int,
	@Curp NVARCHAR(18),
	@Ssn NVARCHAR(11) ,
	@PhoneNumber NVARCHAR(10) ,
	@Nationality NVARCHAR(50)
)
AS          
SET NOCOUNT ON
BEGIN
	DECLARE @Id AS INT 
	INSERT INTO Employees ([FirstName],[LastName],[DateOfBirth],[EmployeeNumber],[Curp],[Ssn],[PhoneNumber],[Nationality]) 
	VALUES(@FirstName,@LastName,@DateOfBirth,@EmployeeNumber,@Curp,@Ssn,@PhoneNumber,@Nationality)
	SELECT @Id = @@IDENTITY
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeNumber, Curp, Ssn, PhoneNumber, Nationality, IsDeleted FROM Employees WITH(NOLOCK) WHERE Id = @Id
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Add Beneficiary
-- =============================================
CREATE PROCEDURE [dbo].[spr_AddBeneficiary]
(
	@FirstName NVARCHAR(100) ,
	@LastName NVARCHAR(100) ,
	@DateOfBirth datetime,
	@EmployeeId int,
	@Curp NVARCHAR(18),
	@Ssn NVARCHAR(11) ,
	@PhoneNumber NVARCHAR(10) ,
	@Nationality NVARCHAR(50),
	@ParticipationPercentage int
)
AS          
SET NOCOUNT ON
BEGIN
	DECLARE @Id AS INT 
	INSERT INTO Beneficiaries ([FirstName],[LastName],[DateOfBirth],[EmployeeId],[Curp],[Ssn],[PhoneNumber],[Nationality],[ParticipationPercentage]) 
	VALUES(@FirstName,@LastName,@DateOfBirth,@EmployeeId,@Curp,@Ssn,@PhoneNumber,@Nationality,@ParticipationPercentage)
	SELECT @Id = @@IDENTITY
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeId, Curp, Ssn, PhoneNumber, Nationality, ParticipationPercentage, IsDeleted FROM Beneficiaries WITH(NOLOCK) WHERE Id = @Id
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Get Employees
-- =============================================
CREATE PROCEDURE [dbo].[spr_GetEmployees]
AS          
SET NOCOUNT ON
BEGIN
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeNumber, Curp, Ssn, PhoneNumber, Nationality, IsDeleted FROM Employees WITH(NOLOCK)
	WHERE IsDeleted = 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Get Beneficiaries
-- =============================================
CREATE PROCEDURE [dbo].[spr_GetBeneficiaries]
(
	@EmployeeId INT
)
AS          
SET NOCOUNT ON
BEGIN
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeId, Curp, Ssn, PhoneNumber, Nationality, ParticipationPercentage, IsDeleted FROM Beneficiaries WITH(NOLOCK) 
	WHERE EmployeeId = @EmployeeId AND IsDeleted = 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Delete Employee
-- =============================================
CREATE PROCEDURE [dbo].[spr_DeleteEmployee]
(
	@Id INT
)
AS          
SET NOCOUNT ON
BEGIN
	UPDATE Employees SET [IsDeleted] = 1 WHERE Id = @Id
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeId, Curp, Ssn, PhoneNumber, Nationality, ParticipationPercentage, IsDeleted FROM Beneficiaries WITH(NOLOCK) WHERE EmployeeId = @Id
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Delete Beneficiary
-- =============================================
CREATE PROCEDURE [dbo].[spr_DeleteBeneficiary]
(
	@Id INT
)
AS          
SET NOCOUNT ON
BEGIN
	UPDATE Beneficiaries SET [IsDeleted] = 1 WHERE Id = @Id
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeId, Curp, Ssn, PhoneNumber, Nationality, ParticipationPercentage, IsDeleted FROM Beneficiaries WITH(NOLOCK) WHERE Id = @Id
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Update Employee
-- =============================================
CREATE PROCEDURE [dbo].[spr_UpdateEmployee]
(
	@Id INT,
	@FirstName NVARCHAR(100) ,
	@LastName NVARCHAR(100) ,
	@DateOfBirth datetime,
	@EmployeeNumber int,
	@Curp NVARCHAR(18),
	@Ssn NVARCHAR(11) ,
	@PhoneNumber NVARCHAR(10) ,
	@Nationality NVARCHAR(50)
)
AS          
SET NOCOUNT ON
BEGIN
	UPDATE Employees SET FirstName = @FirstName, LastName = @LastName, DateOfBirth = @DateOfBirth, EmployeeNumber = @EmployeeNumber, Curp = @Curp, Ssn = @Ssn, PhoneNumber = @PhoneNumber, Nationality = @Nationality WHERE Id = @Id
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeNumber, Curp, Ssn, PhoneNumber, Nationality, IsDeleted FROM Employees WITH(NOLOCK) WHERE Id = @Id
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Miguel Hinojo
-- Create date: 06/06/2022
-- Description:	Update Beneficiary
-- =============================================
CREATE PROCEDURE [dbo].[spr_UpdateBeneficiary]
(
	@Id INT,
	@FirstName NVARCHAR(100) ,
	@LastName NVARCHAR(100) ,
	@DateOfBirth datetime,
	@EmployeeId int,
	@Curp NVARCHAR(18),
	@Ssn NVARCHAR(11) ,
	@PhoneNumber NVARCHAR(10) ,
	@Nationality NVARCHAR(50),
	@ParticipationPercentage int
)
AS          
SET NOCOUNT ON
BEGIN
	UPDATE Beneficiaries SET FirstName = @FirstName, LastName = @LastName, DateOfBirth = @DateOfBirth, EmployeeId = @EmployeeId, Curp = @Curp, Ssn = @Ssn, PhoneNumber = @PhoneNumber, Nationality = @Nationality, ParticipationPercentage = @ParticipationPercentage WHERE Id = @Id
	SELECT Id, FirstName, LastName, DateOfBirth, EmployeeId, Curp, Ssn, PhoneNumber, Nationality, ParticipationPercentage, IsDeleted FROM Beneficiaries WITH(NOLOCK) WHERE Id = @Id
END
GO
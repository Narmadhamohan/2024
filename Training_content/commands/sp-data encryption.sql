use sports
-- create a simple table
-- Create a Master key and certificate
-- Create a symmetric key
-- Insert an encrypted name
-- Retrieve and Decrypt the file
CREATE TABLE Users(
UserID INT PRIMARY KEY IDENTITY,
EncryptedName VARBINARY(250)
)
CREATE MASTER KEY ENCRYPTION BY PASSWORD='mydb@123'
GO
-- Create one time certificate
CREATE CERTIFICATE MySimpleCertificate WITH Subject='My Simple Encryption Certificate'

-- Create one time Symmetric key
CREATE SYMMETRIC KEY MySimpleSymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE MySimpleCertificate;
GO

-- Create a sp to insert an encrypted name

CREATE PROCEDURE InsertEncryptedName @Name NVARCHAR(100)
AS
BEGIN

	OPEN SYMMETRIC KEY MySimpleSymmetricKey
	DECRYPTION BY CERTIFICATE MySimpleCertificate;

	-- Encrypt the name to insert in users table
	DECLARE @EncryptedName VARBINARY(MAX);
	-- @Name -> Passed input name
	SET @EncryptedName = ENCRYPTBYKEY(KEY_GUID('MySimpleSymmetricKey'), @Name)

	-- INSERT THE ENCRYPTED name into the table
	INSERT INTO Users(EncryptedName)
	VALUES(@EncryptedName)

	-- Close the Symmetric key
	CLOSE SYMMETRIC KEY MySimpleSymmetricKey;

END;
GO

EXec InsertEncryptedName @Name= 'John Doe';
select * from users;
Go

CREATE PROCEDURE GetDecryptedName @UserID INT
AS
BEGIN
	-- Open the Symmetric Key
	OPEN SYMMETRIC KEY MySimpleSymmetricKey
	DECRYPTION BY CERTIFICATE MySimpleCertificate;

	-- Retrieve and decrypt the name
	DECLARE @EncryptedName VARBINARY(MAX);
	DECLARE @DecryptedName NVARCHAR(100);

	SELECT @EncryptedName = EncryptedName FROM Users where UserID = @UserID;
	SET @DecryptedName = CONVERT(nvarchar(100),Decryptbykey(@EncryptedName));

		-- Close the Symmetric key
	CLOSE SYMMETRIC KEY MySimpleSymmetricKey;

	-- Return the decrypted name
	Select @DecryptedName as Name;
END;
GO

Declare @userId int = 1;
exec GetDecryptedName @UserID = @UserID
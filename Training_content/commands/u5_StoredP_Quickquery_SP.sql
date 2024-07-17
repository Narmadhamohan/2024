Use TestData
-- Syntax
CREATE PROCEDURE u5_add(@num1 int, @num2 int)
AS 
Begin
End


-- Add Procedure
CREATE OR ALTER PROCEDURE u5_add
(@num1 int, @num2 int, @Total int output)
AS 
-- DECLARE @Total INT;
Begin

Set @Total = @num1 + @num2;

End
-- *********************** Execute section**********************
Declare @total int;
-- exec u5_add 2,3,@Total output;
EXEC u5_add @Num1 = 2, @Num2 = 3, @Total = @Total OUTPUT;
print @Total

-- ***********************Error catch ************** 
CREATe OR ALTER PROCEDURE u5_division
@Num1 INT,
@Num2 INT,
@Result INT Output
AS
BEGIN
	
	BEGIN TRY
	Set	@Result = @Num1 / @num2
	END TRY
	BEGIN CATCH
		DECLARE @ErroreEssage NVARCHAR(4000);
		DECLARE @ERRORSEverity INT;
		DECLARE @ErrorState INT;
		SELECT @ErroreEssage=ERROR_MESSAGE(),
				@ERRORSEverity = ERROR_SEVERITY(),
				@ErrorState = ERROR_STATE();

		RAISERROR('Do not divide by Zero',@ERRORSEverity,@ErrorState) 
	END CATCH
END
GO
--************************* EXEC

Declare @Result INT;
Exec u5_division 10,0, @Result output
print @Result;

-- Quick create
SELECT * INTO u5_players FROM u4_players;

-- Syntax
CREATE PROCEDURE ProcessData
AS BEGIN 
	DECLARE @Score INT;
	BEGIN TRY
		
		BEGIN TRANSACTION
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH 
	 -- Rollback the transaction in case of error
     --   IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

	END CATCH
END
-- ********************* Loop details ****************


  WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Fetch the next row
            FETCH NEXT FROM PlayerCursor INTO @ID,@City, @Score;
        END
-- ************* CURSOR details ********************


 -- Declare the cursor
        DECLARE PlayerCursor CURSOR FOR
        SELECT PlayerID, City,Score FROM u5_players;

        -- Open the cursor
        OPEN PlayerCursor;

        -- Fetch the first row
        FETCH NEXT FROM PlayerCursor INTO @ID,@City, @Score;

        -- Loop through the rows
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Example condition: Update Age if Name is 'Alice'
            IF @City = @drawcity
            BEGIN
                UPDATE u5_players
                SET Score = Score + 1
                WHERE CURRENT OF PlayerCursor;
            END

            -- Fetch the next row
            FETCH NEXT FROM PlayerCursor INTO @ID,@City, @Score;
        END

        -- Close and deallocate the cursor
        CLOSE PlayerCursor;
        DEALLOCATE PlayerCursor;

        -- Commit the transaction
        COMMIT TRANSACTION;

-- ****************PRocedure with cursor, Atomicity , Loop *******************
CREATE OR ALTER PROCEDURE ProcessData @drawCity VARCHAR(20)
AS BEGIN 
	DECLARE @ID INT,@City VARCHAR(20), @Score INT;
	BEGIN TRY
		
		BEGIN TRANSACTION
			 -- Declare the cursor
        DECLARE PlayerCursor CURSOR FOR
        SELECT PlayerID, City,Score FROM u5_players;

        -- Open the cursor
        OPEN PlayerCursor;

        -- Fetch the first row
        FETCH NEXT FROM PlayerCursor INTO @ID,@City, @Score;

        -- Loop through the rows
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Example condition: Update Age if Name is 'Alice'
            IF @City = @drawcity
            BEGIN
                UPDATE u5_players
                SET Score = Score + 1
                WHERE CURRENT OF PlayerCursor;
				
            END

            -- Fetch the next row
            FETCH NEXT FROM PlayerCursor INTO @ID,@City, @Score;
        END

        -- Close and deallocate the cursor
        CLOSE PlayerCursor;
        DEALLOCATE PlayerCursor;

        -- Commit the transaction
        COMMIT TRANSACTION;
	
	END TRY
	BEGIN CATCH 
		  IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END
		 -- Return the error information
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END

exec ProcessData 'Chennai'

 

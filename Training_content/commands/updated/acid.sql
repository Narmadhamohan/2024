-- ************Atomicity - Transaction control*****************

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    OrderDate DATE,
    Amount DECIMAL(10, 2)
);
BEGIN
BEGIN TRANSACTION;
-- Insert a record
INSERT INTO Orders (OrderDate, Amount) VALUES ('2024-07-01', 100.00);

-- Create a savepoint
SAVE TRANSACTION Savepoint2;
END
BEGIN
BEGIN TRANSACTION;

-- Insert another record
INSERT INTO Orders (OrderDate, Amount) VALUES ('2024-07-02', 200.00);

-- Create another savepoint
SAVE TRANSACTION Savepoint1;
END

-- Insert another record
INSERT INTO Orders (OrderDate, Amount) VALUES ('2024-07-03', 300.00);
-- Rollback to Savepoint1
ROLLBACK TRANSACTION Savepoint1;
ROLLBACK TRANSACTION Savepoint2;

COMMIT TRANSACTION;

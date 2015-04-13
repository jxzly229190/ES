INSERT INTO DataTest
(Name, Data)
SELECT 'Test2',BulkColumn FROM OPENROWSET(Bulk 'D:test.jpg', SINGLE_BLOB) AS BLOB
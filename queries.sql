-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
SELECT Product.ProductName, Category.CategoryName
FROM Product
JOIN Category
ON Product.CategoryId = Category.Id;
-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
SELECT [Order].Id, Shipper.CompanyName
FROM [Order]
JOIN Shipper
ON [Order].ShipVia = Shipper.Id
WHERE [Order].ShippedDate<"2012-08-09";
-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
SELECT Product.ProductName,OrderDetail.Quantity
FROM OrderDetail
JOIN Product ON Product.Id=OrderDetail.ProductId
JOIN [Order] ON [Order].Id=OrderDetail.OrderId
WHERE OrderDetail.OrderId=10251
ORDER BY Product.ProductName
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
SELECT [Order].Id as orderId,Customer.ContactName as CustomerContactName,Employee.LastName as EmployeeLastName
FROM [Order]
JOIN Customer ON Customer.Id=[Order].CustomerId
JOIN Employee ON Employee.Id=[Order].EmployeeId
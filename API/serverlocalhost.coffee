servername: "http://localhost:3000"

Create Account
Endpoint: /create-account
Method: POST
Description: Create new user account
Request Parameters:
Name(required): Name of the user
Username(required): Username of the account
Password(required): Password of the account
userId(required): Userd ID of the account

Login
Endpoint: /login
Method: POST
Description: User login
Request Parameters:
Username(required): Username of the account
Password(required): Password of the account

Get User ID
Endpoint: /getUserId
Method: GET
Description: Retrieves the user id
Response:
UserId: User account ID
Username: Name of the user

Retrieve Data
Endpoint: /pharmacydb
Method: GET
Headers: Authorization: BearerToken (required)
Request Parameters:
displayData(string, required): Specify the type of data to Retrieve
"Products": Retrieve the available Products
"Order History": Retrieve customers orders
"Customer name": Retrieve customers name

Search
Endpoint: /search
Description: search specific Products
Method: GET
Headers: Authorization: BearerToken (required)
Request Parameters:
displayData(string, required): Type of data to display
"Products": Search specific Products

Delete
Endpoint: /pharmacydb
Description: Delete records from tables
Method: DELETE
Headers: Authorization: BearerToken (required)
Request Parameters:
id(number,required): Id of the record to be deleted
tableName(string,required):Name of the table you want to delete
"Products": Delete record from Products table

Update
Endpoint: /pharmacydb
Description: Update records from tables
Method: UPDATE
Headers: Authorization: BearerToken (required)
Request Parameters:
id(number,required): Id of the record to be deleted
tableName(string,required):Name of the table you want to delete
"Products": Update record from Products table

Insert
Endpoint: /pharmacydb
Description: Add records from tables
Method: POST
Headers: Authorization: BearerToken (required)
Request Parameters:
id(number,required): Id of the record to be deleted
tableName(string,required):Name of the table you want to delete
"Products": Insert record from Products table
"Orders": Insert record from order history table
"Customers": Insert record from customers table

Request Parameters for "Products":
productId(number,required): Product Id
productName(string,required): Product name
unitPrice(number,required): Product price
unitStock(number,required): Product stock available
expireDate(string,required): Product expiration date

Request Parameters for "Orders":
orderId(number,required): Order Id
product(string,required): Order name
qty(number,required): Order quantity
price(number,required): Product price
subTotal(number,required): total orders
totalAmount(number,required): Total ordered amount
amountTendered(number,required): Amount pay
dateRecord(number,required): Order date recorded

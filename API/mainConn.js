const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const mysql = require('mysql2');
const app = express();

app.use(bodyParser.json());

// Secret key for JWT
const secretKey = 'nok';

// Create MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'pharmacydb'
});

// Connect to MySQL
connection.connect(err => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL database');
  }
});
// Transaction endpoint
app.post('/invoice', verifyToken, (req, res) => {
  //INSERT INTO `payment_transaction`(`transaction_id`, `customer_name`, `total_payment`, `cash`, `change_amount`, `transaction_date`)
  const { customerId, totalAmount, amountTendered,dateRecorded,userId} = req.body;
   // Store the user information in the database
   const invoice = {
    customerId: customerId,
    totalAmount: totalAmount,
    amountTendered: amountTendered,
    dateRecorded: dateRecorded,
    userId: userId,
    //transaction_id: transaction_id
  };
  
  // Insert the user into the database
  connection.query('INSERT INTO tblinvoice SET ?', [invoice], (err, results) => {
    if (err) {
     
      console.error('Error executing MySQL query:', err);
      return res.status(500).json({ error: 'An error occurred during registration' });
    }

      // Send a success response
      res.status(200).json({ message: 'Successful' });
    }
  );
});
// AddItemOrdered endpoint
app.post('/purchaseOrder', verifyToken, (req, res) => {
  //(`transaction_id`, `product_id`, `quantity`, `subtotal`, `date`)
  const {purchaseId,productId, quantity, unitPrice,subTotal,orderDate,userId} = req.body;
   // Store the user information in the database
   const orders = {
    
    purchaseId: purchaseId,
    productId: productId,
    quantity: quantity,
    unitPrice: unitPrice,
    subTotal: subTotal,
    orderDate: orderDate,
    userId: userId
    //transaction_id: transaction_id
  };
  
  // Insert the user into the database
  connection.query('INSERT INTO purchaseOrder SET ?', [orders], (err, results) => {
    if (err) {
     
      console.error('Error executing MySQL query:', err);
      return res.status(500).json({ error: 'An error occurred during registration' });
    }

      // Send a success response
      res.status(200).json({ message: 'Order Save Successfully' });
    }
  );
});
// AddBook endpoint
app.post('/addProducts', verifyToken, (req, res) => {
  const { productName, unitPrice ,unitStock, expireDate} = req.body;
   // Store the user information in the database
   const products = {
    productName: productName,
    unitPrice: unitPrice,
    unitStock: unitStock,
    expireDate: expireDate
  };
  // Insert the book directly into the database
  //connection.query('INSERT INTO users SET ?', user, (err, results) => {
  // Insert the user into the database
  connection.query('INSERT INTO products SET ?', [products], (err, results) => {
    if (err) {
     
      console.error('Error executing MySQL query:', err);
      return res.status(500).json({ error: 'An error occurred during registration' });
    }

      // Send a success response
      res.status(200).json({ message: 'Product Added Successful' });
    }
  );
});

// Search API endpoint
app.get('/search', (req, res) => {
  const searchText = req.query.searchText;
  const sql = "Select productName as `Products`, unitPrice as `Price`, unitStock as `Stocks`, expireDate as `Expire Date` from products WHERE productName LIKE ? ORDER BY productName ASC";

  // Acquire a connection from the pool
  //pool.getConnection((err, connection) => {

    // Execute the query
    connection.query(sql, ['%' + searchText + '%'], (err, results) => {
      // Release the connection
      //connection.release();

      if (err) {
        console.error('Error executing MySQL query:', err);
        return res.status(500).json({ error: 'Error fetching data from the database' });
      }

      // Send the results
      res.status(200).json(results);
    });
  });
   app.get('/totalSales', (req, res) => {
    const dtpText = req.query.dtpText;
    const displayData = req.query.displayData; 
    let sqlQuery;
    if (displayData === "Today") {
      sqlQuery = "select sum(subtotal) as general from tblsales";
    }
     else {
      return res.status(400).send({ error: 'Invalid displayData value' });
    }
    connection.query(sqlQuery, [dtpText],(err, result) => {
      if (err) {
        console.error('Error executing MySQL query:', err);
        res.status(500).send({ error: 'Error fetching data' });
      } else {
        const Subtotal= result[0].Subtotal;
        const Quantity= result[0].Quantity;
       // const nextID = maxID + 1;
  
        return res.status(200).send({ Subtotal, Quantity });
      }
    });
  });
// UpdateBook endpoint
app.put('/UpdateBook/:bookId', verifyToken, (req, res) => {
  const bookId = req.params.productId;
  const { productName, unitPrice ,unitStock, expireDate} = req.body;
  const products = {
    productName: productName,
    unitPrice: unitPrice,
    unitStock: unitStock,
    expireDate: expireDate
  };

  connection.query('UPDATE products SET ? WHERE productId = ?', [products, req.params.bookId], (err, results) => {
    if (err) {
      console.error('Error executing MySQL query:', err);
      return res.status(500).json({ error: 'An error occurred during book update' });
    }

    res.status(200).json({ message: 'Product Updated Successfully' });
  });
});

// Register endpoint
app.post('/signup', (req, res) => {
  const { Firstname,Lastname,ContactNo,Username,Password } = req.body;

  // Check if the username is already taken
  connection.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
    if (err) {
      console.error('Error executing MySQL query:', err);
      return res.status(500).json({ error: 'An error occurred during registration' });
    }

    if (results.length > 0) {
      return res.status(400).json({ error: 'Username is already taken' });
    }

    // Generate salt
    bcrypt.genSalt(10, (err, salt) => {
      if (err) {
        console.error('Error generating salt:', err);
        return res.status(500).json({ error: 'An error occurred during registration' });
      }

      // Hash the password with salt
      bcrypt.hash(password, salt, (err, hash) => {
        if (err) {
          console.error('Error hashing password:', err);
          return res.status(500).json({ error: 'An error occurred during registration' });
        }

        // Store the user information in the database
        const users = {
          Firstname: Firstname,
          Lastname: Lastname,
          ContactNo: ContactNo,
          Username: Username,
          Password: hash
        };

        // Insert the user into the database
        connection.query('INSERT INTO users SET ?', users, (err, results) => {
          if (err) {
            console.error('Error executing MySQL query:', err);
            return res.status(500).json({ error: 'An error occurred during registration' });
          }

          // Send a success response
          res.status(200).json({ message: 'Registration successful' });
        });
      });
    });
  });
});

// Login endpoint
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  // Find the user in the database
  connection.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
    if (err) {
      console.error('Error executing MySQL query:', err);
      return res.status(500).json({ error: 'An error occurred during login' });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: 'User not found' });
    }

    const user = results[0];

    // Compare the stored hash with the entered password
    bcrypt.compare(password, user.password, (err, result) => {
      if (err) {
        console.error('Error comparing passwords:', err);
        return res.status(500).json({ error: 'An error occurred during login' });
      }

      if (!result) {
        return res.status(401).json({ error: 'Invalid username or password' });
      }

      // Authentication successful
      // Generate a JWT token
      const token = jwt.sign({ username: username }, secretKey, { expiresIn: '1h' });

      // Send the token in the response
      res.status(200).json({ token: token });
    });
  });
});

// get transaction maxId
app.get('/maxId', (req, res) => {
  const query = "SELECT MAX(invoiceId) AS maxID FROM tblinvoice";

  // Get a connection from the pool
 
    // Execute the query
    connection.query(query, (err, result) => {
     // connection.release(); // Release the connection back to the pool

      if (err) {
        console.error('Error executing query:', err);
        return res.status(500).send({ error: 'Error executing query' });
      }

      const maxID = result[0].maxID || 0;
      const nextID = maxID + 1;

      return res.status(200).send({ maxID, nextID });
    });
  });
// Delete book endpoint
app.delete('/products/:id', verifyToken, (req, res) => {
  const productId = req.params.id;

  // Check if the user exists in the database
  const checkUserQuery = 'SELECT * FROM products WHERE productId = ?';
  connection.query(checkUserQuery, [productId], (err, results) => {
    if (err) {
      console.error('Error querying the database:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: 'Product not found' });
    }

    // User found, delete the user from the database
    const deleteUserQuery = 'DELETE FROM products WHERE productId = ?';
    connection.query(deleteUserQuery, [productId], (err, result) => {
      if (err) {
        console.error('Error deleting product from the database:', err);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      res.status(200).json({ message: 'Product deleted successfully' });
    });
  });
});
// Protected route
app.get('/protected', verifyToken, (req, res) => {
  // If the token is verified, the user is authorized to access this route
  res.status(200).json({ message: 'Access granted to protected route' });
});

// Token verification middleware
function verifyToken(req, res, next) {
  const token = req.headers['authorization'];

  if (!token) {
    return res.status(401).json({ error: 'Token not provided' });
  }

  jwt.verify(token, secretKey, (err, decoded) => {
    if (err) {
      return res.status(403).json({ error: 'Failed to authenticate token' });
    }

    // Store the decoded information in the request object
    req.user = decoded;
    next();
  });
}

// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
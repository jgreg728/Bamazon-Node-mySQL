// import dependencies
const mysql = require("mysql");
const inquirer = require("inquirer");

// connect database
const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "",
  database: "bamazon_DB"
});

connection.connect(err => {
  if (err) throw err;
  console.log(`Connected on ${connection.threadId}`);
 
  // when turned on, start app
  startBamazon();
});

const startBamazon = () => {
  // SHOW USER AVAILABLE PRODUCTS FROM DB
  connection.query("SELECT * FROM products",
    (err, items) => {
      if (err) throw err;
      console.log(items[0])
    }
  )
  searchAndBuy();
};
    
// The app should then prompt users with two messages.
const searchAndBuy = () => {
  // The first should ask them the ID of the product they would like to buy.
  connection.query("SELECT * FROM products", (err, items) => {
    if (err) throw err;

    // use inquirer.prompt to let user be able to search product
    inquirer.prompt([
      {
        name: "productWeWant",
        message: "Which item are you looking to purchase?",
        type: "list",
        choices: items.map(thing => {return thing.product_name})
      },
      // The second message should ask how many units of the product they would like to buy.
      {
        name: "amountWeWant",
        message: "Please enter how many you would like to purchase",
        type: "input",
        validate: function(whatQuantity) {
          if (!isNaN(whatQuantity)) {
            return true;
          }
          else {
            return false;
          }
        }
      }
    ])
    .then(answer => {
      console.log(answer)
      const selectedProduct = items.find(item => answer.productWeWant === item.product_name);
      console.log(selectedProduct);

      if (answer.amountWeWant <= selectedProduct.stock_quantity);

      }
    );
  })
}

// Once the customer has placed the order, your application should check if your store has enough of the product to meet the customer's request.

const updateQuantity = (itemId, quantity) => {
  connection.query("UPDATE products SET ? WHERE ?", [
    {
      stock_quantity: parseFloat(quantity),
    },
    {
      id: itemId
    }
  ], 
  // If not, the app should log a phrase like Insufficient quantity!, and then prevent the order from going through.
  (err, result) => {
    if (err) throw err;
    console.log("Sorry, there is not enough stock. Please request a quantity below what's available");
    startBamazon();
  })
}
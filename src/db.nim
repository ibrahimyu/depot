import norm / [model, sqlite]
import models

echo "Opening real database"

let dbConn* = open("db.sqlite", "", "", "")
dbConn.createTables(Product(name: "", description: "", buy_price: 0, sell_price: 0, stock: 0))

let dbStatus* = "Ok!"
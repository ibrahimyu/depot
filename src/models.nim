import norm / [pragmas, model]
import times

type
  User* = ref object of Model
    name*: string
    email*: string
    phone*: string

  Product* {.tableName: "products".} = ref object of Model
    name*: string
    description*: string
    sell_price*: float64
    buy_price*: float64
    stock*: int

  Stock* {.tableName: "stock".} = ref object of Model
    product*: Product
    qty*: int
    purchase_date*: DateTime
    expire_date*: DateTime

  StockHistory* {.tableName: "stock_history".} = ref object of Model
    product*: Product
    user*: User
    expire_date*: DateTime
    qty*: int
    description: string
    transfer_type: string


import jester, jsony, httpcore, strutils
import norm / sqlite
import src / [db, models]

routes:
  get "/products":
    var products = @[Product()]
    select dbConn, products, "$1", "1"

    resp products.toJson()

  post "/products":
    var product = request.body.fromJson(Product)
    insert dbConn, product

    resp product.toJson()

  get "/products/@id":
    let id = parseInt(@"id")

    var product = Product()
    try: select dbConn, product, "id = $1", id
    except: resp Http404, "{}"

    resp product.toJson()

  put "/products/@id":
    let id = parseInt(@"id")

    var product = Product()
    try: select dbConn, product, "id = $1", id
    except: resp Http404, "{}"

    product = request.body.fromJson(Product)
    product.id = id

    update dbConn, product

    resp product.toJson()

  delete "/products/@id":
    let id = parseInt(@"id")

    var product = Product()

    try: select dbConn, product, "id = $1", id
    except: resp Http404, "{}"

    dbConn.delete product

    resp """{"success": true}"""
// Use database
use('assignment_db')

// OP1: insertMany() — insert all documents from sample_documents.json
db.products.insertMany([
  {
    "product_id": 1,
    "name": "Smartphone",
    "category": "Electronics",
    "price": 25000,
    "brand": "Samsung",
    "specs": {
      "warranty": "1 year",
      "voltage": "220V",
      "battery": "5000mAh"
    },
    "features": ["5G", "AMOLED Display", "Fast Charging"]
  },
  {
    "product_id": 2,
    "name": "T-Shirt",
    "category": "Clothing",
    "price": 799,
    "brand": "Nike",
    "size": ["S", "M", "L", "XL"],
    "material": "Cotton",
    "color": ["Black", "White", "Blue"]
  },
  {
    "product_id": 3,
    "name": "Milk",
    "category": "Groceries",
    "price": 60,
    "brand": "Amul",
    "expiry_date": "2024-12-01",
    "nutrition": {
      "calories": "150 kcal",
      "protein": "8g",
      "fat": "5g"
    },
    "storage": "Keep refrigerated"
  },
  {
    "product_id": 4,
    "name": "Laptop",
    "category": "Electronics",
    "price": 75000,
    "brand": "Dell",
    "specs": {
      "warranty": "2 years",
      "voltage": "220V",
      "processor": "Intel i7"
    },
    "features": ["SSD", "16GB RAM", "Windows 11"]
  }
])

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
})

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
})

// OP4: updateOne() — add discount_percent field to a product
db.products.updateOne(
  { name: "Laptop" },
  { $set: { discount_percent: 10 } }
)

// OP5: createIndex() — create index on category field
db.products.createIndex({ category: 1 })

// OP5: createIndex() — create index on category field
db.products.createIndex({ category: 1 })

// Explanation:
// Indexing the 'category' field improves query performance.
// When we search products by category (e.g., Electronics, Groceries),
// MongoDB can quickly locate matching documents instead of scanning the entire collection.
// This makes filtering operations faster and more efficient.
user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_recycles = [
  {
    item: "Shirt",
    category: "Clothing",
    description: "Mens Large Sweatshirt",
    price: 10,
    city: "Oceanside",
    state: "California",
    email: "bobevans@gmail.com",
    whatsapp_user: "1234567890"
    image: "https://jiffyshirts1.imgix.net/082ad783bea4c1.png?ixlib=rb-0.3.5&auto=format&fit=fill&fill=solid&trim-color=FFFFFF&trim=color&trim-tol=8&w=307&h=480&q=80&dpr=2"
  }
]

user2_recycles = [
  {
    item: "Laptop",
    category: "Electronics",
    description: "Acer Aspire 3",
    price: 40,
    city: "Ocean Beach",
    state: "California",
    email: "bigmike@gmail.com",
    whatsapp_user: "1112223334"
    image: "https://i5.walmartimages.com/seo/Acer-Aspire-3-15-6-Full-HD-Display-12th-Gen-Intel-Core-i5-1235U-Iris-Xe-Graphics-8GB-DDR4-256GB-NVMe-SSD-Silver-Windows-11-Home-A315-59-53ER_73045354-ae51-482c-9fdc-c7132b496952.a7267eb7f5991723aeed6f0d0385a6b4.png?odnHeight=640&odnWidth=640&odnBg=FFFFFF"
  }
]
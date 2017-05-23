Category.create!([
  {name: "Sundaes"},
  {name: "Salads"},
  {name: "Grillers"},
  {name: "Drinks"}
])
Dish.create!([
  {name: "Hearts Of Palm Salad", description: "•Cubed Hearts of Palm •Avocado •Red Onions •Tomatoes •Persian Cucumbers •Mini Croutons •Baby Arugula •Iceberg Lettuce •Red Wine Vinaigrette", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Exotic Euro Salad", description: "•Grilled Peaches •Cubed Mango •Craisins •Popped Quinoa •Glazed Almond Sticks •Baby Arugula •Romaine Lettuce •Raspberry Vinaigrette", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Roasted Mushroom Salad", description: "•Portabella Mushrooms •Cremini Mushrooms •Red Onions •Fire Roasted Red Peppers •Nish Nosh Crackers •Romaine Lettuce •Balsamic Vinaigrette", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Eggplant Parmesan Salad", description: "•Sliced Roasted Eggplant •Homemade Croutons •Roasted Grape Tomatoes •Parmesan Cheese •Shredded Cheese •Romaine  •Lettuce Herbed Vinaigrette", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Middle Eastern Tilapia", description: "•Schwarma Tilapia •Sliced Tomatoes •Cucumbers •Chick Peas •Sour Pickles •Red Onions •Hot Peppers (optional)", price: "10.95", category: "Grillers", category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Italian Parmesan", description: "•Grilled Eggplant •Baby Arugula •Sliced Tomatoes •Crispy Fried Onions •Shredded Cheese •Parmesan Cheese", price: "8.95", category: "Grillers", category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Authentic Mexican", description: "•Sliced Avocado •Sliced Tomato •Fresh Peppers •Surprise Jalepeno •Red Cabbage •Pepper Jack Cheese •Baby Spinach", price: "8.95", category: "Grillers", category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Greek Island", description: "•Black Olives •Feta Cheese •Cucumbers •Roasted Button Mushrooms •Red Onions •Tomatoes •Romaine lettuce •Baby Spinach", price: "8.95", category: "Grillers", category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Kiddie Griller", description: "•Pizza Sauce and Cheese", price: "5.95", category: nil, category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Cookies 'n' Cream", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Mixed Chillers", subcategory_id: 1},
  {name: "Wild Strawberry", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Mixed Chillers", subcategory_id: 1},
  {name: "The Ultimate Chiller", description: nil, price: "7.95", category: "Drinks", category_id: 4, subcategory: "Mixed Chillers", subcategory_id: 1},
  {name: "American 3 Cheese", description: "•Mozzerella Cheese •Pepper Jack Cheese •Parmesan Cheese •Sliced Tomatoes •Fresh Sliced Mushrooms", price: "10.95", category: "Grillers", category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Asian Salmon", description: "•Five Spice Salmon •Red Cabbage •Cucumbers •Julienned Carrots •Baby Spinach •Romaine Lettuce", price: "10.95", category: nil, category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Create Your Own Razzle", description: nil, price: "7.95", category: "Drinks", category_id: 4, subcategory: "Mixed Chillers", subcategory_id: 1},
  {name: "Tuna Melt", description: "•Tuna •Tomatoes •Cucumbers •Red Pepper •Sour Pickles •Red Onions •Shredded Cheese •Hot Peppers (optional)", price: "10.95", category: nil, category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Double Chocolate", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Mixed Chillers", subcategory_id: 1},
  {name: "The Colorush", description: "•Vanilla Ice Cream •Vanilla ‘n’ Cherry Ice Cream •Whipped Cream •Fruit Loops •M&M’s•Raspberry Sauce •Cherry ", price: "6.95", category: "Sundaes", category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "The Cookie Crumble", description: "•Crumbled Oreo Cookies •Vanilla Ice Cream •Cookies ‘n’ Cream Ice Cream •Whipped Cream •Hot Fudge •Mini Oreo Cookies •Cherry", price: "7.95", category: "Sundaes", category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "Frapp In A Bowl", description: "•Tiramisu Ice Cream •Chocolate Ice Cream •Caramel Sauce •Coffee Sauce •Whipped Cream •Cappuccino Chips •Cherry", price: "9.95", category: nil, category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "Sweet Potato Salad", description: "•Roasted Sweet Potato •Roasted Butternut Squash •Julienned Fennel •Granny Smith Apples •Glazed Almond Sticks •Baby Arugula •Maple Dijon Dressing", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Sea Breeze Salad", description: "•Five Spice Salmon •Cucumbers •Julienned Carrots •Purple Cabbage •Chinese Noodles •Baby Spinach •Iceberg Lettuce •Orange Vinaigrette", price: "16.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Benihana Salad", description: "•Mandarin Oranges •Baby Corn •Fresh Tomatoes •Persian Cucumbers •Glazed Almonds •Chinese Noodles •Baby Arugala •Ginger Dressing", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Chop Style", description: "•Grilled Portabella Mushrooms •Grilled Tomatoes •Roasted Red Peppers •Crispy Fried Onions •Baby Spinach •Shredded Cheese", price: "10.95", category: nil, category_id: 3, subcategory: nil, subcategory_id: nil},
  {name: "Creamy Peanut Butter", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Mixed Chillers", subcategory_id: 1},
  {name: "Go Mango", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Fruit Smoothies", subcategory_id: 2},
  {name: "Blue Banana", description: "(made with milk)", price: "6.95", category: "Drinks", category_id: 4, subcategory: "Fruit Smoothies", subcategory_id: 2},
  {name: "Tropical Chill", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Fruit Smoothies", subcategory_id: 2},
  {name: "Strawbana", description: "(made with milk)", price: "6.95", category: "Drinks", category_id: 4, subcategory: "Fruit Smoothies", subcategory_id: 2},
  {name: "Strawberry Sub 'Lime'", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Fruit Smoothies", subcategory_id: 2},
  {name: "Just Peachy", description: nil, price: "6.95", category: "Drinks", category_id: 4, subcategory: "Fruit Smoothies", subcategory_id: 2},
  {name: "Limonana On The Rocks", description: "(Sugar Free)", price: "3.99", category: "Drinks", category_id: 4, subcategory: "Go Lite", subcategory_id: 3},
  {name: "Frozen Limonana", description: "(Sugar Free)", price: "3.99", category: "Drinks", category_id: 4, subcategory: "Go Lite", subcategory_id: 3},
  {name: "Blue Mango Smoothie", description: "(No Sugar Added)", price: "7.95", category: "Drinks", category_id: 4, subcategory: "Go Lite", subcategory_id: 3},
  {name: "Go Mango Smoothie", description: "(No Sugar Added)", price: "7.95", category: "Drinks", category_id: 4, subcategory: "Go Lite", subcategory_id: 3},
  {name: "The S'mores The Better", description: "•Graham Crackers •Vanilla Ice Cream •Chocolate Ice Cream •Hot Fudge •Marshmallow •Whipped Cream •Nut Crunch •Cherry ", price: "7.95", category: "Sundaes", category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "Bourbon Caramel", description: "•Butter Pecan Ice Cream •Vanilla Ice Cream •Chinese Pecans •Bourbon Caramel Sauce •Hot Caramel Sauce •Whipped Cream •Coffee liqueur •Cherry", price: "9.95", category: "Sundaes", category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "The Peanut Butter Cup", description: "•Chopped Peanuts •Butter Pecan Ice Cream •Tiramisu Ice Cream •Peanut Butter Sauce •Whipped Cream •Hot Fudge •Cherry", price: "7.95", category: "Sundaes", category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "Spiked Chocolate Brownies", description: "•Brownie Fudge •Chocolate Ice Cream •Caramel Fudge Ice Cream •Chocolate liqueur •Hot Fudge •Whipped Cream •Brownie Crumbs •Cherry", price: "9.95", category: nil, category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "Banana Split", description: "•1 Banana Split •Vanilla Ice Cream •Mint Chip Ice Cream •Vanilla Cherry Ice Cream •Whipped Cream •Chocolate Sauce •Caramel Sauce •Strawberry Sauce •Coconut Crunch •Cherry", price: "9.95", category: nil, category_id: 1, subcategory: nil, subcategory_id: nil},
  {name: "Citrus Salad", description: "•Sliced Orange •Sliced Grapefruit •Cubed Avocados •Candied Beets •Craisins •Romaine Lettuce •Lemon Poppy Dressing", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Create Your Own", description: "•Leafy Green Upgrades - $1.50 •Deluxe Toppings - $2.50 •Premium Toppings - $6.50", price: "10.95", category: "Salalds", category_id: 2, subcategory: nil, subcategory_id: nil},
  {name: "Italian Salad", description: "•Sliced Persian Cucumbers •Fresh Mushrooms •Grape Tomatoes •Julienned Carrots •Homemade Croutons •Iceberg Lettuce •Romaine Lettuce •Creamy Italian Dressing\r", price: "11.95", category: "Salads", category_id: 2, subcategory: nil, subcategory_id: nil}
])
Subcategory.create!([
  {name: "Mixed Chillers", category_id: 4},
  {name: "Fruit Smoothies", category_id: 4},
  {name: "Go Lite", category_id: 4}
])
User.create!([
  {name: "Dovid", email: "dovidklaver@gmail.com", password_digest: "$2a$10$qFjU3Y0xbnYyJPTYdkJNT.Ds651eEkYoDuda.1PWG08wdMElCkcGW", admin: false},
  {name: "David", email: "davidjklaver@gmail.com", password_digest: "$2a$10$Vp16rx8O2alPHr0pnhuuiOuHf6jq6JIhwQ3GAjk8xNlB69xzh2sOu", admin: true},
  {name: "dk", email: "dk@gmail.com", password_digest: "$2a$10$NWhcX2HWmOm4iIPxkt33VOdFVf0pn/Ot9b.iuq74ZxfPlRygKeP/q", admin: false},
  {name: "Dave", email: "dave@gmail.com", password_digest: "$2a$10$XlRipq6JuDKQtgRaOzp5NOlra6bsrLPVqpcJmctwSOCDd98wXsc7a", admin: false},
  {name: "chaim klaver", email: "chaimklaver@gmail.com", password_digest: "$2a$10$306GG3ZZyudiktQcoDjeauRkW5Ti0nwErLqeF/zo1JpSDagCH2GkC", admin: false},
  {name: "chayala klaver", email: "chay613@gmail.com", password_digest: "$2a$10$z49RgtKn4rqMPn4iswIEy.9MVgbzSqhAgm69tJpOzTPKxp/sRAsK6", admin: false},
  {name: "Mark", email: "mark@gmail.com", password_digest: "$2a$10$fuVXhWDZykFW1jG6X2tjT.Xsa4kYo27gLOAt383UYwTpx0wQXIxOS", admin: false},
  {name: "Malki", email: "malkilevine@gmail.com", password_digest: "$2a$10$dizVBlPenbXFAoU4zac8Bu.wNxt5hDrX1SCO0R4umy6LWcicWk2mm", admin: false}
])

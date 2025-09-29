import 'package:latihan_kuis/models/food_menu_model.dart';

List<FoodMenu> foodMenuList = [
  FoodMenu(
    name: 'Classic Cheeseburger',
    releaseDate: 'Available Daily',
    tags: ['Burger', 'Cheese', 'Beef', 'Fast Food'],
    price: '\$5.99',
    about:
        'Juicy grilled beef patty topped with melted cheddar cheese, fresh lettuce, tomato, and our signature sauce.',
    imageUrl: 'assets/images/classic-burger.jpg',
    reviewAverage: '92%',
    reviewCount: '1450',
  ),
  FoodMenu(
    name: 'Margherita Pizza',
    releaseDate: 'Available Daily',
    tags: ['Pizza', 'Cheese', 'Italian', 'Vegetarian'],
    price: '\$8.49',
    about:
        'Traditional Italian pizza topped with fresh mozzarella, basil, and tomato sauce on a crispy thin crust.',
    imageUrl: 'assets/images/magheritta-pizza.jpg',
    reviewAverage: '95%',
    reviewCount: '2123',
  ),
  FoodMenu(
    name: 'Spaghetti Carbonara',
    releaseDate: 'Available Daily',
    tags: ['Pasta', 'Italian', 'Creamy', 'Comfort Food'],
    price: '\$7.99',
    about:
        'Classic creamy pasta with parmesan cheese, crispy bacon, and a touch of garlic for rich flavor.',
    imageUrl: 'assets/images/spagetti-carbonara.jpg',
    reviewAverage: '89%',
    reviewCount: '930',
  ),
  FoodMenu(
    name: 'Chicken Caesar Salad',
    releaseDate: 'Available Daily',
    tags: ['Salad', 'Chicken', 'Healthy', 'Fresh'],
    price: '\$6.50',
    about:
        'Grilled chicken breast served over crisp romaine lettuce, parmesan cheese, croutons, and Caesar dressing.',
    imageUrl: 'assets/images/chicken-caesar.jpg',
    reviewAverage: '90%',
    reviewCount: '740',
  ),
  FoodMenu(
    name: 'Sushi Platter',
    releaseDate: 'Available Daily',
    tags: ['Sushi', 'Japanese', 'Seafood', 'Rice'],
    price: '\$12.99',
    about:
        'Assorted sushi rolls with fresh salmon, tuna, avocado, cucumber, and shrimp served with wasabi and soy sauce.',
    imageUrl: 'https://images.unsplash.com/photo-1553621042-f6e147245754',
    reviewAverage: '97%',
    reviewCount: '2680',
  ),
  FoodMenu(
    name: 'Steak & Fries',
    releaseDate: 'Available Daily',
    tags: ['Steak', 'Beef', 'Dinner', 'Grill'],
    price: '\$15.50',
    about:
        'Grilled sirloin steak cooked to perfection, served with crispy golden fries and herb butter.',
    imageUrl: 'https://images.unsplash.com/photo-1551183053-bf91a1d81141',
    reviewAverage: '94%',
    reviewCount: '1587',
  ),
];
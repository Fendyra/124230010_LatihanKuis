import 'package:flutter/material.dart';
import 'package:latihan_kuis/auth/login_page.dart';
import 'package:latihan_kuis/data/food_menu.dart';
import 'package:latihan_kuis/models/food_menu_model.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 199, 0, 0),
        centerTitle: true,
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Center(
            child: Text(
              'Hi, $username!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        title: Image.asset(
          'assets/images/logo-gravy.png',
          height: 200,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout_outlined),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/banner.png', 
                fit: BoxFit.cover, 
                width: double.infinity,
                height: 150, 
              ),
            ),
          ),
          const SizedBox(height: 16), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final FoodMenu food = foodMenuList[index];
                return _foodCard(food);
              },
              itemCount: foodMenuList.length,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _foodCard(FoodMenu food) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Builder(
                  builder: (context) {
                    bool isNetworkImage = food.imageUrl.startsWith('http');
                    if (isNetworkImage) {
                      return Image.network(
                        food.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Icon(Icons.image_not_supported_outlined));
                        },
                      );
                    } else {
                      return Image.asset(
                        food.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Icon(Icons.broken_image_outlined));
                        },
                      );
                    }
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        food.about,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        food.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
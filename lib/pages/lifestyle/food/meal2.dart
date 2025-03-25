import 'package:flutter/material.dart';

class Meal2 extends StatefulWidget {
  const Meal2({super.key});

  @override
  State<Meal2> createState() => _Meal2State();
}

class _Meal2State extends State<Meal2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:SingleChildScrollView( 
       child:Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/meal5.avif', // Replace with actual image
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNutrientInfo(Icons.local_fire_department, '450 kcal'),
                    _buildNutrientInfo(Icons.timer, '25 min'),
                  ],
                ),
                const SizedBox(height: 16),
                _buildMacroInfo('Fat', '18 g'),
                _buildMacroInfo('Protein', '40 g'),
                _buildMacroInfo('Carbs', '35 g'),
                const SizedBox(height: 16),
                const Text(
                  "GRILLED SALMON WITH QUINOA & STEAM VEGGIES",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Ingredients:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildIngredientList(),
              ],
            ),
          ),
        ],
      ),
       ),
    );
  }
   Widget _buildNutrientInfo(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.black, size: 24),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildMacroInfo(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
  Widget _buildIngredientList() {
  Map<String, List<String>> categorizedIngredients = {
    "Protein (Main Dish)": [
      "1 fillet (150g) salmon",
      "1 tbsp olive oil",
      "1 tsp lemon juice",
      "½ tsp garlic powder",
      "½ tsp black pepper",
      "¼ tsp salt",
    ],
    "Grain (Side Dish)": [
      "½ cup cooked quinoa",
      "1 cup water or low-sodium vegetable broth",
    ],
    "Steamed Vegetables (Side Dish)": [
      "½ cup broccoli florets",
      "½ cup sliced carrots",
    ],
  };

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: categorizedIngredients.entries.map((entry) {
      IconData icon;
      switch (entry.key) {
        case "Protein (Main Dish)":
          icon = Icons.food_bank;
          break;
        case "Grain (Side Dish)":
          icon = Icons.rice_bowl;
          break;
        case "Steamed Vegetables (Side Dish)":
          icon = Icons.eco;
          break;
        default:
          icon = Icons.fastfood;
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black, size: 20),
                const SizedBox(width: 8),
                Text(
                  entry.key,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ...entry.value.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      const Icon(Icons.circle, size: 6),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
    }).toList(),
  );
}
}
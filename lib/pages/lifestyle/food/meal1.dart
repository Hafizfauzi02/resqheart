import 'package:flutter/material.dart';
class Meal1 extends StatefulWidget {
  const Meal1({super.key});

  @override
  State<Meal1> createState() => _Meal1State();
}

class _Meal1State extends State<Meal1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/meal1.jpg', // Replace with actual image
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
                    _buildNutrientInfo(Icons.local_fire_department, '320 kcal'),
                    _buildNutrientInfo(Icons.timer, '10 min'),
                  ],
                ),
                const SizedBox(height: 16),
                _buildMacroInfo('Fat', '10 g'),
                _buildMacroInfo('Protein', '8 g'),
                _buildMacroInfo('Carbs', '45 g'),
                const SizedBox(height: 16),
                const Text(
                  "OATMEAL WITH BERRIES & NUTS",
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
    List<String> ingredients = [
      "½ cup rolled oats",
      "1 cup water or milk (almond/low-fat dairy)",
      "¼ cup mixed berries (blueberries, strawberries, raspberries)",
      "1 tbsp chopped almonds or walnuts",
      "1 tsp chia seeds or flaxseeds",
      "1 tsp honey or maple syrup (optional)",
      "½ tsp cinnamon (optional)",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 6),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item, style: const TextStyle(fontSize: 16))),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
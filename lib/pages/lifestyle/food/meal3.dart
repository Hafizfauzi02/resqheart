import 'package:flutter/material.dart';

class Meal3 extends StatefulWidget {
  const Meal3({super.key});

  @override
  State<Meal3> createState() => _Meal3State();
}

class _Meal3State extends State<Meal3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/meal3.jpeg', // Replace with actual image
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
                    _buildNutrientInfo(Icons.local_fire_department, '420 kcal'),
                    _buildNutrientInfo(Icons.timer, '30 min'),
                  ],
                ),
                const SizedBox(height: 16),
                _buildMacroInfo('Fat', '14 g'),
                _buildMacroInfo('Protein', '22 g'),
                _buildMacroInfo('Carbs', '55 g'),
                const SizedBox(height: 16),
                const Text(
                  "BROWN RICE WITH STIR-FRIED TOFU & VEGETABLES",
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
  Map<String, List<String>> categorizedIngredients = {
    "Base (Grain)": [
      "1 cup cooked brown rice (~215 kcal)",
      "2 cups water or vegetable broth",
    ],
    "Protein (Tofu Stir-Fry)": [
      "½ block (150g) firm tofu, cubed (~183 kcal)",
      "1 tbsp olive oil (~120 kcal)",
      "1 tbsp low-sodium soy sauce",
      "½ tsp garlic powder",
      "½ tsp ginger (grated)",
      "½ tsp black pepper",
    ],
    "Vegetables (Stir-Fried)": [
      "½ cup broccoli florets",
      "½ cup red bell pepper (sliced)",
      "½ cup carrots (julienned)",
      "½ cup snap peas",
    ],
  };

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: categorizedIngredients.entries.map((entry) {
      IconData icon;
      switch (entry.key) {
        case "Base (Grain)":
          icon = Icons.rice_bowl;
          break;
        case "Protein (Tofu Stir-Fry)":
          icon = Icons.set_meal;
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
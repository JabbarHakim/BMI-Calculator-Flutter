import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final double bmi;
  final String gender;

  const ResultPage({
    super.key,
    required this.name,
    required this.bmi,
    required this.gender,
  });

  String getCategory() {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String getDescription() {
    if (bmi < 18.5) {
      return 'Your body weight is below the normal range. '
          'Try increasing your nutritional intake '
          'and maintain a healthy eating pattern.';
      } else if (bmi < 25) {
        return 'Your body weight is ideal. '
            'Keep maintaining a healthy lifestyle '
            'and exercise regularly.';
      } else if (bmi < 30) {
        return 'Your body weight is slightly above normal. '
            'Reduce foods high in sugar and fat '
            'and increase physical activity.';
      } else {
        return 'You are in the obesity category. '
            'It is recommended to start adopting '
            'a healthy lifestyle consistently.';
      }
    }

  Color getCategoryColor() {
    if (bmi < 18.5) {
      return Colors.orange;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }

  IconData getCategoryIcon() {
    if (bmi < 18.5) {
      return Icons.sentiment_dissatisfied;
    } else if (bmi < 25) {
      return Icons.favorite;
    } else if (bmi < 30) {
      return Icons.warning_amber_rounded;
    } else {
      return Icons.health_and_safety;
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = getCategory();

    return Scaffold(
      backgroundColor: const Color(0xFF111827),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          'Result of BMI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 10),

            /// CARD RESULT BMI
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6C63FF),
                    Color(0xFF8E97FD),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Icon(
                      getCategoryIcon(),
                      color: Colors.white,
                      size: 40,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    gender,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// DETAIL CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Information of BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Icon(
                        Icons.monitor_weight_outlined,
                        color: getCategoryColor(),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          getDescription(),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// BMI RANGE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Category Body Mass Index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  BMIItem(
                    color: Colors.orange,
                    title: 'Underweight',
                    range: '< 18.5',
                  ),

                  SizedBox(height: 15),

                  BMIItem(
                    color: Colors.green,
                    title: 'Normal',
                    range: '18.5 - 24.9',
                  ),

                  SizedBox(height: 15),

                  BMIItem(
                    color: Colors.amber,
                    title: 'Overweight',
                    range: '25 - 29.9',
                  ),

                  SizedBox(height: 15),

                  BMIItem(
                    color: Colors.red,
                    title: 'Obese',
                    range: '>= 30',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  'Calculate Again',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class BMIItem extends StatelessWidget {
  final Color color;
  final String title;
  final String range;

  const BMIItem({
    super.key,
    required this.color,
    required this.title,
    required this.range,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),

        Text(
          range,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
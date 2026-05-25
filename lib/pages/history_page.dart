import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> historyList;

  const HistoryPage({
    super.key,
    required this.historyList,
  });

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Underweight':
        return Colors.orange;

      case 'Normal':
        return Colors.green;

      case 'Overweight':
        return Colors.amber;

      case 'Obese':
        return Colors.red;

      default:
        return Colors.grey;
    }
  }

  IconData getCategoryIcon(String category) {
    switch (category) {
      case 'Underweight':
        return Icons.sentiment_dissatisfied;

      case 'Normal':
        return Icons.favorite;

      case 'Overweight':
        return Icons.warning_amber_rounded;

      case 'Obese':
        return Icons.health_and_safety;

      default:
        return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'History BMI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: historyList.isEmpty
          ? const Center(
              child: Text(
                'No History of BMI',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: historyList.length,

              itemBuilder: (context, index) {
                final item = historyList[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.05),
                    ),
                  ),

                  child: Row(
                    children: [
                      /// ICON
                      Container(
                        width: 65,
                        height: 65,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: getCategoryColor(
                            item['category'],
                          ).withOpacity(0.2),
                        ),

                        child: Icon(
                          getCategoryIcon(item['category']),
                          color: getCategoryColor(
                            item['category'],
                          ),
                          size: 32,
                        ),
                      ),

                      const SizedBox(width: 20),

                      /// DETAIL
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            Text(
                              item['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              item['gender'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),

                                  decoration: BoxDecoration(
                                    color: getCategoryColor(
                                      item['category'],
                                    ).withOpacity(0.2),

                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),

                                  child: Text(
                                    item['category'],
                                    style: TextStyle(
                                      color: getCategoryColor(
                                        item['category'],
                                      ),
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const Spacer(),

                                Text(
                                  item['bmi']
                                      .toStringAsFixed(1),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
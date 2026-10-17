import 'package:buku_555_v2/component/circle_icon.dart';
import 'package:buku_555_v2/component/reusable_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double totalBalance = 500000.00; //in sen
    final Size screenSize = MediaQuery.sizeOf(context);
    final String changeText = '+12% from last month';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            const Text(
              'Buku555',
              style: TextStyle(fontSize: 25, fontWeight: .bold),
            ),
            SizedBox(height: 2),
            const Text(
              'Track today. A better tomorrow.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * 0.15,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topLeft,
                  end: .bottomRight,
                  colors: [
                    const Color.fromARGB(255, 16, 133, 121),
                    const Color.fromARGB(255, 0, 77, 69),
                  ],
                ),
                borderRadius: .circular(15),
              ),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: .w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'RM ${(totalBalance / 100).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: .w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward, color: Colors.white, size: 14),
                      SizedBox(width: 2),
                      Text(
                        changeText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: .center,
              children: [
                ReusableCard(
                  title: 'Income',
                  amount: 'RM 5000.00',
                  icon: CircleIcon(
                    icon: Icons.arrow_upward,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 3),
                ReusableCard(
                  title: 'Expenses',
                  amount: 'RM 2000.00',
                  icon: CircleIcon(
                    icon: Icons.arrow_downward,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

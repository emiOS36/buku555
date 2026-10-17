import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final String amount;
  final Widget icon;

  const ReusableCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Card(
      child: SizedBox(
        width: screenSize.width * 0.443,
        height: screenSize.height * 0.09,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              icon,
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

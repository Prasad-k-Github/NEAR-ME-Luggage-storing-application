import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YourLuggageUI extends StatelessWidget {
  final VoidCallback navigateToDropBags;

  const YourLuggageUI({super.key, required this.navigateToDropBags});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            "YOUR LUGGAGE",
            style: GoogleFonts.mulish(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF4C5372),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8D5B8C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: navigateToDropBags,
            child: const Text(
              "Find closest location",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Sample Luggage Items
          buildLuggageCard("assets/images/small_bag.png", "2024/12/16",
              "02:00 PM", "05:30 PM"),
          buildLuggageCard("assets/images/regular_bag.png", "2024/12/16",
              "02:00 PM", "05:30 PM"),
          buildLuggageCard("assets/images/odd_sized_bag.png", "2024/12/16",
              "02:00 PM", "05:30 PM"),
        ],
      ),
    );
  }

  Widget buildLuggageCard(
      String imagePath, String date, String startTime, String endTime) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 60, width: 60, fit: BoxFit.cover),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetailText("Start Date and time", "$date - $startTime"),
                  buildDetailText("End Date and time", "$date - $endTime"),
                  buildDetailText("Location", "USA"),
                ],
              ),
              const Spacer(),
            ],
          ),
          Positioned(
            bottom: -3,
            right: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8D5B8C),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                // Add your pick up logic here
              },
              child: const Text(
                "Pick up",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text.rich(
        TextSpan(
          text: "$label\n",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

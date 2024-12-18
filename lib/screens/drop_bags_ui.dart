import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropBagsUI extends StatefulWidget {
  const DropBagsUI({super.key});

  @override
  State<DropBagsUI> createState() => _DropBagsUIState();
}

class _DropBagsUIState extends State<DropBagsUI> {
  // State variables for bag counts
  int smallBagCount = 0;
  int regularBagCount = 0;
  int oddSizedBagCount = 0;

  void _incrementBagCount(String bagType) {
    setState(() {
      if (bagType == "small") smallBagCount++;
      if (bagType == "regular") regularBagCount++;
      if (bagType == "odd") oddSizedBagCount++;
    });
  }

  void _decrementBagCount(String bagType) {
    setState(() {
      if (bagType == "small" && smallBagCount > 0) smallBagCount--;
      if (bagType == "regular" && regularBagCount > 0) regularBagCount--;
      if (bagType == "odd" && oddSizedBagCount > 0) oddSizedBagCount--;
    });
  }

  Widget _buildBagRow(String imagePath, String title, String subtitle,
      int bagCount, Function() onIncrement, Function() onDecrement) {
    return Row(
      children: [
        Image.asset(imagePath, height: 50, width: 50),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.mulish(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: onIncrement,
          color: Colors.green,
        ),
        Text(
          "$bagCount",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: onDecrement,
          color: Colors.red,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            "When do you want to drop your bags?",
            style: GoogleFonts.mulish(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF5A3C62),
            ),
          ),
          const SizedBox(height: 20),

          // Date & Time Fields
          _buildInputField("Start date", Icons.calendar_today),
          _buildInputField("Start time", Icons.access_time),
          _buildInputField("End date", Icons.calendar_today),
          _buildInputField("End Time", Icons.access_time),

          const SizedBox(height: 20),

          Text(
            "Choose the number and type of bags",
            style: GoogleFonts.mulish(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 10),

          // Bag Rows
          _buildBagRow("assets/images/small_bag.png", "Small Bag",
              "Purses, tote bags", smallBagCount, () {
            _incrementBagCount("small");
          }, () {
            _decrementBagCount("small");
          }),
          const SizedBox(height: 10),
          _buildBagRow("assets/images/regular_bag.png", "Regular",
              "Suitcases, backpacks", regularBagCount, () {
            _incrementBagCount("regular");
          }, () {
            _decrementBagCount("regular");
          }),
          const SizedBox(height: 10),
          _buildBagRow("assets/images/odd_sized_bag.png", "Odd-sized",
              "Surfboards, bikes, golf bags", oddSizedBagCount, () {
            _incrementBagCount("odd");
          }, () {
            _decrementBagCount("odd");
          }),
          const SizedBox(height: 30),

          // Search Button
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A3C62),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              onPressed: () {
                // Add search logic
              },
              child: const Text(
                "Search",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Icon(icon, color: Colors.grey),
        onTap: () {
          // Add functionality to pick date or time
        },
      ),
    );
  }
}

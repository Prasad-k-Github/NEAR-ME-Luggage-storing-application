import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

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

  // State variables for date and time
  DateTime? _startDate;
  TimeOfDay? _startTime;
  DateTime? _endDate;
  TimeOfDay? _endTime;

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

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != (isStartTime ? _startTime : _endTime)) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
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
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF4C5372))),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: onIncrement,
          color: const Color(0xFF4C5372),
        ),
        Text(
          "$bagCount",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: onDecrement,
          color: const Color(0xFF4C5372),
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
          const SizedBox(height: 30),
          Center(
            child: Text(
              "DROP YOUR BAGS",
              style: GoogleFonts.mulish(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF4C5372),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Date & Time Fields
          buildInputField(
            "Start date",
            false,
            false,
            () {},
            onTap: () => _selectDate(context, true),
            suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          const SizedBox(height: 12),
          buildInputField(
            "Start time",
            false,
            false,
            () {},
            onTap: () => _selectTime(context, true),
            suffixIcon: const Icon(Icons.access_time, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          const SizedBox(height: 12),
          buildInputField(
            "End date",
            false,
            false,
            () {},
            onTap: () => _selectDate(context, false),
            suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          const SizedBox(height: 12),
          buildInputField(
            "End time",
            false,
            false,
            () {},
            onTap: () => _selectTime(context, false),
            suffixIcon: const Icon(Icons.access_time, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              "Choose the number and type of bags",
              style: GoogleFonts.mulish(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF4C5372),
              ),
            ),
          ),
          const SizedBox(height: 20),

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
              "Surfboards, golf bags", oddSizedBagCount, () {
            _incrementBagCount("odd");
          }, () {
            _decrementBagCount("odd");
          }),
          const SizedBox(height: 30),

          // Search Button
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 55,
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
          ),
        ],
      ),
    );
  }
}

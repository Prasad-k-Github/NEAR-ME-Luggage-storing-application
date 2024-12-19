import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import '../routes.dart';

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

  // Increment the count of bags based on the bag type
  void _incrementBagCount(String bagType) {
    setState(() {
      if (bagType == "small") smallBagCount++;
      if (bagType == "regular") regularBagCount++;
      if (bagType == "odd") oddSizedBagCount++;
    });
  }

  // Decrement the count of bags based on the bag type
  void _decrementBagCount(String bagType) {
    setState(() {
      if (bagType == "small" && smallBagCount > 0) smallBagCount--;
      if (bagType == "regular" && regularBagCount > 0) regularBagCount--;
      if (bagType == "odd" && oddSizedBagCount > 0) oddSizedBagCount--;
    });
  }

  // Select a date using a date picker
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

  // Select a time using a time picker
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

  // Format the selected date
  String _formatDate(DateTime? date) {
    if (date == null) return "Select date";
    return "${date.day}/${date.month}/${date.year}";
  }

  // Format the selected time
  String _formatTime(TimeOfDay? time) {
    if (time == null) return "Select time";
    return "${time.hour}:${time.minute.toString().padLeft(2, '0')}";
  }

  // Build a row for displaying bag details and count controls
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
          icon: const Icon(Icons.remove_circle_outline,
              size: 35), // Increased size
          onPressed: onDecrement,
          color: const Color(0xFF4C5372),
        ),
        Text(
          "$bagCount",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon:
              const Icon(Icons.add_circle_outline, size: 35), // Increased size
          onPressed: onIncrement,
          color: const Color(0xFF4C5372),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0), // Set background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 55),
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
              _formatDate(_startDate),
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
              _formatTime(_startTime),
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
              _formatDate(_endDate),
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
              _formatTime(_endTime),
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
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF4C5372),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Bag Rows
            _buildBagRow("assets/images/small_bag.png", "Small Bag",
                "Purses, tote bags", smallBagCount, () {
              _incrementBagCount("small");
            }, () {
              _decrementBagCount("small");
            }),
            const SizedBox(height: 20),
            _buildBagRow("assets/images/regular_bag.png", "Regular",
                "Suitcases, backpacks", regularBagCount, () {
              _incrementBagCount("regular");
            }, () {
              _decrementBagCount("regular");
            }),
            const SizedBox(height: 20),
            _buildBagRow("assets/images/odd_sized_bag.png", "Odd-sized",
                "Surfboards, golf bags", oddSizedBagCount, () {
              _incrementBagCount("odd");
            }, () {
              _decrementBagCount("odd");
            }),
            const SizedBox(height: 50),

            // Place Order Button
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.bookingScreen);
                  },
                  child: const Text(
                    "Place Order",
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
      ),
    );
  }
}

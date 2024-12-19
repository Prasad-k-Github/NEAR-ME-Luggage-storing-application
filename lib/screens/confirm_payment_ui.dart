import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes.dart';

class ConfirmPaymentUI extends StatefulWidget {
  const ConfirmPaymentUI({super.key});

  @override
  State<ConfirmPaymentUI> createState() => _ConfirmPaymentUIState();
}

class _ConfirmPaymentUIState extends State<ConfirmPaymentUI> {
  String selectedPaymentMethod = "Credit card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 55),
            Center(
              child: Text(
                "YOUR BOOKING",
                style: GoogleFonts.mulish(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF5A3C62),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Booking Summary
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D6DB),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2 Small Bags (\$4.99) x 1 day",
                    style: GoogleFonts.mulish(
                      fontSize: 16,
                      color: const Color(0xFF4C5372),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fees",
                        style: GoogleFonts.mulish(
                          fontSize: 16,
                          color: const Color(0xFF4C5372),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$5.20",
                        style: GoogleFonts.mulish(
                          fontSize: 16,
                          color: const Color(0xFF5A3C62),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20, color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.mulish(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF4C5372),
                        ),
                      ),
                      Text(
                        "\$15.18",
                        style: GoogleFonts.mulish(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF5A3C62),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Payment Method Section
            Text(
              "Pay With",
              style: GoogleFonts.mulish(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF4C5372),
              ),
            ),
            const SizedBox(height: 10),

            // Add Payment Method
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.confirmPaymentScreen);
              },
              child: Text(
                "Add payment method",
                style: GoogleFonts.mulish(
                  fontSize: 17,
                  color: const Color(0xFF4C5372),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Credit Card Option
            ListTile(
              leading: Radio<String>(
                value: "Credit card",
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
                activeColor: const Color(0xFF5A3C62),
              ),
              title: Text(
                "Credit card",
                style: GoogleFonts.mulish(
                  fontSize: 16,
                  color: const Color(0xFF5A3C62),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.credit_card, color: Color(0xFF5A3C62)),
            ),

            // PayPal Option
            ListTile(
              leading: Radio<String>(
                value: "PayPal",
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
                activeColor: const Color(0xFF5A3C62),
              ),
              title: Text(
                "PayPal",
                style: GoogleFonts.mulish(
                  fontSize: 16,
                  color: const Color(0xFF5A3C62),
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: const Icon(Icons.account_balance_wallet,
                  color: Color(0xFF5A3C62)),
            ),
            const SizedBox(height: 60),

            // Continue To Payment Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A3C62),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Navigate to payment processing or confirmation screen
                },
                child: Text(
                  "Continue To Payment",
                  style: GoogleFonts.mulish(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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

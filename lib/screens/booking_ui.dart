import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingUI extends StatelessWidget {
  const BookingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Title Section
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

              const SizedBox(height: 20),

              // Booking Details Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D6DB),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Color(0xFF4C5372)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Park Place Storage Spot",
                                style: GoogleFonts.mulish(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF4C5372),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "Open Now",
                                    style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      color: const Color(0xFF2ECC71),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Opens 24 Hours",
                                    style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      color: const Color(0xFF7C7E9D),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Booking Details
              _buildBookingDetail(
                context,
                icon: Icons.shopping_bag,
                title: "2 Bags",
                onEditPressed: () {},
              ),
              _buildBookingDetail(
                context,
                icon: Icons.watch_later_outlined,
                title: "Today, 10:00 AM  →  Dec 20, 05:00 PM",
                onEditPressed: () {},
              ),

              const SizedBox(height: 20),

              // Promo Code Section
              Text(
                "Price details",
                style: GoogleFonts.mulish(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4C5372),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE2D4E0),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Add promo code",
                    hintStyle: GoogleFonts.mulish(
                      fontSize: 14,
                      color: const Color(0xFF4C5372),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFD9D6DB),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Price Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2 Small Bags (\$4.99) x 1 day",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      color: const Color(0xFF4C5372),
                    ),
                  ),
                  Text(
                    "\$9.98",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      color: const Color(0xFF4C5372),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fees",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      color: const Color(0xFF4C5372),
                    ),
                  ),
                  Text(
                    "\$5.20",
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      color: const Color(0xFF4C5372),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: const Color(0xFF7C7E9D)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.mulish(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4C5372),
                    ),
                  ),
                  Text(
                    "\$15.18",
                    style: GoogleFonts.mulish(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4C5372),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Continue to Payment Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A3C62),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to payment
                  },
                  child: Text(
                    "Continue To Payment",
                    style: GoogleFonts.mulish(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Booking Detail Item
  Widget _buildBookingDetail(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onEditPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF4C5372)),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.mulish(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4C5372),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onEditPressed,
            child: Text(
              "Edit",
              style: GoogleFonts.mulish(
                fontSize: 14,
                color: const Color(0xFF5A3C62),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import '../routes.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  _PickLocationState createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  late GoogleMapController _mapController;
  static const LatLng _initialPosition = LatLng(0, 0);
  LatLng _currentPosition = _initialPosition;
  final TextEditingController _searchController = TextEditingController();
  String _locationName = "Retail Store";
  String _openingStatus = "Open Now";
  String _rating = "4.5";
  String _price = "From \$4.99/ 24h";
  String _closingTime = "Closes at 10:30 PM";
  String _placeDetails = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _initialPosition,
              zoom: 2.0,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: (position) async {
              setState(() {
                _currentPosition = position;
              });
              _mapController.animateCamera(
                CameraUpdate.newLatLng(position),
              );
              await _getPlaceDetails(position);
            },
            markers: {
              Marker(
                markerId: const MarkerId('selected-location'),
                position: _currentPosition,
              ),
            },
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
          ),

          // Search Bar
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search location',
                        hintStyle: GoogleFonts.mulish(
                          color: const Color(0xFF7C7E9D),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchLocation,
                  ),
                ],
              ),
            ),
          ),

          // Details Selection UI
          if (_placeDetails.isNotEmpty)
            Positioned(
              bottom: 100,
              left: 15,
              right: 15,
              child: Container(
                height: 240,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        // Image Placeholder
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Details Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _locationName,
                                style: GoogleFonts.mulish(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF4C5372),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                _placeDetails,
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  color: const Color(0xFF7C7E9D),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      size: 14, color: Colors.yellow),
                                  const SizedBox(width: 4),
                                  Text(
                                    _rating,
                                    style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      color: const Color(0xFF4C5372),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _openingStatus,
                                    style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "$_price | $_closingTime",
                                style: GoogleFonts.mulish(
                                  fontSize: 14,
                                  color: const Color(0xFF7C7E9D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Select Location Button
                    Positioned(
                      bottom: -2,
                      right: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8D5B8C),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            Routes.generateRoute(
                              const RouteSettings(name: Routes.dropBagsScreen),
                            ),
                          );
                        },
                        child: const Text(
                          "Select Location",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _searchLocation() async {
    String query = _searchController.text;
    if (query.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(query);
        if (locations.isNotEmpty) {
          Location location = locations.first;
          LatLng newPosition = LatLng(location.latitude, location.longitude);
          setState(() {
            _currentPosition = newPosition;
          });
          _mapController.animateCamera(
            CameraUpdate.newLatLng(newPosition),
          );
          await _getPlaceDetails(newPosition);
        }
      } catch (e) {
        print('Error occurred while searching location: $e');
      }
    }
  }

  Future<void> _getPlaceDetails(LatLng position) async {
    try {
      setState(() {
        _locationName = "Dynamic Location";
        _openingStatus = "Open Now";
        _rating = "4.8";
        _price = "From \$5.99/ 24h";
        _closingTime = "Closes at 9:00 PM";
        _placeDetails = "456 Example Ave, City, Country";
      });
    } catch (e) {
      print('Error occurred while getting place details: $e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  _PickLocationState createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  late GoogleMapController _mapController;
  static const LatLng _initialPosition = LatLng(0, 0); // Global view
  LatLng _currentPosition = _initialPosition;
  final TextEditingController _searchController = TextEditingController();
  String _placeDetails = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0), // Background color
      body: SafeArea(
        child: Stack(
          children: [
            // Google Map
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _initialPosition,
                zoom: 2.0, // Zoom level for a global view
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              onTap: (position) {
                setState(() {
                  _currentPosition = position;
                });
                _mapController.animateCamera(
                  CameraUpdate.newLatLng(position),
                );
                _getPlaceDetails(position);
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

            // Zoom In Button
            Positioned(
              bottom: 80,
              right: 15,
              child: FloatingActionButton(
                onPressed: () {
                  _mapController.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
                child: const Icon(Icons.zoom_in),
              ),
            ),

            // Zoom Out Button
            Positioned(
              bottom: 15,
              right: 15,
              child: FloatingActionButton(
                onPressed: () {
                  _mapController.animateCamera(
                    CameraUpdate.zoomOut(),
                  );
                },
                child: const Icon(Icons.zoom_out),
              ),
            ),

            // Place Details
            if (_placeDetails.isNotEmpty)
              Positioned(
                bottom: 80,
                left: 15,
                right: 15,
                child: Container(
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
                  child: Text(
                    _placeDetails,
                    style: GoogleFonts.mulish(
                      color: const Color(0xFF4C5372),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
          ],
        ),
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
          _getPlaceDetails(newPosition);
        }
      } catch (e) {
        // Handle error
        print('Error occurred while searching location: $e');
      }
    }
  }

  Future<void> _getPlaceDetails(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _placeDetails = "${place.name}, ${place.locality}, ${place.country}";
        });
      } else {
        setState(() {
          _placeDetails = "No details available";
        });
      }
    } catch (e) {
      // Handle error
      print('Error occurred while getting place details: $e');
    }
  }
}

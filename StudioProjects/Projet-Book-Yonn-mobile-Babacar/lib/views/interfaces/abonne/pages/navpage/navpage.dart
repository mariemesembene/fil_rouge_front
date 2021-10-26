import 'dart:ui';
import 'package:book_yonn_mobile/shared/components/preloader.dart';
import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:book_yonn_mobile/views/interfaces/abonne/pages/components/cardSearchConductor/card_search_conductor.dart';
import 'package:book_yonn_mobile/model/place.dart';



class NavPage extends StatefulWidget {
  final PlaceLocation initialLocation;
  final searchingConductor = false;

  const NavPage(
      {Key? key,
      this.initialLocation =
          const PlaceLocation(latitude: 37.422, longitude: -122.084)})
      : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  bool searchConductor = false;
  bool isVisibleSearchConductorCard = false;
  LatLng _pickedLocation = LatLng(0, 0);

  // when we click button localisation
  void _selectLocation(latitude, longitude) {
    setState(() {
      _pickedLocation = LatLng(latitude, longitude);
    });
  }

  // Get actual position Latlng
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final lat = locData.latitude;
    final long = locData.longitude;
    print(locData.latitude);
    print(locData.longitude);
    _selectLocation(lat, long);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLocation.latitude,
              widget.initialLocation.longitude),
          zoom: 16,
        ),
        markers: _pickedLocation == null
            ? {}
            : {
                Marker(markerId: MarkerId('m1'), position: _pickedLocation),
              },
      ),
      //Search conductor card
      CardSearchConductor(isVisible: isVisibleSearchConductorCard),
      // Search conductor
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 160.0, horizontal: 15.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
              heroTag: null,
              backgroundColor: colorDarkGray,
              child: Icon(
                  searchConductor == false
                      ? Icons.drive_eta_outlined
                      : Icons.close,
                  size: 30.0,
                  color: colorWhite),
              onPressed: searchConductorCliked),
        ),
      ),
      // Localization
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 15.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
              heroTag: null,
              backgroundColor: colorWhite,
              child: Icon(Icons.my_location_outlined,
                  size: 30.0, color: colorBlue),
              onPressed: _getCurrentUserLocation),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.transparent,
          child: Preloader(),
        ),
      ),
    ]);
  }

  // when search conductor button clicked
  void searchConductorCliked() {
    setState(() {
      searchConductor ? searchConductor = false : searchConductor = true;
      isVisibleSearchConductorCard
          ? isVisibleSearchConductorCard = false
          : isVisibleSearchConductorCard = true;
    });
  }
}

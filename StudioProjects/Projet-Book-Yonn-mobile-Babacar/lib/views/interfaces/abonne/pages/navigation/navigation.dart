import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/interfaces/abonne/pages/components/cardSearchConductor/card_search_conductor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool searchConductor = false;
  bool isVisibleSearchConductorCard = false;

  Future _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
    return CameraPosition(
      target: LatLng(37.773972, -122.431297),
      zoom: 11.5,
    );
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );
  late GoogleMapController _googleMapController;
  late Marker _origin;
  late Marker _destination;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var destination;
    var _origin;

    return Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: {
            if (_origin != null) _origin,
            if (destination != null) _destination
          },
          onLongPress: _addMarker,
        ),
        //Search conductor card
        CardSearchConductor(isVisible: isVisibleSearchConductorCard),
        // Search conductor
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 160.0, horizontal: 15.0),
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
      ],
    );
  }

  void _addMarker(LatLng pos) {
    var other;
    other = null;
    if (_origin == other || (_origin != other && _destination != other)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });
    }
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

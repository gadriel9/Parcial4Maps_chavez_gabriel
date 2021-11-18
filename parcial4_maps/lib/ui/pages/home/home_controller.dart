import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parcial4_maps/ui/utils/map_style.dart';
/*
import 'package:flutter/widgets.dart' show ChangeNotifier;

class HomeController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = const CameraPosition(
    target: LatLng(13.6984562, -89.3276717),
    zoom: 9,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    final marker = Marker(
        markerId: markerId,
        position: position,
        draggable: true,
        onTap: () {
          var _markersController;
          _markersController.sink.add(id);
        });
    _markers[markerId] = marker;
    notifyListeners();
  }
}*/

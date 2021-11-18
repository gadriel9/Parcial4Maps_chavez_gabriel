import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parcial4_maps/ui/pages/home/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:parcial4_maps/ui/utils/my_painter.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<MarkerId, Marker> _markers = Map();

  final _initialCameraPosition =
      CameraPosition(target: LatLng(13.6984562, -89.3276717), zoom: 11);

  _onTap(LatLng position) async {
    final markerId = MarkerId(_markers.length.toString());

    final bytes = await _myPainterToBitmap(_markers.length.toString());

    final marker = Marker(
        markerId: markerId,
        position: position,
        icon: BitmapDescriptor.fromBytes(bytes));
    setState(() {
      _markers[markerId] = marker;
    });
  }

  Future<Uint8List> _myPainterToBitmap(String label) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    MyPainter myPainter = MyPainter(label);
    myPainter.paint(canvas, Size(200, 75));

    final ui.Image image = await recorder.endRecording().toImage(200, 75);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: Set.of(_markers.values),
        onTap: _onTap,
      ),
    );
  }
}

/*
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(),
      child: Scaffold(
          appBar: AppBar(),
          body: Consumer<HomeController>(
            builder: (_, controller, __) => GoogleMap(
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: controller.initialCameraPosition,
              myLocationButtonEnabled: false,
              compassEnabled: false,
              markers: controller.markers,
              onTap: controller.onTap,
            ),
          )),
    );
  }
}*/

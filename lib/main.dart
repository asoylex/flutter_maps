import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_maps',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LatLng defaultPosition = LatLng(14.630860303632478, -90.50320571220298);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          onTap: (tapPosition, point) {
            setState(() {
              defaultPosition = point;
            });
          },
          center: LatLng(14.630860303632478, -90.50320571220298),
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: defaultPosition,
                builder: (ctx) => Container(
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            "Latitude: " +
                defaultPosition.latitude.toString() +
                "\nLongitud: " +
                defaultPosition.longitude.toString(),
            style: const TextStyle(fontSize: 20),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:proto/controllers/location_controller.dart';
import 'package:proto/widgets/round_textfeild.dart';

import '../common/color_extension.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MspScreenState();
}

class _MspScreenState extends State<MapScreen> {
  final LocationController locController = Get.put(LocationController());
  TextEditingController locTxtController = TextEditingController();

  LatLng? _userLoc;
  MapLibreMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  @override
  void dispose() {
    locTxtController.dispose();
    super.dispose();
  }

  Future<void> _loadLocation() async {
    final loc = await locController.getCurrentLocation();
    setState(() {
      _userLoc = loc;
    });
  }

  Future<void> _onStyleLoaded() async {
    if (_mapController == null || _userLoc == null) return;

    final bytes = await rootBundle.load("assets/images/map_pin.png");
    final image = bytes.buffer.asUint8List();

    await _mapController!.addImage("place-pin", image);

    await _mapController!.addSymbol(
      SymbolOptions(geometry: _userLoc!, iconImage: "place-pin", iconSize: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_userLoc == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check, size: 30, color: TColor.white),
            ),
          ],
          backgroundColor: TColor.primary,
          elevation: 3,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Image.asset(
              "assets/images/btn_back.png",
              width: 20,
              height: 20,
              color: TColor.white,
            ),
          ),

          title: Text(
            "غير العنوان",
            style: TextStyle(
              color: TColor.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
        ),
        body: MapLibreMap(
          styleString:
              'https://api.maptiler.com/maps/streets-v2/style.json?key=lXSlTosfYuTj4Acx1bb0',
          initialCameraPosition: CameraPosition(target: _userLoc!, zoom: 14),
          onMapCreated: (controller) {
            _mapController = controller;
          },
          onStyleLoadedCallback: _onStyleLoaded,
        ),
        bottomNavigationBar: BottomAppBar(
          color: TColor.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundTextField(
              hintText: "ابحث عن عنوان",
              suffixIcon: Icon(Icons.search, color: TColor.white),
              controller: locTxtController,
            ),
          ),
        ),
      ),
    );
  }
}

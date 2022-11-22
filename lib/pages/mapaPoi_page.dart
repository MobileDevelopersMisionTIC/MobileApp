import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobileapp/model/modelos_model.dart';
import 'package:mobileapp/pages/menu_page.dart';
import 'package:mobileapp/repository/utilities.dart';

class MapaPoi extends StatefulWidget {
  final DatosPoi poi;

  const MapaPoi({
    Key? key,
    required this.poi,
  }) : super(key: key);

  @override
  State<MapaPoi> createState() => _MapaPoiState(poi);
}

class _MapaPoiState extends State<MapaPoi> {
  DatosPoi poi;
  _MapaPoiState(this.poi);

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = <Marker>{};
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuPage(),
      appBar: AppBar(
        title: Text(
          widget.poi.nombre,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.poi.ubicacion.latitude,
                  widget.poi.ubicacion.longitude),
              zoom: 15,
            ),
            markers: _markers,
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              // _controller.complete(controller);
              _customInfoWindowController.googleMapController = controller;
              _showMarker();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 200,
            offset: 50,
          )
        ],
      ),
    );
  }

  void _showMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(widget.poi.nombre),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(
            widget.poi.ubicacion.latitude, widget.poi.ubicacion.longitude),
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(poi.foto),
                            fit: BoxFit.fitWidth,
                            filterQuality: FilterQuality.high),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.blue,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${poi.nombre}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${poi.ciudad.capitalize()}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ],
                ),
              ),
              LatLng(
                poi.ubicacion.latitude,
                (poi.ubicacion.longitude),
              ));
        },
      ));
    });
  }
}

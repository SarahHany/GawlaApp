import 'dart:collection';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  static MapCubit get(context) => BlocProvider.of(context);

  var markers = HashSet<Marker>();
  BitmapDescriptor? _prymides;
  BitmapDescriptor? _khan;
  BitmapDescriptor? _nile;
  BitmapDescriptor? _opra;
  BitmapDescriptor? _siwa;

  Future<void> openMap({required String lat, required String long}) async {
    String mapUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat, $long';
    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      print('ad');
    }
  }
  void addMarker() {
    markers.add(Marker(
        icon: _prymides!,
        infoWindow: InfoWindow(
          title: 'Pyramides',
          snippet: 'Giza Pyramides'
        ),
        onTap: ()async{
         await openMap(lat: "29.9773",long: "31.1325" );
        },
        markerId: MarkerId('1'),
        position: LatLng(29.9773, 31.1325)));
    markers.add(Marker(
        icon: _khan!,
        infoWindow: InfoWindow(
            title: 'Khan Elkhalili',
            snippet: 'Khan Elkhalili'
        ),
        markerId: MarkerId('2'),
        position: LatLng(29.982315, 31.142379)));
    markers.add(Marker(
        icon: _nile!,
        infoWindow: InfoWindow(
            title: 'River Nile',
            snippet: 'River Nile'
        ),
        markerId: MarkerId('3'),
        position: LatLng(29.982315, 31.152379)));
    markers.add(Marker(
        icon: _opra!,
        infoWindow: InfoWindow(
            title: 'Opera',
            snippet: 'Opera'
        ),
        markerId: MarkerId('4'),
        position: LatLng(29.962315, 31.132379)));
    markers.add(Marker(
        icon: _siwa!,
        infoWindow: InfoWindow(
            title: 'Siwa',
            snippet: 'Siwa'
        ),
        markerId: MarkerId('5'),
        position: LatLng(29.952315, 31.142379)));

    emit(AddMarkers());
  }

  getCustomMarker() async {
    final Uint8List markerIcon = await getBytesFromAsset('assets/images/py_map.png', 150);
    _prymides = await BitmapDescriptor.fromBytes(markerIcon);

    final Uint8List markerIcon1 = await getBytesFromAsset('assets/images/khan_map.png', 150);
    _khan = await BitmapDescriptor.fromBytes(markerIcon1);


    final Uint8List markerIcon2 = await getBytesFromAsset('assets/images/nile_map.png', 150);
    _nile = await BitmapDescriptor.fromBytes(markerIcon2);

    final Uint8List markerIcon3 = await getBytesFromAsset('assets/images/opra_map.png', 150);
    _opra = await BitmapDescriptor.fromBytes(markerIcon3);

    final Uint8List markerIcon4 = await getBytesFromAsset('assets/images/siwa_map.png', 150);
    _siwa = await BitmapDescriptor.fromBytes(markerIcon4);


  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}

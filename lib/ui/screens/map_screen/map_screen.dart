import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tour_app/ui/screens/map_screen/cubit/map_cubit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..getCustomMarker(),
      child: BlocConsumer<MapCubit, MapState>(
        listener: (context, state)
        {},
        builder: (context, state) {
          MapCubit cubit = MapCubit.get(context);
          return GoogleMap(
            mapType: MapType.terrain,
            markers: cubit.markers,
            onMapCreated: (controller) {
              cubit.addMarker();
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(29.9773, 31.1325),
              zoom: 13,
            ),

          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:amap_base/amap_base.dart';

class DrawClickScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrawClickScreenState();
  }
}

class _DrawClickScreenState extends State<DrawClickScreen> {
  AMapController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制点击标记'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return AMapView(
            onAMapViewCreated: (controller) {
              _controller = controller;
              _controller.onTapEvent.listen((latlng) async {
                await _controller.addMarker(MarkerOptions(position: latlng));
              });
              _controller.markerClickedEvent.listen((marker) {
                _controller.setCenter(marker.position);
              });
            },
            amapOptions: AMapOptions(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

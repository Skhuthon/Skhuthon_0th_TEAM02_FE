import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  late NaverMapController _controller;
  final List<NLatLng> _markerPositions = [
    const NLatLng(37.5665, 126.9780), // 서울
    const NLatLng(35.1796, 129.0756), // 부산
    const NLatLng(37.7519, 128.8761), // 강릉
    const NLatLng(37.4602, 126.4208), // 을왕리
    const NLatLng(37.8315, 127.5092), // 가평
  ];

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: const NaverMapViewOptions(
        initialCameraPosition: NCameraPosition(
          target: NLatLng(37.5665, 126.9780), // 서울의 위도와 경도
          zoom: 7,
        ),
      ),
      onMapReady: (controller) {
        _controller = controller;
        _addMarkers();
      },
    );
  }

  void _addMarkers() {
    List<NMarker> markers = _markerPositions.map((position) {
      String markerId = position.toString();
      return NMarker(
        id: markerId,
        position: position,
      );
    }).toList();

    for (var marker in markers) {
      _controller.addOverlay(marker);
    }

    _moveCameraToFitAllMarkers();
  }

  void _moveCameraToFitAllMarkers() {
    if (_markerPositions.isEmpty) return;

    double minLat = _markerPositions.map((e) => e.latitude).reduce((a, b) => a < b ? a : b);
    double minLng = _markerPositions.map((e) => e.longitude).reduce((a, b) => a < b ? a : b);
    double maxLat = _markerPositions.map((e) => e.latitude).reduce((a, b) => a > b ? a : b);
    double maxLng = _markerPositions.map((e) => e.longitude).reduce((a, b) => a > b ? a : b);

    NLatLngBounds bounds = NLatLngBounds(
      southWest: NLatLng(minLat, minLng),
      northEast: NLatLng(maxLat, maxLng),
    );

    _controller.updateCamera(NCameraUpdate.fitBounds(bounds, padding: const EdgeInsets.all(50.0)));
  }
}

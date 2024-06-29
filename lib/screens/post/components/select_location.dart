import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:go_router/go_router.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  NLatLng? _selectedPosition;
  NMarker? _marker;
  NaverMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            onMapTapped: (point, latLng) {
              setState(() {
                _selectedPosition = latLng;
                _addMarker(latLng);
              });
            },
            onMapReady: (controller) {
              _controller = controller;
            },
          ),
          if (_selectedPosition != null)
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  context.pop(_selectedPosition!);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50)
                ),
                child: const Text("위치 선택", style: TextStyle(color: Colors.black)),
              ),
            )
        ],
      ),
    );
  }

  void _addMarker(NLatLng position) {
    if (_marker != null) {
      _controller?.clearOverlays();
    }

    _marker = NMarker(
      id: '선택 위치',
      position: position,
    );

    _controller?.addOverlay(_marker!);
  }
}

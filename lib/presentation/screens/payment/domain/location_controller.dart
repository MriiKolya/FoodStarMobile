// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationController extends GetxController {
  @override
  void onReady() {
    loadSalesReports();
    super.onReady();
  }

  Future<void> loadSalesReports() async {
    setMarkers(locationRestraurant, 'Ресторан');
    DefaultAssetBundle.of(Get.context!)
        .loadString('assets/maptheme/darttheme.json')
        .then((value) {
      themeMap = value;
    });
  }

  void deleteMarkers() {
    markers.clear();
    setMarkers(locationRestraurant, 'Ресторан');
  }

  TextEditingController searchPlace = TextEditingController();

  final time_delivery = ''.obs;
  final distance_delivery = ''.obs;
  final show_addinformation = false.obs;
  String themeMap = '';
  Set<Marker> markers = <Marker>{};
  Set<Polygon> polygons = <Polygon>{};
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  RxList<LatLng> polygonsLatLng = <LatLng>[].obs;
  int polygonIdCounter = 1;
  int polylineIdCounter = 1;
  final Completer<GoogleMapController> googleMapsController = Completer();
  final String key = 'AIzaSyD74Uo_CCXPe3H8MeF4bUAUVSVbAICLj6g';
  final locationRestraurant = const LatLng(49.2332291, 28.4561609);
  final location = 'Оберіть Вашу локацію'.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setMarkers(LatLng point, String markerid) {
    markers.add(Marker(
        markerId: MarkerId(markerid),
        position: point,
        infoWindow: InfoWindow(title: markerid),
        icon: BitmapDescriptor.defaultMarker));
  }

  void setPolyline(List<PointLatLng> points) {
    final String PolylineIdVal = 'polyline$polylineIdCounter';
    polylineIdCounter++;

    polylines.add(Polyline(
        polylineId: PolylineId(PolylineIdVal),
        width: 3,
        color: AppColors.additionalcolor,
        points: points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList()));
    update();
  }

  void deletePolyline() {
    polylines.clear();
    update();
  }

  void addPolygon(LatLng point) {
    polygonsLatLng.add(point);
    update();
  }

  void setLocation(String newLocation) {
    location.value = newLocation;
    update();
  }

  void setPolygon() {
    final String PolygonIdVal = 'polygon_$polygonIdCounter';
    polygonIdCounter++;

    polygons.add(Polygon(
      polygonId: PolygonId(PolygonIdVal),
      points: polygonsLatLng,
      strokeWidth: 1,
      strokeColor: AppColors.additionalcolor,
    ));
  }

  Future<String?> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    if (json['candidates'] != null && json['candidates'].isNotEmpty) {
      var placeId = json['candidates'][0]['place_id'] as String;
      print('ok');
      return placeId;
    } else {
      print('No candidates found.');
      return null; // Return null if no candidates found
    }
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    if (placeId != null) {
      final String url =
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
      var response = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(response.body);
      var result = json['result'] as Map<String, dynamic>;
      print('xorosho');
      return result;
    } else {
      print('ne xorosho');
      final String url =
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
      var response = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(response.body);
      var result = json['result'] as Map<String, dynamic>;

      return result;
    }
  }

  Future<void> gotoPlace(
    double lat,
    double lng,
    Map<String, dynamic> boudns_ne,
    Map<String, dynamic> boudns_sw,
  ) async {
    final GoogleMapController controller = await googleMapsController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(boudns_sw['lat'], boudns_sw['lng']),
          northeast: LatLng(boudns_ne['lat'], boudns_ne['lng']),
        ),
        25));
  }

  Future<void> gotoFoodStar() async {
    try {
      final GoogleMapController controller = await googleMapsController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: locationRestraurant, zoom: 16)));
    } catch (e) {
      print('Error in gotoFoodStar: $e');
    }
  }

  void deliveryInformation(direction) {
    try {
      time_delivery.value = direction['time_delivery'];
      distance_delivery.value = direction['distance_delivery'];
      show_addinformation.value = true;
      update();
    } catch (e) {
      time_delivery.value = '';
      distance_delivery.value = '';
      show_addinformation.value = false;
    }
  }

  Future<Map<String, dynamic>> getDirection(String destination) async {
    try {
      const String origin = 'площа Гагаріна, 2, Вінниця';
      final String url =
          'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$key';
      var response = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(response.body);
      var results = {
        'boudns_ne': json['routes'][0]['bounds']['northeast'],
        'boudns_sw': json['routes'][0]['bounds']['southwest'],
        'start_location': json['routes'][0]['legs'][0]['start_location'],
        'end_location': json['routes'][0]['legs'][0]['end_location'],
        'region': json['routes'][0]['legs'][0]['end_address'],
        'distance_delivery': json['routes'][0]['legs'][0]['distance']['text'],
        'time_delivery': json['routes'][0]['legs'][0]['duration']['text'],
        'polyline': json['routes'][0]['overview_polyline']['points'],
        'polyline_decoded': PolylinePoints()
            .decodePolyline(json['routes'][0]['overview_polyline']['points']),
      };
      return results;
    } catch (e) {
      print('Error in getDirection: $e');
      return {};
    }
  }

  bool extractCity(String address) {
    if (address.contains('Vinnytsia Oblast')) {
      return false;
    } else if (address.contains("Vinnytsia")) {
      return true;
    } else {
      return false;
    }
  }

  void directionVerification(Map<String, dynamic> direction) async {
    try {
      if (extractCity(direction['region'])) {
        setMarkers(
            LatLng(direction['end_location']['lat'],
                direction['end_location']['lng']),
            searchPlace.text);
        List<String> startAddressParts = direction['region'].split(', ');
        searchPlace.text = startAddressParts.take(3).join(', ');
        gotoPlace(
            direction['end_location']['lat'],
            direction['end_location']['lng'],
            direction['boudns_ne'],
            direction['boudns_sw']);

        setPolyline(direction['polyline_decoded']);
        deliveryInformation(direction);
      } else {
        Get.snackbar('', "Доставка робить тіки в межах Вінниці",
            titleText: Text(
              'Помилка',
              style: TextStyle(color: Colors.red[400]),
            ),
            colorText: Colors.white,
            backgroundColor: Colors.black54);
      }
    } catch (e) {
      print('Error in directionVerification: $e');
    }
  }

  void clearAllInformation(json) {
    searchPlace.text = '';
    deletePolyline();
    deleteMarkers();
    deliveryInformation(json);
  }
}

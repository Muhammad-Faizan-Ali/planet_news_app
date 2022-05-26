import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../singleton/singletonConsts.dart';


class CurrentLocationViewModel {
  double lat  = 0;
  double long = 0;

  Future getUserLocation() async {
    // LocationPermission permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     print(('Location permissions are denied'));
    //   }
    // }

    print("Get Location");
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print(('Location permissions are denied'));
      }
    }
    print("Permissions taken");
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation,
      );
    print("Got Location");
  


    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];

    print(position.longitude);
    print(position.latitude);

    String formattedAddress = "${placemark.locality}, ${placemark.country}";

    Singleton.CityName = formattedAddress;
    print(formattedAddress);

    return formattedAddress;


  }

  // String currentCity =







}
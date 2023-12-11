import 'package:alpha_system/presentation/constants/LGA_mappings.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:geolocator/geolocator.dart';


/// Uses regex to validate emails
bool isValidEmail(String email) {
  return RegExp(
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""",)
      .hasMatch(email);
}

/// Uses regex to validate passwords. Passwords must contain a lowercase 
/// letter, a unique symbol, a number and must be upto 8 characters
/// in length
bool isValidPassword(String password) {
  return RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
      .hasMatch(password);
}

/// Returns a list of wards for an LGA
List<String> getWardsFromLGA(String lga) => lgaMapping[lga] ?? [];

/// Returns a list of LGAS From the LGA Mapping
List<String> getLGAFromLGAMapping() => List.from(lgaMapping.keys);

/// Snaps a photo using the devices camera
Future<XFile> snapPhoto()async{
  final picker = ImagePicker();
  // Pick an image.
  // // Capture a photo.
  final photo = await picker.pickImage(source: ImageSource.camera);
  return photo!;
  // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
}

/// Gets the device location
Future<String> getLocation()async{
  // bool serviceEnabled;
  // LocationPermission permission;

  // // Test if location services are enabled.
  // serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   // Location services are not enabled don't continue
  //   // accessing the position and request users of the 
  //   // App to enable the location services.
  //   return Future.error('Location services are disabled.');
  // }

  // permission = await Geolocator.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     // Permissions are denied, next time you could try
  //     // requesting permissions again (this is also where
  //     // Android's shouldShowRequestPermissionRationale 
  //     // returned true. According to Android guidelines
  //     // your App should show an explanatory UI now.
  //     return Future.error('Location permissions are denied');
  //   }
  // }
  
  // if (permission == LocationPermission.deniedForever) {
  //   // Permissions are denied forever, handle appropriately. 
  //   return Future.error(
  //     'Location permissions are permanently denied, we cannot request permissions.');
  // } 

  // // When we reach here, permissions are granted and we can
  // // continue accessing the position of the device.
  // return await Geolocator.getCurrentPosition();
  return '';
}

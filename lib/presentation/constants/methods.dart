import 'package:alpha_system/presentation/constants/LGA_mappings.dart';
import 'package:location/location.dart';
import 'package:image_picker/image_picker.dart';

/// Uses regex to validate emails
bool isValidEmail(String email) {
  return RegExp(
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
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
Future<LocationData?> getLocation()async{
  final location = Location();
  await location.enableBackgroundMode();

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  return location.getLocation();
}

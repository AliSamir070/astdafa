import 'package:permission_handler/permission_handler.dart';

class PermissionHandling{
  static Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.camera.request();
    }
    return status == PermissionStatus.granted;
  }
  static Future<bool> requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (status != PermissionStatus. granted) {
      status = await Permission.storage.request();
    }
    return status == PermissionStatus.granted;
  }
}
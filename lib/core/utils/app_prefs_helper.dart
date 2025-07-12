import 'package:sakan/core/utils/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefsHelper {
  static const keyFirstName = 'firstName';
  static const keyLastName = 'lastName';
  static const keyEmail = 'email';
  static const keyNationalId = 'nationalId';
  static const keyAddress = 'address';
  static const keyfullName = 'fullName';
  static const keyphoneNumber = 'phoneNumber';
  static const keyUniversity = 'university';
  static const keyCollege = 'college';
  static const keyIsFirstTime = 'isFirstTime';

  /// Save user info
  static Future<void> saveUserInfo({
    required String firstName,
    required String lastName,
    required String email,
    required String nationalId,
    required String address,
    required String phoneNumber,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyFirstName, firstName);
    await prefs.setString(keyLastName, lastName);
    await prefs.setString(keyEmail, email);
    await prefs.setString(keyNationalId, nationalId);
    await prefs.setString(keyAddress, address);
    await prefs.setString(keyphoneNumber, phoneNumber);
  }

  static Future<String> getInitialRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool(keyIsFirstTime) ?? true;

    if (isFirstTime) {
      await prefs.setBool(keyIsFirstTime, false);
      return AppRouter.introductionView;
    } else {
      return AppRouter.studentOrOwner;
    }
  }

  static Future<Map<String, String>> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'firstName': prefs.getString(keyFirstName) ?? '',
      'lastName': prefs.getString(keyLastName) ?? '',
      'email': prefs.getString(keyEmail) ?? '',
      'nationalId': prefs.getString(keyNationalId) ?? '',
      'address': prefs.getString(keyAddress) ?? '',
      'fullName': prefs.getString(keyfullName) ?? '',
      'phoneNumber': prefs.getString(keyphoneNumber) ?? '',
    };
  }

  /// Optional: Clear user info
  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyFirstName);
    await prefs.remove(keyLastName);
    await prefs.remove(keyEmail);
    await prefs.remove(keyNationalId);
    await prefs.remove(keyAddress);
    await prefs.remove(keyfullName);
    await prefs.remove(keyphoneNumber);
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler{

  static String handleError(Exception error) {
    String errorMessage = "Error";
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'network-request-failed':
          errorMessage = "مشكلة بالانترنت";
          break;
        case 'invalid-email':
          errorMessage = 'بريد الكتروني غير صحيح';
          break;
        case 'user-not-found':
          errorMessage = 'مستخدم غير مسجل';
          break;
        case 'wrong-password':
          errorMessage = 'كلمة مرور خاطئة';
          break;
        case 'email-already-in-use':
          errorMessage = 'بريد الكتروني مستخدم من قبل';
          break;
        case 'weak-password':
          errorMessage = 'كلمة مرور ضعيفة';
          break;
        default:
          errorMessage = 'حدث خظأ اعد المحاولة';
          break;
      }
    } else if (error is FirebaseException) {
      switch (error.code) {
        case 'permission-denied':
          errorMessage = 'ليس لديك إذن للوصول إلى هذا المورد';
          break;
        case 'not-found':
          errorMessage = 'غير متوفرة';
          break;
        case 'unavailable':
          errorMessage = 'حدث خظأ اعد المحاولة لاحقا' ;
          break;
        default:
          errorMessage = 'حدث خظأ اعد المحاولة';
          break;
      }
    } else {
      errorMessage = 'حدث خظأ اعد المحاولة';
    }
    return errorMessage;
  }

}
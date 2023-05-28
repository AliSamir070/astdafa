import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler{

  static String handleError(Exception error) {
    String errorMessage = "Error";
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Invalid email address.';
          break;
        case 'user-not-found':
          errorMessage = 'User not found.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'email-already-in-use':
          errorMessage = 'Email already in use.';
          break;
        case 'weak-password':
          errorMessage = 'Password is too weak.';
          break;
        default:
          errorMessage = 'An error occurred while processing your request. Please try again later.';
          break;
      }
    } else if (error is FirebaseException) {
      switch (error.code) {
        case 'permission-denied':
          errorMessage = 'You do not have permission to access this resource.';
          break;
        case 'not-found':
          errorMessage = 'The requested resource does not exist.';
          break;
        case 'unavailable':
          errorMessage = 'The service is currently unavailable. Please try again later.';
          break;
        default:
          errorMessage = 'An error occurred while processing your request. Please try again later.';
          break;
      }
    } else {
      errorMessage = 'An error occurred while processing your request. Please try again later.';
    }
    return errorMessage;
  }

}
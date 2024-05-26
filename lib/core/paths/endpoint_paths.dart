import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndpointPath {
  static String get addi => dotenv.env['epAddi']!;
  static String get bank => dotenv.env['epBank']!;
  static String get cancellation => dotenv.env['epCancellation']!;
  static String get category => dotenv.env['epCategories']!;
  static String get clients => dotenv.env['epClients']!;
  static String get coins => dotenv.env['epCoins']!;
  static String get educationCourse => dotenv.env['epEducationCourse']!;
  static String get educationLecture => dotenv.env['epEducationLecture']!;
  static String get findBrands => dotenv.env['epFindBrands']!;
  static String get findProductTypes => dotenv.env['epFindProductTypes']!;
  static String get googlePlacesAutocomplete =>
      dotenv.env['epGooglePlacesAutocomplete']!;
  static String get googlePlacesDetails => dotenv.env['epGooglePlacesDetails']!;
  static String get home => dotenv.env['epHome']!;
  static String get ipLocation => dotenv.env['epIpLocation']!;
  static String get locations => dotenv.env['epLocations']!;
  static String get metadata => dotenv.env['epMetadata']!;
  static String get address => dotenv.env['epProfile']!;
  static String get otp => dotenv.env['epOtp']!;
  static String get usersOtp => dotenv.env['epUsersOtp']!;
  static String get products => dotenv.env['epProducts']!;
  static String get profile => dotenv.env['epProfile']!;
  static String get purchase => dotenv.env['epPurchase']!;
  static String get search => dotenv.env['epSearch']!;
  static String get siigo => dotenv.env['epSiigo']!;
  static String get suggestions => dotenv.env['epSuggestions']!;
  static String get supportTickets => dotenv.env['epSupportTickets']!;
  static String get surveys => dotenv.env['epSurvey']!;
  static String get preferences => dotenv.env['epPreferences']!;
  static String get uploadFile => dotenv.env['epUploadFile']!;
  static String get verifiedUrlFile => dotenv.env['epVerfiedFile']!;
  static String get verifiedAvailability => dotenv.env['epKaltoAvailability']!;
  static String get brand => dotenv.env['eBrands']!;
  static String get supplier => dotenv.env['eSuppliers']!;
  static String get banners => dotenv.env['epBanners']!;
  static String get users => dotenv.env['epUsers']!;
  static String get validateAvailability =>
      dotenv.env['epValidateAvailability']!;
  static String get validatedRues => dotenv.env['epValidatedRues']!;
  static String get paymentMethods => dotenv.env['epPaymentMethods']!;
  static String get credit => dotenv.env['epCredit']!;
  static String get paymentLink => dotenv.env['epPaymentLink']!;
  static String get notifyAvailabeProduct =>
      dotenv.env['epNotifyAvailableProduct']!;
  static String get commercial => dotenv.env['epSuppliers']!;
  static String get sellers => dotenv.env['epSellers']!;
}

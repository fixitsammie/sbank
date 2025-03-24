class AppUrl {
  static const String liveBaseURL = "";
  static const String localBaseURL = "http://localhost:8000/api";

  static const String baseURL = localBaseURL;
  static const String login = "$baseURL/auth/jwt/create/";
  static const String profile = "$baseURL/auth/users/me/";
  static const String register = "$baseURL/auth/users/";
  static const String forgotPassword = "$baseURL/forgot-password";
  static const String search = "$baseURL/search/";
}

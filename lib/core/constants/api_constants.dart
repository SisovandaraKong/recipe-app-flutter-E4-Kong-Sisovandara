/// API configuration and endpoint constants
class ApiConstants {
  // Base URL for the Recipe API
  static const String baseUrl = 'https://meal-db-sandy.vercel.app';
  
  // API Headers
  static const String apiHeaderKey = 'X-DB-NAME';
  static const String apiHeaderValue = 'bede2423-b185-442a-b987-5da410608240';
  
  // Endpoints
  static const String mealsEndpoint = '/meals';
  static const String categoriesEndpoint = '/categories';
  
  // Timeout
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}

/// Application-wide constants
class AppConstants {
  // App Information
  static const String appName = 'Recipe Finder';
  static const String appVersion = '1.0.0';
  
  // Database
  static const String databaseName = 'recipe_finder.db';
  static const int databaseVersion = 1;
  
  // Onboarding
  static const String onboardingCompleteKey = 'onboarding_complete';
  
  // Cache
  static const Duration cacheValidDuration = Duration(hours: 1);
}

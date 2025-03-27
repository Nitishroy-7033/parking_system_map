# Flutter Wrapper
-keep class io.flutter.** { *; }

# Keep everything in the main package
-keep class com.example.parking_system_map.** { *; }

# Keep entry points
-keep public class * extends android.app.Application
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# Preserve Flutter plugin classes
-keep class io.flutter.plugins.** { *; }

# Avoid stripping Glide, Retrofit, or Gson (if used)
-dontwarn com.bumptech.glide.**
-dontwarn retrofit2.**
-dontwarn com.google.gson.**

# R8 Optimizations
-keepattributes *Annotation*
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Ignore warnings
-dontwarn **


-keepattributes *Annotation*
-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}
-optimizations !method/inlining/
-keepclasseswithmembers class * {
  public void onPayment*(...);
}
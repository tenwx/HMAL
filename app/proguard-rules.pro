# Xposed
-keepclassmembers class x.y.z.MyApp {
    boolean isHooked;
}

# Enum class
-keepclassmembers,allowoptimization enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep,allowoptimization class * extends androidx.preference.PreferenceFragmentCompat
-keepclassmembers class d.e.f.databinding.**  {
    public <methods>;
}

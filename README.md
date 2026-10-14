# Experiment 10 – Add Android as a Build Target

## Aim
To configure and build a Flutter application for Android.

---

## Experiment Details

- **Course / Lab:** Mobile Application Development (Flutter)
- **Experiment Number:** 10
- **Target Platform:** Android (arm64, arm, x86_64)
- **Build Output Target:** Android Package Kit (`APK`)

---

## Step-by-Step Execution Workflow

### Step 1 – Check Flutter Environment
Verify Flutter SDK installation, connected devices, and toolchain components:
```bash
flutter doctor
```
**Verification Status:**
- Flutter Channel: `stable`, version `3.47.2`
- OS: Microsoft Windows 11
- Network resources: Connected

---

### Step 2 – Check Android Devices
List all available target devices and emulators:
```bash
flutter devices
```
*Lists connected physical Android devices, running emulators, and desktop/web fallback targets.*

---

### Step 3 – Check Android Toolchain & Licenses
Ensure Android SDK command-line tools and licenses are accepted:
```bash
flutter doctor --android-licenses
```
- Downloaded and configured Android SDK Command-line Tools (`cmdline-tools/latest`) with `sdkmanager` and `avdmanager`.
- Accepted all 7 Android SDK package licenses (`android-sdk-license`).
- Configured JDK 17 (OpenJDK Temurin-17) as the primary toolchain compiler.
- Confirmed with `[√] Android toolchain - develop for Android devices (Android SDK version 36.0.0)`.

---

### Step 4 – Create Application
Generate a fresh Flutter project configured with the Android platform:
```bash
flutter create android_app
cd android_app
```

---

### Step 5 – Run on Android
Launch the application on a connected Android device or running emulator:
```bash
flutter run
```

---

### Step 6 – Check Android Build
Compile and bundle the Flutter application into a standalone Android APK:
```bash
flutter build apk
```
This triggers the Gradle build lifecycle:
1. Resolves Android Gradle Plugin and Kotlin dependencies.
2. Compiles Dart source into native ARM/x86 shared libraries via AOT compiler.
3. Generates DEX bytecode, packages Android resources, and signs the APK.

---

### Step 7 – Locate APK
The generated release APK is located at:
```
build/app/outputs/flutter-apk/app-release.apk
```
Or for debug builds:
```
build/app/outputs/flutter-apk/app-debug.apk
```

---

### Step 8 – Test APK
Install and verify the APK on an Android device or emulator:
```bash
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

---

## Expected Result
The Flutter application is successfully configured, built, and executed as an Android application with a verified APK package.

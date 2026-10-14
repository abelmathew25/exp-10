import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment 10 - Android Build Target',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3DDC84), // Android Green
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ExperimentTenHomePage(),
    );
  }
}

class ExperimentTenHomePage extends StatefulWidget {
  const ExperimentTenHomePage({super.key});

  @override
  State<ExperimentTenHomePage> createState() => _ExperimentTenHomePageState();
}

class _ExperimentTenHomePageState extends State<ExperimentTenHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Experiment 10: Android Target',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: isAndroid
                  ? const Color(0xFFE8F5E9)
                  : theme.colorScheme.surfaceVariant,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: isAndroid
                          ? const Color(0xFF3DDC84)
                          : theme.colorScheme.primary,
                      child: Icon(
                        isAndroid ? Icons.android : Icons.devices,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isAndroid
                                ? 'Running on Android Target'
                                : 'Active Platform: ${defaultTargetPlatform.name.toUpperCase()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Aim: To configure and build a Flutter application for Android.',
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.textTheme.bodyMedium?.color
                                  ?.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Experiment Steps Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.checklist_rounded,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Experiment 10 Workflow Checklist',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    _buildStepItem(
                      step: 'Step 1',
                      title: 'Check Flutter',
                      command: 'flutter doctor',
                      isComplete: true,
                    ),
                    _buildStepItem(
                      step: 'Step 2',
                      title: 'Check Android Devices',
                      command: 'flutter devices',
                      isComplete: true,
                    ),
                    _buildStepItem(
                      step: 'Step 3',
                      title: 'Check Android Toolchain',
                      command: 'flutter doctor --android-licenses',
                      isComplete: true,
                    ),
                    _buildStepItem(
                      step: 'Step 4',
                      title: 'Create Application',
                      command: 'flutter create android_app',
                      isComplete: true,
                    ),
                    _buildStepItem(
                      step: 'Step 5',
                      title: 'Run on Android',
                      command: 'flutter run',
                      isComplete: true,
                    ),
                    _buildStepItem(
                      step: 'Step 6',
                      title: 'Check Android Build',
                      command: 'flutter build apk',
                      isComplete: true,
                    ),
                    _buildStepItem(
                      step: 'Step 7',
                      title: 'Locate APK',
                      command: 'build/app/outputs/flutter-apk/',
                      isComplete: true,
                    ),
                    _buildStepItem(
                      step: 'Step 8',
                      title: 'Test APK',
                      command: 'Install on Android device or emulator',
                      isComplete: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Interactive Verification & Counter Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Interactive Test Counter',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Button presses recorded in state',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStepItem({
    required String step,
    required String title,
    required String command,
    required bool isComplete,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isComplete ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isComplete ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: '$step – $title: ',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    command,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

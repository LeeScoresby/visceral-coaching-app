import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configurar RevenueCat
  await Purchases.configure(
    PurchasesConfiguration('test_YzyxiiLGFjhGMKniLgvByZXHORZ')
      ..appUserID = null, // Opcional: ID de usuario personalizado
  );
  
  runApp(const VisceralApp());
}

class VisceralApp extends StatelessWidget {
  const VisceralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visceral',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _appUserID;

  @override
  void initState() {
    super.initState();
    _loadUserID();
  }

  Future<void> _loadUserID() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      setState(() {
        _appUserID = customerInfo.originalAppUserId;
      });
    } catch (e) {
      debugPrint('Error loading user ID: $e');
    }
  }

  Future<void> _showRevenueCatPaywall() async {
    try {
      final paywallResult = await RevenueCatUI.presentPaywall();
      debugPrint('Paywall result: $paywallResult');
    } catch (e) {
      debugPrint('Error showing paywall: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error mostrando paywall: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Visceral Coaching App',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            if (_appUserID != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SelectableText(
                  'User ID: $_appUserID',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _showRevenueCatPaywall,
              icon: const Icon(Icons.rocket_launch),
              label: const Text('Únete al Plan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

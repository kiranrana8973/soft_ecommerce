import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:soft_ecommerce/app/app.dart';
import 'package:soft_ecommerce/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

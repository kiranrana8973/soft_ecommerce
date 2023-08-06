import 'package:flutter/material.dart';
import 'package:soft_ecommerce/features/onboarding/presentation/screen/onboarding_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingView(),
    );
  }
}

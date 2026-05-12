import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Center(child: Text('Checkout', style: AppTextStyles.h3)),
    );
  }
}

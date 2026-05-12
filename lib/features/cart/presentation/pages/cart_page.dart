import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Center(child: Text('Cart', style: AppTextStyles.h3)),
    );
  }
}

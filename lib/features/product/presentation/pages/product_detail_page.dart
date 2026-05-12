import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: Center(child: Text('Product #$productId', style: AppTextStyles.h3)),
    );
  }
}

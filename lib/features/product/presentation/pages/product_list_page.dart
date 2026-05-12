import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Center(child: Text('Product List', style: AppTextStyles.h3)),
    );
  }
}

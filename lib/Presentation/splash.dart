
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:one_machine/Presentation/shop_category.dart';
import 'package:one_machine/provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('asset/lottie_files/splash.json'),
            const SizedBox(
              height: 20,
            ),
            Text(
              'OneShop',
              style: TextStyle(color: Colors.brown.shade700, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  goToHome() {
    Future<void> fetchData() async {
      await Provider.of<ProductsProvider>(context, listen: false).getProducts();
    }

    fetchData().then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProductsScreen()),
        ));
  }
}

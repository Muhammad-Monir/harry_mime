import 'package:flutter/material.dart';
import 'package:harry_mine/constants/app_constants.dart';
import 'package:harry_mine/features/home/presentation/home.dart';
import 'package:harry_mine/features/onboarding/presentation/onboarding_screen.dart';
import 'package:harry_mine/helpers/dao_access.dart';
import 'package:harry_mine/helpers/di.dart';
import 'package:harry_mine/networks/api_acess.dart';

import 'helpers/helper_methods.dart';
import 'welcome_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;
  //bool _isFirstTime = false;
  bool isFirstTime = true;
  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await setInitValue();
    await getBusinessRX.fetchCartData();
    await getCategotyObj.fetchCategoryData();
    isFirstTime = appData.read('isFirstTime') ?? true;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const WelcomeScreen();
    } else {
      return isFirstTime ? const OnboardingScreen() : const HomeScreen();
    }
  }
}

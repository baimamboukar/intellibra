import 'package:intellibra/src/app/assets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';


List<PageViewModel> onboardingData = [
  PageViewModel(
    title: 'Welcome to intellibra',
    body: 'the only breast cancer app you will ever need',
    image: Image.asset(Assets.welcome),
  ),
  PageViewModel(
    title: 'Self-Scan Functionality',
    body:
        'Get started with IntelliBra by connecting for regular self-scans, aiding early detection with advanced analysis.',
    image: Image.asset(Assets.cancer),
  ),
  PageViewModel(
    title: 'Awareness Section',
    body:
        'Stay informed on breast cancer with helpful resources and survivor stories, empowering proactive health habits',
    image: Image.asset(Assets.reading),
  ),
  PageViewModel(
    title: 'Records Management',
    body:
        'Track your screening history and results for informed decision-making and proactive health management.',
    image: Image.asset(Assets.chart),
  ),
  PageViewModel(
    title: 'Profile Section',
    body:
        'Personalize your IntelliBra experience, updating settings to tailor the app to your needs and preferences.',
    image: Image.asset(Assets.waiting),
  ),
];

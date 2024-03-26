import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/features/onboarding/welcome/data/onboarding_model.dart';

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: 'Welcome to intellibra',
    description: 'the only breast cancer app you will ever need',
    image: Assets.welcome,
  ),
  OnboardingModel(
    title: 'Self-Scan Functionality',
    description:
        'Get started with IntelliBra by connecting for regular self-scans, aiding early detection with advanced analysis.',
    image: Assets.cancer,
  ),
  OnboardingModel(
    title: 'Awareness Section',
    description:
        'Stay informed on breast cancer with helpful resources and survivor stories, empowering proactive health habits',
    image: Assets.reading,
  ),
  OnboardingModel(
    title: 'Records Management',
    description:
        'Track your screening history and results for informed decision-making and proactive health management.',
    image: Assets.chart,
  ),
  OnboardingModel(
    title: 'Profile Section',
    description:
        'Personalize your IntelliBra experience, updating settings to tailor the app to your needs and preferences.',
    image: Assets.waiting,
  ),
];

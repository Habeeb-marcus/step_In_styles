class OnboardingData {
  final String title;
  final String description;
  final String imageSrc;

  OnboardingData({
    this.title = '',
    this.description = '',
    this.imageSrc = '',
  });
}

List<OnboardingData> onboardingData = [
// e-commerce shoe store onboarding data
  OnboardingData(
    title: 'Welcome to Step In Style',
    description:
        'Step In Style is a shoe store that offers a wide range of shoes of different brands and styles.',
    imageSrc: 'assets/images/onboardingOne.png',
  ),
  OnboardingData(
    title: 'Find the best shoes for you',
    description:
        "Smart, Goergeous, and Comfortable shoes are available here.",
    imageSrc: 'assets/images/onboardingTwo.png',
  ),
  OnboardingData(
    title: 'Get the best deals on shoes',
    description:
        "We offer the best deals on shoes. You can find the best deals on shoes here.",
    imageSrc: 'assets/images/onboardingThree.png',
  ),
];

import 'package:flutter/material.dart';
import 'package:soft_ecommerce/features/auth/presentation/screen/login_view.dart';
import 'package:soft_ecommerce/features/onboarding/presentation/state/onboarding_state.dart';
import 'package:soft_ecommerce/features/onboarding/presentation/widget/dotIndicator_widget.dart';
import 'package:soft_ecommerce/features/onboarding/presentation/widget/onboarding_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: OnboardingState.onboardingList.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingWidget(
                      image: OnboardingState.onboardingList[index].image,
                      title: OnboardingState.onboardingList[index].title,
                      description:
                          OnboardingState.onboardingList[index].description,
                    );
                  },
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Spacer(),
                  ...List.generate(
                      OnboardingState.onboardingList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndcatorWidget(
                              isActive: index == _pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.hasClients &&
                                _pageController.page! <
                                    OnboardingState.onboardingList.length - 1
                            ? _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              )
                            : Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginView(),
                                ),
                              );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(8),
                      ),
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

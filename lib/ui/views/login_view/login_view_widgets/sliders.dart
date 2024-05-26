import 'package:flutter/material.dart';
import 'package:task/core/paths/local_paths.dart';
import 'package:task/core/theme/colors_theme.dart';
import 'package:task/data/models/slider_onboarding_model.dart';
import 'package:task/ui/views/login_view/login_view_widgets/background.dart';
import 'package:task/ui/widgets/pagination_carousel.dart';

class Sliders extends StatefulWidget {
  const Sliders({super.key});

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  int currentPageIndex = 0;
  double currentPage = 0.0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController()..addListener(listenerPageView);

    super.initState();
  }

  void listenerPageView() {
    setState(() {
      currentPage = _pageController.page!;
      currentPageIndex = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(listenerPageView);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<SliderOnboarding> sliders = [
      SliderOnboarding(
        topImage: LocalAppPaths.sliders,
        bold: "TaskMaster",
        label: "Organiza y gestiona tus tareas diarias.",
      ),
    ];

    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                color: ColorsAppTheme.primaryColor,
                padding: const EdgeInsets.only(top: kToolbarHeight),
                child: _buildPageView(sliders),
              ),
            ),
          ),
          _buildPagination(sliders.length)
        ],
      ),
    );
  }

  Widget _buildPageView(List<SliderOnboarding> sliders) {
    return PageView(
      controller: _pageController,
      children: sliders.map((item) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              LocalAppPaths.sliders,
            ),
            _buildTitle(item.bold, item.label),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTitle(String bold, String label) {
    return Column(
      children: [
        Text(
          bold,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: ColorsAppTheme.blueColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildPagination(int quantity) => Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: PaginationCarousel(
          quantity: quantity,
          currentPage: currentPageIndex,
          sizeSelectIndicator: 8,
          sizeUnSelectIndicator: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      );
}

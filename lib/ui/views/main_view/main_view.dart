import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:AeroTaxi/ui/views/main_view/main_view_store.dart';
import 'package:AeroTaxi/ui/widgets/bottom_bar/bottombar.dart';

import 'main_controller.dart';

final injector = GetIt.instance;

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final MainController _controller = injector.get<MainController>();

  @override
  void initState() {
    super.initState();
    _controller.init(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      homeIndex: 0,
      physics: const NeverScrollableScrollPhysics(),
      routes: StoreMainView.supplierRoutes,
      builder: (context, child, _) {
        return Scaffold(
          body: child,
          bottomNavigationBar: _bottomNavigationBar(AutoTabsRouter.of(context)),
        );
      },
    );
  }

  Widget _bottomNavigationBar(TabsRouter tabsRouter) {
    return BottomNavigation(
      pages: StoreMainView.supplierPages,
      currentPage: tabsRouter.activeIndex,
      onPressed: (int index) {
        tabsRouter.setActiveIndex(index);
      },
    );
  }
}

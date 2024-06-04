import 'package:AeroTaxi/ui/views/services_view/services_controller.dart';
import 'package:AeroTaxi/ui/views/services_view/services_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/sliver_app_bar_delegate.dart';

final injector = GetIt.instance;

class TabsStatusServiceWidget extends StatelessWidget {
  const TabsStatusServiceWidget({super.key});

  static const _textStyleLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final _controller = injector.get<ServicesController>();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10),
      sliver: SliverPersistentHeader(
        pinned: true,
        floating: false,
        delegate: SliverAppBarDelegate(
          backgroundColor: Colors.white,
          child: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              isScrollable: true,
              dividerColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: ColorsAppTheme.blueColor,
              labelStyle: _textStyleLabel,
              splashBorderRadius: BorderRadius.circular(50),
              unselectedLabelStyle: _textStyleLabel.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorsAppTheme.primaryColor,
              ),
              tabs: List.generate(
                ServiceStore.tabsStatus.length,
                (index) => Container(
                  margin: const EdgeInsets.only(top: 3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: ColorsAppTheme.primaryColor,
                      strokeAlign: 1,
                    ),
                  ),
                  child: Text(ServiceStore.tabsStatus[index].name),
                ),
              ),
              onTap: (value) {
                _controller.onTabChanged(value, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:AeroTaxi/ui/views/services_view/services_controller.dart';
import 'package:AeroTaxi/ui/views/services_view/services_widgets/steam_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/section_name_view_widget.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/sliver_app_bar_widget.dart';

import 'services_store.dart';
import 'services_widgets/tabs_status_widget.dart';

final injector = GetIt.instance;

@RoutePage()
class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView>
    with SingleTickerProviderStateMixin {
  bool isFixed = false;
  final ScrollController _scrollController = ScrollController();
  final _servicesController = injector.get<ServicesController>();

  late final AnimationController _controller = AnimationController(
    vsync: this,
    value: 0,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _servicesController.initView(context: context);

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onStopScroll(PointerEvent _) {
    if (_controller.value >= .4 && !isFixed) {
      _scrollController.animateTo(
        kToolbarHeight,
        duration: kThemeAnimationDuration,
        curve: Curves.linear,
      );
      isFixed = true;
    } else if (_controller.value <= .75) {
      _scrollController.animateTo(
        0,
        duration: kThemeAnimationDuration,
        curve: Curves.linear,
      );
      isFixed = false;
    }
  }

  void _scrollListener() {
    _controller.value = (_scrollController.offset / kToolbarHeight).clamp(0, 1);
    isFixed = !(_scrollController.offset <= kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: ServiceStore.tabsStatus.length,
        child: Listener(
          onPointerUp: _onStopScroll,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext _, Widget? __) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  CustomSliverAppBar(
                    controller: _controller,
                    title: "Mis servicios",
                  ),
                  const SliverToBoxAdapter(
                    child: SectionNameView(
                      title: "Mis servicios",
                    ),
                  ),
                  const TabsStatusServiceWidget(),
                  ValueListenableBuilder<Stream<QuerySnapshot>?>(
                    valueListenable: _servicesController.taskStreamNotifier,
                    builder: (context, taskStream, child) {
                      return StreamDataServices(stream: taskStream);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

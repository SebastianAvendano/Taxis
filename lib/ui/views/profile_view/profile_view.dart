import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:AeroTaxi/ui/views/profile_view/profile_controller.dart';
import 'package:AeroTaxi/ui/views/profile_view/profile_view_widgets/profile_view_avatar.dart';
import 'package:AeroTaxi/ui/views/profile_view/profile_view_widgets/sections_buttons.dart';
import 'package:AeroTaxi/ui/widgets/render_current_version.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/section_name_view_widget.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/sliver_app_bar_widget.dart';

final injector = GetIt.instance;

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  bool isFixed = false;
  final ScrollController _scrollController = ScrollController();

  late final AnimationController _controller = AnimationController(
    vsync: this,
    value: 0,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      injector.get<ProfileController>().initView(context: context);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      injector.get<ProfileController>().initView(context: context);
    });
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
    return Listener(
      onPointerUp: _onStopScroll,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext _, Widget? __) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              CustomSliverAppBar(
                controller: _controller,
                title: "Perfil",
              ),
              const SliverToBoxAdapter(
                child: SectionNameView(
                  title: "Perfil",
                ),
              ),
              const SliverToBoxAdapter(child: AvatarProfileView()),
              const SliverToBoxAdapter(child: SectionButtons()),
              const SliverToBoxAdapter(child: RenderCurrentVersion()),
            ],
          );
        },
      ),
    );
  }
}

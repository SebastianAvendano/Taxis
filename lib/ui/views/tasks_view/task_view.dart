import 'package:AeroTaxi/ui/views/tasks_view/task_widgets/steam_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:AeroTaxi/ui/views/tasks_view/task_controller.dart';
import 'package:AeroTaxi/ui/views/tasks_view/task_store.dart';
import 'package:AeroTaxi/ui/views/tasks_view/task_widgets/button_add_task.dart';
import 'package:AeroTaxi/ui/views/tasks_view/task_widgets/tabs_status_widget.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/section_name_view_widget.dart';
import 'package:AeroTaxi/ui/widgets/sliver_app_bar_widget/sliver_app_bar_widget.dart';

final injector = GetIt.instance;

@RoutePage()
class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView>
    with SingleTickerProviderStateMixin {
  bool isFixed = false;
  final ScrollController _scrollController = ScrollController();
  final _taskController = injector.get<TaskController>();

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
    _taskController.initView(context: context);

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
        length: TaskStore.tabsStatus.length,
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
                    title: "Reportes",
                  ),
                  const SliverToBoxAdapter(
                    child: SectionNameView(
                      title: "Reportes",
                    ),
                  ),
                  const TabsStatusWidget(),
                  ValueListenableBuilder<Stream<QuerySnapshot>?>(
                    valueListenable: _taskController.taskStreamNotifier,
                    builder: (context, taskStream, child) {
                      return StreamData(stream: taskStream);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: const ButtonAddTask(),
    );
  }
}

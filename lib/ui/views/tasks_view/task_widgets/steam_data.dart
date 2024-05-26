import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:jiffy/jiffy.dart';
import 'package:task/core/theme/colors_theme.dart';
import 'package:task/data/models/task/task_model.dart';
import 'package:task/ui/views/tasks_view/task_controller.dart';
import 'package:task/ui/widgets/card.dart';
import 'package:task/ui/widgets/empty_data_lottie_widget.dart';
import 'package:task/ui/widgets/loading_widget.dart';

final injector = GetIt.instance;

class StreamData extends StatelessWidget {
  const StreamData({super.key, required this.stream});

  final Stream<QuerySnapshot>? stream;
  static final controller = injector.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingWidget();
          }

          final List<QueryDocumentSnapshot?> listTasks =
              snapshot.data?.docs ?? [];

          if (listTasks.isNotEmpty) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: listTasks.length,
                (context, index) {
                  final TaskModel task = TaskModel.fromJson(
                      listTasks[index]?.data()! as Map<String, dynamic>);
                  return _buildCardTask(context, task);
                },
              ),
            );
          } else {
            return _buildEmpyData(context);
          }
        });
  }

  Widget _buildCardTask(BuildContext context, TaskModel task) {
    return CardWidget(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.all(15),
      backgroundColor: ColorsAppTheme.primaryColor.withOpacity(0.1),
      child: ListTile(
        title: Text(
          task.title!,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        subtitle: _buildContent(task),
        onTap: () => controller.onSelectedTask(context, task),
      ),
    );
  }

  Widget _buildContent(TaskModel task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.description!,
          maxLines: 2,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Text(
          Jiffy(task.createdAt).format("dd MMMM yyyy"),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildEmpyData(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: const EmptyDataLottie(
            path: 'assets/lottie/empty_list_lottie.json',
            label: "No tienes tareas creadas",
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SliverToBoxAdapter(
      child: Column(
        children: List.generate(
          5,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: LoadingWidget(
              height: 80,
            ),
          ),
        ),
      ),
    );
  }
}

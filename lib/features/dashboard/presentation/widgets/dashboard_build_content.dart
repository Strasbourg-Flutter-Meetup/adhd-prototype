import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../shared/ui/content_builder.dart';
import '../blocs/dashboard_state.dart';
import 'dashboard_greeting.dart';
import 'notebook_section/notebook_list.dart';
import 'notebook_section/notebook_section.dart';
import 'task_section/task_section.dart';
import 'task_section/task_swipe_dismissible.dart';

/// A content builder for the dashboard screen.
///
/// The [DashboardBuildContentBuilder] class is responsible for building the
/// content for the dashboard screen based on the provided [DashboardStateData].
/// It overrides the [build] method to create a [DashboardBuildContent] widget
/// with the given data.
class DashboardBuildContentBuilder extends ContentBuilder<DashboardStateData> {
  /// Builds the dashboard content based on the provided [data].
  ///
  /// The [data] parameter contains the necessary data for constructing the
  /// dashboard content. This method returns a [DashboardBuildContent] widget
  /// configured with the provided data.
  @override
  Widget build({required data}) => DashboardBuildContent(
        data: data,
      );
}

class DashboardBuildContent extends StatelessWidget {
  const DashboardBuildContent({
    super.key,
    required this.data,
  });

  final DashboardStateData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 56.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                300,
              ),
              painter: CurvePainter(MediaQuery.of(context).size.width, context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.47,
            child: CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                300,
              ),
              painter: CurvePainter(MediaQuery.of(context).size.width / 4, context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.52,
            child: CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                300,
              ),
              painter: CurvePainter(MediaQuery.of(context).size.width * 2.3, context),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48.0),
                DashboardGreeting(userName: data.userName),
                const SizedBox(height: 48.0),
                const NotebookSection(),
                const SizedBox(height: 12.0),
                NotebookList(
                  notebookDetails: data.notebookDetails,
                ),
                const SizedBox(height: 48.0),
                const TasksSection(),
                ...List.generate(
                  data.todayTasksDetails.length,
                  (index) => TaskSwipeDismissible(
                      item: data.todayTasksDetails[index].task),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  BuildContext context;

  CurvePainter(this.value, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()
      ..color = Theme.of(context).colorScheme.primary.withAlpha(15);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

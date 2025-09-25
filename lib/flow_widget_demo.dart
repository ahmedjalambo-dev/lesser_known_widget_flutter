import 'dart:math';

import 'package:flutter/material.dart';

class FlowWidgetDemo extends StatelessWidget {
  const FlowWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'The Flow widget arranges its children using a delegate for high-performance, complex layouts, like this circular menu.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Flow(
              delegate: CircleFlowDelegate(),
              children: List.generate(8, (index) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        Colors.primaries[index * 2 % Colors.primaries.length],
                  ),
                  child: const Icon(Icons.star, color: Colors.white, size: 40),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom delegate for the Flow widget
class CircleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final double radius = context.size.shortestSide / 2.5;
    final int count = context.childCount;
    final double angle = (2 * pi) / count;

    for (int i = 0; i < count; i++) {
      final childSize = context.getChildSize(i) ?? Size.zero;
      final double x =
          radius * cos(i * angle) +
          (context.size.width / 2) -
          (childSize.width / 2);
      final double y =
          radius * sin(i * angle) +
          (context.size.height / 2) -
          (childSize.height / 2);

      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(CircleFlowDelegate oldDelegate) => false;
}

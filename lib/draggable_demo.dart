import 'package:flutter/material.dart';

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({super.key});

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  Color _acceptedColor = Colors.grey.shade800;
  String _acceptedText = 'Drop the circle here!';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Drag the colored circle and drop it onto the target area below. This demonstrates simple drag-and-drop functionality.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Draggable<Color>(
              data: Colors.purple.shade300,
              feedback: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple.shade300.withOpacity(0.8),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.palette, color: Colors.white, size: 50),
              ),
              childWhenDragging: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple.shade300,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.palette, color: Colors.white, size: 50),
              ),
            ),
          ),
          const Spacer(),
          DragTarget<Color>(
            onWillAcceptWithDetails: (details) => true,
            onAcceptWithDetails: (details) {
              setState(() {
                _acceptedColor = details.data;
                _acceptedText = 'Color Dropped!';
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: candidateData.isNotEmpty
                      ? Colors.green.withOpacity(0.5)
                      : _acceptedColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Center(
                  child: Text(
                    _acceptedText,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

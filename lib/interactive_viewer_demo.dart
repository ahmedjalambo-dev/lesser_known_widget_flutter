import 'package:flutter/material.dart';

class InteractiveViewerDemo extends StatelessWidget {
  const InteractiveViewerDemo({super.key});

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
                'Use two fingers to pan, pinch, and zoom the image below. This widget is perfect for viewing large images or complex layouts.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 4.0,
                child: Image.asset(
                  'assets/vinland_saga.png',
                  fit: BoxFit.cover,
                  // A simple error builder
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.error_outline,
                      size: 50,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

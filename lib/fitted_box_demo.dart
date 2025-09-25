import 'package:flutter/material.dart';

class FittedBoxDemo extends StatefulWidget {
  const FittedBoxDemo({super.key});

  @override
  State<FittedBoxDemo> createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo> {
  double _containerWidth = 350.0;

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
                'FittedBox scales and positions its child. Use the slider to resize the container and see how the content inside the FittedBox adapts.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Container(
              width: _containerWidth,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.teal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wb_sunny, size: 50, color: Colors.white),
                      const SizedBox(width: 16),
                      Text(
                        'This content will always fit!',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            'Container Width: ${_containerWidth.toStringAsFixed(0)}',
            textAlign: TextAlign.center,
          ),
          Slider(
            value: _containerWidth,
            min: 50.0,
            max:
                MediaQuery.of(context).size.width -
                32, // Max width based on screen size
            onChanged: (value) {
              setState(() {
                _containerWidth = value;
              });
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

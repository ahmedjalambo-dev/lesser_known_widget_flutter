import 'package:flutter/material.dart';

class IndexedStackDemo extends StatefulWidget {
  const IndexedStackDemo({super.key});

  @override
  State<IndexedStackDemo> createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int _index = 0;

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
                'IndexedStack shows only one child from a list, but keeps all children in the tree and preserves their state. Perfect for tabbed views.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text('Home'),
                selected: _index == 0,
                onSelected: (selected) => setState(() => _index = 0),
                iconTheme: IconThemeData(
                  color: _index == 0 ? Colors.white : Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Profile'),
                selected: _index == 1,
                onSelected: (selected) => setState(() => _index = 1),
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Settings'),
                selected: _index == 2,
                onSelected: (selected) => setState(() => _index = 2),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IndexedStack(
                index: _index,
                children: const [
                  _StackChild(
                    icon: Icons.home,
                    text: 'Home Page',
                    color: Colors.blue,
                  ),
                  _StackChild(
                    icon: Icons.person,
                    text: 'Profile Page',
                    color: Colors.green,
                  ),
                  _StackChild(
                    icon: Icons.settings,
                    text: 'Settings Page',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StackChild extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const _StackChild({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: color),
          const SizedBox(height: 16),
          Text(text, style: TextStyle(fontSize: 24, color: color)),
        ],
      ),
    );
  }
}

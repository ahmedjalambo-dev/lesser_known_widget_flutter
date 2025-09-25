import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReorderableListViewDemo extends StatefulWidget {
  const ReorderableListViewDemo({super.key});

  @override
  State<ReorderableListViewDemo> createState() =>
      _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {
  List<String> _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/widget_data.json',
      );
      final data = await json.decode(response);
      setState(() {
        _items = List<String>.from(data['items']);
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                'Long-press and drag any item to reorder the list. This is useful for user-customizable lists like playlists or task lists.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ReorderableListView(
                    children: List.generate(_items.length, (index) {
                      return Card(
                        key: Key('$index'),
                        child: ListTile(
                          leading: CircleAvatar(child: Text('${index + 1}')),
                          title: Text(_items[index]),
                          trailing: const Icon(Icons.drag_handle),
                        ),
                      );
                    }),
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final String item = _items.removeAt(oldIndex);
                        _items.insert(newIndex, item);
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/reorderable_list_view_demo.dart';
import 'clip_path_demo.dart';
import 'draggable_demo.dart';
import 'fitted_box_demo.dart';
import 'flow_widget_demo.dart';
import 'indexed_stack_demo.dart';
import 'interactive_viewer_demo.dart';

// --- Main Application Entry Point ---
void main() {
  runApp(const WidgetCatalogApp());
}

class WidgetCatalogApp extends StatelessWidget {
  const WidgetCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// --- Home Page with Tab Navigation ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // Increased from 5 to 7
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lesser-Known Widgets'),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true, // Allow tabs to scroll on smaller screens
            tabs: [
              Tab(icon: Icon(Icons.zoom_out_map), text: 'Interactive'),
              Tab(icon: Icon(Icons.reorder), text: 'Reorderable'),
              Tab(icon: Icon(Icons.filter_vintage), text: 'Flow'),
              Tab(icon: Icon(Icons.touch_app), text: 'Draggable'),
              Tab(icon: Icon(Icons.crop), text: 'ClipPath'),
              Tab(icon: Icon(Icons.layers), text: 'IndexedStack'), // New
              Tab(icon: Icon(Icons.fit_screen), text: 'FittedBox'), // New
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const InteractiveViewerDemo(),
            const ReorderableListViewDemo(),
            const FlowWidgetDemo(),
            const DraggableDemo(),
            const ClipPathDemo(),
            const IndexedStackDemo(),
            const FittedBoxDemo(),
          ],
        ),
      ),
    );
  }
}

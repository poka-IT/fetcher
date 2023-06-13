import 'package:flutter/material.dart';
import 'package:fetcher/fetcher.dart';

import 'pages/fetch_builder.page.dart';
import 'pages/async_task_builder.page.dart';
import 'pages/event_fetch_builder.page.dart';
import 'pages/async_edit_builder.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultFetcherConfig(
      config: FetcherConfig(
        onDisplayError: (context, error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        )),
      ),
      child: MaterialApp(
        title: 'Fetcher Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetcher Example'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.download),
            label: 'Fetch',
          ),
          NavigationDestination(
            icon: Icon(Icons.keyboard_double_arrow_down),
            label: 'EventFetch',
          ),
          NavigationDestination(
            icon: Icon(Icons.upload),
            label: 'AsyncTask',
          ),
          NavigationDestination(
            icon: Icon(Icons.sync),
            label: 'AsyncEdit',
          ),
        ],
      ),
      body: <Widget>[
        const FetchBuilderPage(),
        const EventFetchBuilderPage(),
        const AsyncTaskBuilderPage(),
        const AsyncEditBuilderPage(),
      ][currentPageIndex],
    );
  }
}

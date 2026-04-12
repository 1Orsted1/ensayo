import 'package:ensayo/application/theme/theme_cubit.dart';
import 'package:ensayo/domain/theme/selected_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 50;
  String _radioValue = 'Option 1';
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final themeCubit = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Common Widgets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              if (themeCubit.state == SelectedTheme.light) {
                themeCubit.setTheme(SelectedTheme.dark);
              } else {
                themeCubit.setTheme(SelectedTheme.light);
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Widget
            const Text(
              'Text',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // ElevatedButton
            ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 16),

            // TextButton
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            const SizedBox(height: 16),

            // OutlinedButton
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
            const SizedBox(height: 16),

            // IconButton
            Row(
              children: [
                const Text('IconButton: '),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // TextField
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'TextField',
                hintText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Switch
            Row(
              children: [
                const Text('Switch: '),
                Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Checkbox
            Row(
              children: [
                const Text('Checkbox: '),
                Checkbox(
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Radio
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Radio:'),
                RadioGroup(
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                  child: RadioListTile<String>(
                    title: const Text('Option 1'),
                    value: 'Option 1',
                  ),
                ),
                RadioGroup(
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  },
                  groupValue: _radioValue,
                  child: RadioListTile<String>(
                    title: const Text('Option 2'),
                    value: 'Option 2',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Slider
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Slider: ${_sliderValue.round()}'),
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.surfaceContainerHigh,
                // color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Container with decoration'),
            ),
            const SizedBox(height: 16),

            // Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: const Text('Card widget'),
              ),
            ),
            const SizedBox(height: 16),

            // Image
            const Text('Image (from network):'),
            Image.network(
              'https://picsum.photos/200/100',
              height: 100,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 16),

            // Icon
            const Row(
              children: [
                Text('Icon: '),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.home, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 16),

            // CircularProgressIndicator
            const Row(
              children: [
                Text('CircularProgressIndicator: '),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // LinearProgressIndicator
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('LinearProgressIndicator:'),
                SizedBox(height: 8),
                LinearProgressIndicator(),
              ],
            ),
            const SizedBox(height: 16),

            // Divider
            const Divider(thickness: 2),
            const SizedBox(height: 16),

            // ListTile
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('ListTile'),
              subtitle: Text('With leading, title, and subtitle'),
              trailing: Icon(Icons.arrow_forward),
            ),
            const SizedBox(height: 16),

            // Chip
            const Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Chip 1')),
                Chip(label: Text('Chip 2')),
                Chip(label: Text('Chip 3')),
              ],
            ),
            const SizedBox(height: 16),

            // SnackBar trigger
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('SnackBar message')),
                );
              },
              child: const Text('Show SnackBar'),
            ),
            const SizedBox(height: 16),

            // Dialog trigger
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('AlertDialog'),
                    content: const Text('This is a dialog message'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show AlertDialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  //);
  // }
}

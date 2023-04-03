import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment(){
    state++;
  }
}

final counterProvider = StateNotifierProvider<Counter, int>(
      (ref) {
    return Counter();
  },
);


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(child: HeaderPage()),
            Expanded(child: BottomPage()),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Align(
        child: Consumer(
          builder: (context, ref, child) {
            final int numb = ref.watch(counterProvider);
            return Text(
              "$numb",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 100,
                decoration: TextDecoration.none,
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: (){
            ref.read(counterProvider.notifier).increment();
          },
          child: Text("증가"),
        ),
      ),
    );
  }
}

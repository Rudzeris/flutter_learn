import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoListApp());
}

class CryptoListApp extends StatelessWidget {
  const CryptoListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto List',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 31, 31, 31),
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white24,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
          bodySmall: TextStyle(color: Colors.white30, fontSize: 14),
        ),
      ),
      home: const CryptoListScreen(),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen();

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto List"), centerTitle: true),
      body: ListView.separated(
        separatorBuilder: (context, i) => Divider(),
        itemCount: 3,
        itemBuilder: (context, i) => ListTile(
          leading: Image.asset("assets/png/coin.png", fit: BoxFit.contain),
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text("Coin", style: textTheme.bodyMedium),
          subtitle: Text("\$1000", style: textTheme.bodySmall),
        ),
      ),
    );
  }
}

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
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 18),
          bodySmall: TextStyle(color: Colors.white30, fontSize: 14),
        ),
      ),
      routes: {
        "/coins-list": (context) => CryptoListScreen(),
        "/coin": (context) => CryptoCoinScreen("coin"),
      },
      initialRoute: "/coins-list",
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
        itemBuilder: (context, i) {
          const coin = "Coin";
          return ListTile(
            leading: Image.asset("assets/png/coin.png", fit: BoxFit.contain),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text(coin, style: textTheme.bodyMedium),
            subtitle: Text("\$1000", style: textTheme.bodySmall),
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => CryptoCoinScreen(coin)),
              // );
              Navigator.of(context).pushNamed("/coin", arguments: coin);
            },
          );
        },
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  String _coin;

  CryptoCoinScreen(String coin, {super.key}) : _coin = coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(arg != null && arg is String, "Error");
    widget._coin = arg as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget._coin ?? "error")));
  }
}

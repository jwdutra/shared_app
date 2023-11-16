import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Aplicativo 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final editController = TextEditingController();

  @override
  void dispose() {
    editController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: editController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite o texto',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (editController.text.isNotEmpty) {
                        Clipboard.setData(
                                ClipboardData(text: editController.text))
                            .then((_) async {
                          var isAppInstalledResult = await LaunchApp.openApp(
                            androidPackageName: 'com.example.appandroid2',
                            iosUrlScheme: 'appios2://',
                            //openStore: false
                          );
                          print(
                              'isAppInstalledResult => $isAppInstalledResult ${isAppInstalledResult.runtimeType}');

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Texto copiado para o clipboard'),
                            ),
                          );
                        });
                      }
                    },
                    child: const Text('COPIA TEXTO DO CLIPBOARD'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      editController.text = '';
                    },
                    child: const Text('LIMPA'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

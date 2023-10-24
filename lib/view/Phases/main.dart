import 'package:flutter/material.dart';

class HomePhase extends StatefulWidget {
  @override
  _HomePhase createState() => _HomePhase();

}

class _HomePhase extends State<HomePhase> {
  _HomePhase();

  String greetings = 'Selecciona unas fase';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              leading: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              title: const Text('Fases'),
                            ),
                            body: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (_, int index) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      greetings = 'texto $index';  
                                    });
                                    
                                    print('texto: $index');
                                    Navigator.pop(context);
                                  },
                                  title: Text('texto $index'),
                                );
                              }
                              )
                          );
                          /* Container(
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ); */
                        },
                        isScrollControlled: true);
                  },
                  label: Text(greetings),
                  icon: const Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

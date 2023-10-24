import 'package:flutter/material.dart';
// import 'package:godseyeev1/popmenu.dart';
import 'package:provider/provider.dart';

import 'conversation_provider.dart';




void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConversationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // create theme
  final ThemeData theme = ThemeData(
    primarySwatch: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Godseye',
      theme: theme,
      debugShowCheckedModeBanner: false,

      home: Scaffold(


        appBar: AppBar(
          title: Text(
            Provider.of<ConversationProvider>(context, listen: true).currentConversationTitle,
            style: const TextStyle(
              fontSize: 20.0, // change font size
              color: Colors.black, // change font color
              fontFamily: 'din-regular', // change font family
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),



          backgroundColor: Colors.grey[100],
          elevation: 0, // remove box shadow
          toolbarHeight: 50,
          actions: [
            // CustomPopupMenu(),
          ],
        ),
        // drawer: MyDrawer(),
        body:  Center(
          // child: ChatPage(),
        ),
      ),
    );
  }
}

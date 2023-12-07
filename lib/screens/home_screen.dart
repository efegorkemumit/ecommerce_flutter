import 'package:ecommerce_flutter/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello Wordl",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Hello world")),
            SwitchListTile(
              title: Text(
                themeProvider.getIsDarkTheme?"Dark Mode" : "LightM Mode"
              ),
                value: themeProvider.getIsDarkTheme, 
                onChanged: (value){
                  themeProvider.setDarkTheme(themeValue: value);
                })
          ],
        ),

      ),
    );
  }
}

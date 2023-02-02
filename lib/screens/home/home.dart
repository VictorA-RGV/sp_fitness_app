import 'package:flutter/material.dart';
import 'package:sp_fitness_app/services/auth.dart';

// landing page for a longed in user
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('HomePage of app'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.person),
              label:  const Text('logout'))
        ],
      ),
      
    );
  }
}

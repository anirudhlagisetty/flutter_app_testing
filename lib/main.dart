// ----------------------------------------------BABY NAMES EXAMPLE ------------------------------------------------------------------------

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Baby Names',
//      home: MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() {
//    return _MyHomePageState();
//  }
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Baby Name Votes')),
//      body: _buildBody(context),
//    );
//  }
//
//  Widget _buildBody(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection('baby').snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return LinearProgressIndicator();
//
//        return _buildList(context, snapshot.data.documents);
//      },
//    );
//  }
//
//  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return ListView(
//      padding: const EdgeInsets.only(top: 20.0),
//      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//    );
//  }
//
//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final record = Record.fromSnapshot(data);
//
//    return Padding(
//      key: ValueKey(record.name),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(record.name),
//          trailing: Text(record.votes.toString()),
//          onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)}),
//        ),
//      ),
//    );
//  }
//}
//
//class Record {
//  final String name;
//  final int votes;
//  final DocumentReference reference;
//
//  Record.fromMap(Map<String, dynamic> map, {this.reference})
//      : assert(map['name'] != null),
//        assert(map['votes'] != null),
//        name = map['name'],
//        votes = map['votes'];
//
//  Record.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);
//
//  @override
//  String toString() => "Record<$name:$votes>";
//}

// ----------------------------------------------BABY NAMES EXAMPLE ------------------------------------------------------------------------


// ----------------------------------------------BASIC LOGIN EXAMPLE ------------------------------------------------------------------------
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.indigo,
//      ),
//      home: LandingPage(),
//    );
//  }
//}
//
//class LandingPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<FirebaseUser>(
//      stream: FirebaseAuth.instance.onAuthStateChanged,
//      builder: (context, snapshot) {
//        if (snapshot.connectionState == ConnectionState.active) {
//          FirebaseUser user = snapshot.data;
//          if (user == null) {
//            return SignInPage();
//          }
//          return HomePage();
//        } else {
//          return Scaffold(
//            body: Center(
//              child: CircularProgressIndicator(),
//            ),
//          );
//        }
//      },
//    );
//  }
//}
//
//class SignInPage extends StatelessWidget {
//
//  Future<void> _signInAnonymously() async {
//    try {
//      await FirebaseAuth.instance.signInAnonymously();
//    } catch (e) {
//      print(e); // TODO: show dialog with error
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Sign in')),
//      body: Center(
//        child: RaisedButton(
//          child: Text('Sign in anonymously'),
//          onPressed: _signInAnonymously,
//        ),
//      ),
//    );
//  }
//}
//
//class HomePage extends StatelessWidget {
//
//  Future<void> _signOut() async {
//    try {
//      await FirebaseAuth.instance.signOut();
//    } catch (e) {
//      print(e); // TODO: show dialog with error
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home Page'),
//        actions: <Widget>[
//          FlatButton(
//            child: Text(
//              'Logout',
//              style: TextStyle(
//                fontSize: 18.0,
//                color: Colors.white,
//              ),
//            ),
//            onPressed: _signOut,
//          ),
//        ],
//      ),
//    );
//  }
//}

// ----------------------------------------------BASIC LOGIN EXAMPLE ------------------------------------------------------------------------

// ----------------------------------------------ADVANCED LOGIN EXAMPLE ------------------------------------------------------------------------

import 'package:flutter/material.dart';
import "package:babynames/authentication.dart";
import 'package:babynames/root_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Login Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth())
    );
  }
}


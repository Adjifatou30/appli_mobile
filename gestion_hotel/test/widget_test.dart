// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';

// main function
void main() => runApp(HiddenTopAppBar());

class HiddenTopAppBar extends StatefulWidget {
@override
HiddenTopAppBarState createState() => new HiddenTopAppBarState();
}

class HiddenTopAppBarState extends State<HiddenTopAppBar> {

@override
initState() {
	super.initState();
}

@override
Widget build(BuildContext context) {
	// MaterialApp
	return MaterialApp(
	debugShowCheckedModeBanner:false,
	// scaffold
	home:Scaffold(
	body: NestedScrollView(
		headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
		return [
			SliverAppBar(
			leading:Icon(Icons.wallpaper),
			title: Container(
				color:Colors.blue,
				child:Text("Hidden AppBar")
			),
			elevation: 10.0,
			automaticallyImplyLeading: false,
			expandedHeight:50,
			floating: true,
			snap: true,
			)
		];
		},
		// list of images for scrolling
		body: ListView(
		children: <Widget>[
			Text("Scroll Down To Hide The AppBar!"),
			Divider(),
			Image.asset("Images/S1.jpg"),
			Divider(),
			Image.asset("Images/S2.jpg"),	
			Divider(),
			Image.asset("Images/S3.jpg"),		
		],
		),
	),
	),
	);
}
}

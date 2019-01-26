import 'package:flutter/material.dart';
import 'dart:core';
import './main.dart';

class Bar {
  static Drawer getBar(context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('António Santos'),
            accountEmail: new Text('tozeps@gmail.com'),
            currentAccountPicture: ClipOval(
                child: Image.asset(
              "./images/foto.jpg",
              fit: BoxFit.cover,
              width: 50.0,
              height: 50.0,
            )),
          ),
          new ListTile(
              title: new Text('Restart'),
              onTap: () {
                RestartWidget.restartApp(context);
              }),
          new ListTile(
              title: new Text('Close'),
              onTap: () {
                RestartWidget.closeApp(context);
              })
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roverpyapp/commons/collapsing_navigation_drawer.dart';
import 'package:roverpyapp/commons/control_button.dart';
import 'package:roverpyapp/models/control_model.dart';

class ControlsPage extends StatefulWidget {
  @override
  _ControlsPageState createState() => _ControlsPageState();
}

class _ControlsPageState extends State<ControlsPage> {

  int roverCurrActive = -1;
  int beltCurrActive = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('RoverPy Controls', style: Theme.of(context).textTheme.headline,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Theme.of(context).accentColor, blurRadius: 5.0),
                ],
              ),
              child: Card(
                color: Theme.of(context).backgroundColor,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Rover Controls', style: Theme.of(context).textTheme.title),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ControlButton(icon: roverControls[0].icon, isActive: 0==roverCurrActive, onTap: () {
                            setState(() {
                              roverCurrActive = 0;
                            });
                            print('Move Forward');
                          },),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ControlButton(icon: roverControls[1].icon, isActive: 1==roverCurrActive, onTap: () {
                            setState(() {
                              roverCurrActive = 1;
                            });
                            print('Turn Left');
                          },
                          ),
                          CircleAvatar(
                            radius: 25.0, backgroundColor: -1==roverCurrActive?Theme.of(context).splashColor:Theme.of(context).primaryColor,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    roverCurrActive = -1;
                                  });
                                  print('Stop');
                                },
                                child: Icon(Icons.stop, size: 30.0, color: Colors.black,),
                              )
                          ),
                          ControlButton(icon: roverControls[2].icon, isActive: 2==roverCurrActive, onTap: () {
                            setState(() {
                              roverCurrActive = 2;
                            });
                            print('Turn Right');
                          },)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ControlButton(icon: roverControls[3].icon, isActive: 3==roverCurrActive, onTap: () {
                            setState(() {
                              roverCurrActive = 3;
                            });
                            print('Move Backwards');
                          },)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Theme.of(context).accentColor, blurRadius: 5.0)
                ]
              ),
              child: Card(
                color: Theme.of(context).backgroundColor,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Belt Controls', style: Theme.of(context).textTheme.title),
                          )
                        ],
                      ),
                      ControlButton(icon: beltControls[0].icon, isActive: 0==beltCurrActive, onTap: () {
                        setState(() {
                          beltCurrActive = 0;
                        });
                        print('Belt Up');
                      },),
                      CircleAvatar(
                          radius: 25.0, backgroundColor: -1==beltCurrActive?Theme.of(context).splashColor:Theme.of(context).primaryColor,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                beltCurrActive = -1;
                              });
                            },
                            child: Icon(Icons.stop, size: 30.0, color: Colors.black,),
                          )
                      ),
                      ControlButton(icon: beltControls[1].icon, isActive: 1==beltCurrActive, onTap: () {
                        setState(() {
                          beltCurrActive = 1;
                        });
                        print('Belt Down');
                      },)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: CollapsingNavDrawer(),
    );
  }
}

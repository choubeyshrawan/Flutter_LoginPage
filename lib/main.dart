import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(
            // primarySwatch: Colors.black
            ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> with SingleTickerProviderStateMixin {
  //single ticker means only one animation

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
       //   new Image(
         //   image: new AssetImage("assets/images/20000000.png"),
           // fit: BoxFit.cover,
           // color: Colors.white,
           // colorBlendMode: BlendMode.darken,
          //),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 100.0,
                //   size: (_iconAnimation.value) * 100, //this not worked for me
              ),
              new Form(
                child: new Theme(
                    data: new ThemeData(
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color: Colors.teal, fontSize: 15.0
                        )
                      )
                    ),

                    child: new Container(
                      padding: const EdgeInsets.all(40.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new TextFormField(
                              decoration: new InputDecoration(
                                  labelText: "Enter Email id..."),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new TextFormField(
                                decoration: new InputDecoration(
                                    labelText: "Enter Password..."),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                            ),
                            new Padding(
                                padding: const EdgeInsets.only(top: 20.0)
                            ),
                            new MaterialButton(
                              height: 40.0,
                              minWidth: 60.0,
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: new Text("Login"),
                             // child: new Icon(ico),
                              onPressed: ()=>{},
                              splashColor: Colors.redAccent,
                            )
                            
                          ],

                        )),
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}

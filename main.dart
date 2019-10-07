import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculadora IMC',
      theme: ThemeData(
        
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Calculadora IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _imc = 0,a=0,p=0;
  String classifc=null;

  void _calcIMC() {
    setState(() {
    
     _imc=p/(a*a);
        if(_imc<=16.99){
        classifc=" Muito abaixo do peso";
      }
       if(_imc>17 && _imc<=18.5){
        classifc=" Abaixo do peso";
      }
     
      if(_imc>18.5 && _imc<=24.99){
        classifc=" Normal";
      }
      if(_imc> 25 && _imc<=29.99){
        classifc=" Acima do peso ";
      }
      if(_imc>30 && _imc<=34.99){
        classifc=" Obseso (grau I) ";
      }
      if(_imc>35 && _imc<=39.99){
        classifc=" Obesidade severa (grau II) ";
      }
      if(_imc>40){
        classifc=" Obseidade morbida (grau III) ";
      }
     
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             
             
             
           
            TextField(
              onChanged: (text){
                p = double.parse(text);

              },
             style: Theme.of(context).textTheme.display1,
             decoration: InputDecoration(
             border: InputBorder.none,
             hintText: 'Digite seu peso'
             ),
             textAlign: TextAlign.center, 
            ),
            //TextField serve como entrada, retiras-se aqui o texto para a variaveial (p)
          
             
             
             
             TextField(
             onChanged: (text){
                a = double.parse(text);
           
              },
             style: Theme.of(context).textTheme.display1,
             decoration: InputDecoration(
             border: InputBorder.none,
             hintText: 'Digitesua altura'
             ),
             textAlign: TextAlign.center,
             ),
            //TextField serve como entrada, retiras-se aqui o texto para a variaveial (a)
            
            
            
            Text(
              'IMC',
              
            ),
            
            Text(
              '$_imc',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              "Situação: "+'$classifc',
              
            ),
             
            
            
            
            new RaisedButton(
              child: const Text('Calcular o IMC'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
             splashColor: Colors.blueGrey,
             onPressed: _calcIMC,
            ),
          ],
        ),
      ),
        
      
      
     
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

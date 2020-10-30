import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

String nombres;
String apellidos;
int numero;
int numLetraNombre;
int numLetraApellido;
int suma;
int sumaT;
int anio;
int hora;
int minuto;
String fecha;

int sumaDigitos(int numero) {
  int suma = 0;
  while (numero != 0) {
    suma = suma + numero % 10;
    numero = (numero ~/ 10).toInt();
  }
  return suma;
}

int sumaNyA() {
  int s = numLetraNombre + numLetraApellido;
  suma = sumaDigitos(s);
  sumaT = sumaDigitos(suma);
  return sumaT;
}

int urgenciaInt() {
  int s;
  s = sumaDigitos(numero);
  suma = sumaDigitos(s);
  sumaT = sumaDigitos(suma);
  return sumaT;
}

int tonicaF() {
  suma = sumaNyA() + urgenciaInt();
  sumaT = sumaDigitos(suma);
  return sumaT;
}

int a, m, d;

int tonicaD() {
  var now = new DateTime.now();
  a = now.year;
  m = now.month;
  d = now.day;
  int s = sumaDigitos(sumaDigitos(a)) +
      sumaDigitos(sumaDigitos(m)) +
      sumaDigitos(sumaDigitos(d));
  suma = sumaDigitos(s) + tonicaF();
  sumaT = sumaDigitos(suma);
  return sumaT;
}

int acontecimientoD() {
  var now = new DateTime.now();
  hora = now.hour;
  if (hora > 12) {
    hora = hora - 12;
  }
  minuto = now.minute;
  suma = tonicaD() + sumaDigitos(hora);
  sumaT = sumaDigitos(suma);
  return sumaT;
}

String cabalaA() {
  int s = sumaDigitos(anio);
  print(s);
  suma = sumaDigitos(s);
  String txt;
  switch (suma) {
    case 1:
      txt = "$anio | TU NUMERO REGENTE ES EL 1 \n ";
      break;
    case 2:
      txt = "$anio | TU NUMERO REGENTE ES EL 2 \n ";
      break;
    case 3:
      txt = "$anio | TU NUMERO REGENTE ES EL 3 \n ";
      break;
    case 4:
      txt = "$anio | TU NUMERO REGENTE ES EL 4 \n ";
      break;
    case 5:
      txt = "$anio | TU NUMERO REGENTE ES EL 5 \n ";
      break;
    case 6:
      txt = "$anio | TU NUMERO REGENTE ES EL 6 \n";
      break;
    case 7:
      txt = "$anio | TU NUMERO REGENTE ES EL 7 \n ";
      break;
    case 8:
      txt = "$anio | TU NUMERO REGENTE ES EL 8 \n ";
      break;
    case 9:
      txt = "$anio | TU NUMERO REGENTE ES EL 9 \n ";
      break;
  }
  print(suma);
  anio = anio + s;
  print(anio);
  return txt;
}

class _MyAppState extends State<MyApp> {
  var maskFormatter = new MaskTextInputFormatter(mask: '##/##/####');

  void onChanged(String value) {
    print(value);
    nombres = value;
    numLetraNombre = value.length - 1;
  }

  void onChanged2(String value) {
    print(value);
    apellidos = value;
    numLetraApellido = value.length - 1;
  }

  void onChanged3(String value) {
    print(maskFormatter.getUnmaskedText());
    numero = int.parse(maskFormatter.getUnmaskedText());
    anio = int.parse(maskFormatter.getUnmaskedText().substring(4, 8));
    suma = sumaDigitos(numero);
    sumaT = sumaDigitos(suma);
    fecha = maskFormatter.getMaskedText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/top_header.png'),
              alignment: Alignment.topCenter),
        ),
        padding: const EdgeInsets.all(50.0),
        child: new Center(
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Kabbalistic",
                  style: new TextStyle(
                    fontSize: 40.0,
                    decorationColor: Colors.red[200],
                    fontWeight: FontWeight.bold,
                    decorationThickness: 2.0,
                    color: Colors.white,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(5.0)),
                Icon(Icons.star, size: 50.0, color: Colors.white),
                new Padding(padding: new EdgeInsets.all(20.0)),
                new Text(
                  "Ingresa tus datos",
                  style: new TextStyle(
                    fontSize: 15.0,
                    decorationColor: Colors.red[200],
                    fontWeight: FontWeight.bold,
                    decorationThickness: 2.0,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new TextField(
                  decoration: new InputDecoration(
                      fillColor: Colors.blue[50],
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Nombres",
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onSubmitted: (String value) {
                    onChanged(value);
                  },
                ),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new TextField(
                  decoration: new InputDecoration(
                      fillColor: Colors.blue[50],
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Apellidos",
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onSubmitted: (String value) {
                    onChanged2(value);
                  },
                ),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [maskFormatter],
                  decoration: new InputDecoration(
                      hintText: "dd/mm/aaaa",
                      fillColor: Colors.blue[50],
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      prefixStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                      labelText: "Fecha de nacimiento",
                      labelStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onSubmitted: (var value) {
                    onChanged3(value);
                  },
                ),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new RaisedButton(
                    child: new Text("Entrar",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 60, left: 60),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Menu()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("MENU"),
          backgroundColor: Colors.green[200],
        ),
        body: Container(
            padding: EdgeInsets.only(
              top: 0,
              bottom: 10,
              right: 10,
              left: 10,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/top_header.png'),
                  alignment: Alignment.topCenter),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.person, size: 40.0, color: Colors.white),
                new Text("$nombres $apellidos",
                    style: new TextStyle(color: Colors.white, fontSize: 17)),
                new Text("$fecha",
                    style: new TextStyle(color: Colors.white, fontSize: 17)),
                new Padding(padding: new EdgeInsets.all(10.0)),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: RaisedButton(
                                color: Colors.greenAccent[100],
                                shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new UrgenciaInterior()));
                                },
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        "Urgencia interior",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: RaisedButton(
                                color: Colors.greenAccent[100],
                                shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new TonicaFundamental()));
                                },
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        "Tónica fundamental",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: RaisedButton(
                                color: Colors.greenAccent[100],
                                shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new TonicaDia()));
                                },
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        "Tónica del día",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: RaisedButton(
                                color: Colors.greenAccent[100],
                                shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new AcontecimientoDia()));
                                },
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        "Acontecimiento del día",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: RaisedButton(
                                color: Colors.greenAccent[100],
                                shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new CabalaAnio()));
                                },
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        "Cábala del año",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}

class UrgenciaInterior extends StatelessWidget {
  const UrgenciaInterior({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String t;
    int u = urgenciaInt();
    switch (u) {
      case 1:
        t = "TU NUMERO ES EL 1 \nEste número hace a la persona emprendedora, original, con voluntad.";
        break;
      case 2:
        t = "TU NUMERO ES EL 2 \nEste número hace a la persona sociable, con imaginación.";
        break;
      case 3:
        t = "TU NUMERO ES EL 3 \nEste número hace a la persona creativa, con arte y belleza.";
        break;
      case 4:
        t = "TU NUMERO ES EL 4 \nEste número hace a la persona firme, sólida.";
        break;
      case 5:
        t = "TU NUMERO ES EL 5 \nEste número hace a la persona razonativa, con rigor, propensa al aprendizaje.";
        break;
      case 6:
        t = "TU NUMERO ES EL 6 \nEste número hace a la persona cariñosa, indecisa.";
        break;
      case 7:
        t = "TU NUMERO ES EL 7 \nEste número hace a la persona tendiente a luchar.";
        break;
      case 8:
        t = "TU NUMERO ES EL 8 \nEste número hace a la persona paciente.";
        break;
      case 9:
        t = "TU NUMERO ES EL 9 \nEste número hace a la persona generosa, con ideas geniales, independiente.";
        break;
    }

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("URGENCIA INTERIOR"),
          backgroundColor: Colors.green[200],
        ),
        body: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/top_header.png'),
                  alignment: Alignment.topCenter),
            ),
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/read2.png'),
              alignment: Alignment.topCenter,
            )),
            padding: const EdgeInsets.all(40.0),
            child: new Center(
                child: SingleChildScrollView(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Center(
                    child: new Text(
                        "La urgencia interior, es cómo tendemos a ser, como un signo zodiacal, pero numérico",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            decorationThickness: 2.0,
                            decorationStyle: TextDecorationStyle.dashed)),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Text("$t",
                  textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                ])))));
  }
}

class TonicaFundamental extends StatelessWidget {
  const TonicaFundamental({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String txt;
    int t = tonicaF();
    switch (t) {
      case 1:
        txt =
            "TU NUMERO ES EL 1 \nEste número indica que la persona tiene que trabajar con mucha voluntad, con ideas originales, ser emprendedor.";
        break;
      case 2:
        txt =
            "TU NUMERO ES EL 2 \nEste número indica que la persona tiene que aprender a asociarse con los demás, escuchar opiniones contrarias sin enojarse, desarrollar la imaginación creadora.";
        break;
      case 3:
        txt =
            "TU NUMERO ES EL 3 \nEste número indica que la persona tiene que trabajar con arte y belleza en todo lo que haga, en el vestir, en el hablar.";
        break;
      case 4:
        txt =
            "TU NUMERO ES EL 4 \nEste número indica que la persona tiene que poner las bases firmes en sus proyectos y trabajos.";
        break;
      case 5:
        txt =
            "TU NUMERO ES EL 5 \nEste número indica que la persona tiene que ver el pro y el contra de todo lo que se proponga.";
        break;
      case 6:
        txt =
            "TU NUMERO ES EL 6 \nEste número indica que la persona tiene que ser decisivo y poner cariño a lo que haga.";
        break;
      case 7:
        txt =
            "TU NUMERO ES EL 7 \nEste número indica que la persona tiene que poner mucho empeño en todo lo que haga.";
        break;
      case 8:
        txt =
            "TU NUMERO ES EL 8 \nEste número indica que la persona tiene que ser muy paciente, saber esperar.";
        break;
      case 9:
        txt =
            "TU NUMERO ES EL 9 \nEste número indica que la persona tiene que ser generosa y genial, de preferencia trabajar independientemente.";
        break;
    }
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("TÓNICA FUNDAMENTAL"),
          backgroundColor: Colors.green[200],
        ),
        body: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/top_header.png'),
                  alignment: Alignment.topCenter),
            ),
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/read2.png'),
              alignment: Alignment.topCenter,
            )),
            padding: const EdgeInsets.all(40.0),
            child: new Center(
                child: SingleChildScrollView(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                  new Text(
                      "La tónica fundamental, es en lo que tenemos que trabajar para triunfar en la vida",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                  new Padding(padding: new EdgeInsets.all(20.0)),
                  new Text("$txt",
                  textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                ])))));
  }
}

class TonicaDia extends StatelessWidget {
  const TonicaDia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String t;
    int td = tonicaD();
    switch (td) {
      case 1:
        t = "TU NUMERO PARA HOY ES EL 1 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: trabajar con mucha voluntad, con ideas originales, ser emprendedor.";
        break;
      case 2:
        t = "TU NUMERO PARA HOY ES EL 2 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: aprender a asociarse con los demás, escuchar opiniones contrarias sin enojarse, desarrollar la imaginación creadora.";
        break;
      case 3:
        t = "TU NUMERO PARA HOY ES EL 3 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: trabajar con arte y belleza en todo lo que haga, en el vestir, en el hablar.";
        break;
      case 4:
        t = "TU NUMERO PARA HOY ES EL 4 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: poner las bases firmes en sus proyectos y trabajos.";
        break;
      case 5:
        t = "TU NUMERO PARA HOY ES EL 5 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: ver el pro y el contra de todo lo que se proponga.";
        break;
      case 6:
        t = "TU NUMERO PARA HOY ES EL 6 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: ser decisivo y poner cariño a lo que haga.";
        break;
      case 7:
        t = "TU NUMERO PARA HOY ES EL 7 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: poner mucho empeño en todo lo que haga.";
        break;
      case 8:
        t = "TU NUMERO PARA HOY ES EL 8 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: ser muy paciente, saber esperar.";
        break;
      case 9:
        t = "TU NUMERO PARA HOY ES EL 9 \nLo que indica que para tener más probabilidades de éxito en lo que uno se proponga, la persona en este día, habría que: ser generosa y genial, de preferencia trabajar independientemente.";
        break;
    }
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("TÓNICA DEL DÍA"),
          backgroundColor: Colors.green[200],
        ),
        body: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/top_header.png'),
                  alignment: Alignment.topCenter),
            ),
            foregroundDecoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/read2.png'),
              alignment: Alignment.topCenter,
            )),
            padding: const EdgeInsets.all(50.0),
            child: new Center(
                child: SingleChildScrollView(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                  new Text("Regencia del día de hoy:",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                  new Padding(padding: new EdgeInsets.all(20.0)),
                  new Text("$t",
                  textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                ])))));
  }
}

class AcontecimientoDia extends StatelessWidget {
  const AcontecimientoDia({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String t;
    int ad = acontecimientoD();
    switch (ad) {
      case 1:
        t = "TU NUMERO ES EL 1 \nEl día de hoy será para olvidarlo pronto. Se sentirá tan mal consigo mismo, inseguro y tan confuso, que no le apetecerá hacer nada ni ver a nadie. Mejor que no tome decisiones hoy, porque no puede pensar con claridad.";
        break;
      case 2:
        t = "TU NUMERO ES EL 2 \nHoy es un día especialmente marcado por las elecciones, las relaciones de pareja, el amor. Seguramente deberá tomar una decisión importante, la cual le costará de tomar, pero que en el fondo, el destino ya ha decidido por usted";
        break;
      case 3:
        t = "TU NUMERO ES EL 3 \nHoy se va a sentir fuerte, seguro y orgulloso de sí mismo, de lo que representa y de lo que ha conseguido en la vida. Hoy se va a sentir, en cierta manera, por encima de los demás, con poder, va a ser consciente de la posición social a la pertenece y de la que se siente orgulloso/a. ";
        break;
      case 4:
        t = "TU NUMERO ES EL 4 \nHoy es un día, para hacer balance de todo. Afrontará su día con seriedad y equilibrio, intentado decidirse y tomar decisiones importantes relativas a todos los aspectos de su vida.";
        break;
      case 5:
        t = "TU NUMERO ES EL 5 \nEn el día de hoy pueden aparecer cambios o un cambio importante en su vida. Este cambio no tiene porque ser negativo, sino todo lo contrario, puede ser un cambio positivo, que aportaría el nacimiento de nuevas relaciones, de nuevos trabajos, de forma de vida, una mudanza";
        break;
      case 6:
        t = "TU NUMERO ES EL 6 \nHoy va a tener un día fantástico, todo le va a salir bien, conseguirá todo lo que se proponga y con éxito, se sentirá feliz y bien dentro de su piel";
        break;
      case 7:
        t = "TU NUMERO ES EL 7 \nHoy es un día de esos, que uno hace balance y su subconsciente capta todo lo que no funciona o está fuera de lugar e intenta reconducirlo con mano izquierda, para que todo vuelva a estar en su sitio. ";
        break;
      case 8:
        t = "TU NUMERO ES EL 8 \nSerá un día armonioso y activo, sin estridencias, pero productivo. Va poder conjugar todos los aspectos de su vida fácilmente. ";
        break;
      case 9:
        t = "TU NUMERO ES EL 9 \nHoy es un día en el que puede pasar de todo y mucho. Un día ágil, en el que pueden pasarle cosas buenas y malas, según lo que toque, ya que el destino trae de todo. ";
        break;
    }
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("ACONTECIMIENTO DEL DÍA"),
          backgroundColor: Colors.green[200],
        ),
        body: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/top_header.png'),
                  alignment: Alignment.topCenter),
            ),
            padding: const EdgeInsets.all(50.0),
            child: new Center(
                child: SingleChildScrollView(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star, size: 50.0, color: Colors.white),
                  new Text(
                      "El acontecimiento del día define los acontecimientos mas importantes en el día",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                  new Padding(padding: new EdgeInsets.all(20.0)),
                  new Text("Hoy: $d /$m /$a  Hora: $hora : $minuto",
                      style: new TextStyle(
                          fontSize: 18.0,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Text("$t",
                  textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                ])))));
  }
}

class CabalaAnio extends StatelessWidget {
  const CabalaAnio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cabalaA();
    String primera = cabalaA();
    String segunda = cabalaA();
    String tercera = cabalaA();
    String cuarta = cabalaA();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("CÁBALA DEL AÑO"),
          backgroundColor: Colors.green[200],
        ),
        body: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/top_header.png'),
                  alignment: Alignment.topCenter),
            ),
            padding: const EdgeInsets.all(40.0),
            child: new Center(
                child: SingleChildScrollView(
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star, size: 50.0, color: Colors.white),
                  new Text(
                      "Durante la vida tenemos años espaciales relacionados con la ley de causa y efecto (Karma), dependerá de uno si el número nos favorezca o esté en contra de uno, por sus actos",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                  new Padding(padding: new EdgeInsets.all(20.0)),
                  new Text("$primera",
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                  new Text("$segunda",
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                  new Text("$tercera",
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                  new Text("$cuarta",
                      style: new TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 2.0,
                          decorationStyle: TextDecorationStyle.dashed)),
                ])))));
  }
}

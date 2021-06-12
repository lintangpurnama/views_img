import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "GRID dan HERO",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarSuperhero = List();

  var karakter = [
    {"nama": "Aquaman", "gambar": "Aquaman.jpg"},
    {"nama": "Batman", "gambar": "Batman.jpg"},
    {"nama": "Captain Amerika", "gambar": "Captain America.jpg"},
    {"nama": "Cat Woman", "gambar": "Cat Woman.jpeg"},
    {"nama": "The Flash", "gambar": "The Flash.jpg"},
    {"nama": "The Incredible Hulk", "gambar": "The Incredible Hulk.jpg"},
    {"nama": "Iron Man", "gambar": "Iron Man.jpg"},
    {"nama": "Spiderman", "gambar": "Spiderman.jpg"},
    {"nama": "Superman", "gambar": "Superman.jpg"},
    {"nama": "Venom", "gambar": "Venom.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final gambar = karakternya["gambar"];

      daftarSuperhero.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              new Hero(
                tag: karakternya["nama"],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new Detail(nama: karakternya['nama'], gambar: gambar),
                    )),
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                karakternya['nama'],
                style: new TextStyle(fontSize: 20.0),
              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Super Hero",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarSuperhero,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(
      children: <Widget>[
        new Container(
          height: 240.0,
          child: new Hero(
            tag: nama,
            child: new Material(
              child: new InkWell(
                child: new Image.asset("img/$gambar", fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        new BagianNama(
          nama: nama,
        ),
        new BagianIcon(),
        new Keterangan(),
      ],
    ));
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 40.0,
                color: Colors.yellow,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Icontext(icon: Icons.call, teks: "Call"),
          new Icontext(icon: Icons.message, teks: "Message"),
          new Icontext(icon: Icons.photo, teks: "Photo"),
        ],
      ),
    );
  }
}

class Icontext extends StatelessWidget {
  Icontext({this.icon, this.teks});
  final IconData icon;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(teks,
              style: new TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

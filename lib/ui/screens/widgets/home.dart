import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tpmobile/services/api_services.dart';

import '../../../models/film.dart';
import '../../../models/film_api.dart';
import '../../../models/movie.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Film>? _Film;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getFilm();

  }

  Future<void> getFilm() async {
    _Film = (await Film_api.getFilm()).cast<Film>();
    setState(() {
      _isLoading = false;
    });
    print(_Film);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff020202),
      appBar: AppBar(
        backgroundColor: const Color(0xff020202),
        leading: Image.asset('assets/netflix_logo_2.png'),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            color: Colors.red,
            child: _Film != null
                ? Image.network('${_Film  ['Poster']}')
                : Text('Aucune donnée'),
          ),
          const SizedBox(height: 15),
          Text(
            'Tendance Actuelle',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,

            ),
          ),
          const SizedBox(
            height: 5
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index ) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 110,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
          ),
          ),
          const SizedBox(height: 15),
          Text(
            'Actuellement au cinéma',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,

            ),
          ),
          const SizedBox(
              height: 5
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index ) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 220,
                  color: Colors.blue,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Bientot Disponible',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,

            ),
          ),
          const SizedBox(
              height: 5
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index ) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 110,
                  color: Colors.green,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

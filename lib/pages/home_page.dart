import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tf10p_0028_codigo_movieapp/models/movie_model.dart';
import 'package:tf10p_0028_codigo_movieapp/services/api_service.dart';
import 'package:tf10p_0028_codigo_movieapp/ui/general/colors.dart';
import 'package:tf10p_0028_codigo_movieapp/ui/widgets/item_movie_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> movies = [];

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    APIService _apiService = APIService();
    _apiService.getMovies().then((value) {
      movies = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome, Fiorella",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Discover",
                            style: TextStyle(
                                height: 1.25,
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xff3DDFB3),
                      radius: 30,
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      ),
                    ),
                  ],
                ),
                //Seccion de categorias

                //Seccion de listado de peliculas
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMovieWidget(
                      movieModel: movies[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

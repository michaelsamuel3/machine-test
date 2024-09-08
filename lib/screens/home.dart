// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest/screens/details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> superheroes = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    fetchsuperheroes();
  }

  Future<void> fetchsuperheroes() async {
    final response = await http.get(
        Uri.parse("https://protocoderspoint.com/jsondata/superheros.json"));
    if (response.statusCode == 200) {
      setState(() {
        superheroes = json.decode(response.body)['superheros'];
      });
    } else {
      throw Exception("failed to load");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 210, 221),
        title: Text(
          "home screen".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(superheroes));
              },
              icon: Icon(Icons.search_outlined,size: 30,))
        ],
      ),
      body: ListView.builder(
        itemCount: superheroes.length,
        itemBuilder: (context, index) {
          final superhero = superheroes[index];
          return ListTile(
            title: Container(
                height: 30,
                color: Color.fromARGB(255, 194, 211, 242),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    superhero["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            subtitle: Container(
                height: 130,
                color: const Color.fromARGB(255, 237, 228, 228),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(superhero["power"]),
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(superhero: superhero),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Search extends SearchDelegate {
  final List<dynamic> superheroes;

  Search(this.superheroes);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_outlined),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = superheroes
        .where((superhero) =>
            superhero["name"].toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final superhero = results[index];
        return ListTile(
          title: Text(
            superhero["name"],
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          subtitle: Text(superhero["power"],
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(superhero: superhero),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = superheroes
        .where((superhero) =>
            superhero['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final superhero = suggestions[index];
        return ListTile(
          title: Text(superhero['name']),
        );
      },
    );
  }
}

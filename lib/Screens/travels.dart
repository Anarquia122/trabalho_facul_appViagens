import 'package:app_viagens/model/travels_textSection.dart';
import 'package:app_viagens/model/travels_titleSection.dart';
import 'package:flutter/material.dart';

class Travels extends StatefulWidget {
  @override
  _TravelsState createState() => _TravelsState();
}

  class TravelLocation {
    final Widget titleSection;
    final String title;
    final String location;
    final String image;
    final Widget textSection;

    TravelLocation(this.titleSection, this.title, this.location, this.image, this.textSection);
  }
class _TravelsState extends State<Travels> {
  String searchQuery = '';

  // Modelo para representar um pacote de viagem

  // Lista de pacotes de viagem usando a nova classe TravelLocation
  List<TravelLocation> travelLocations = [
    TravelLocation(
      titleSection_Oeschinen,
      'Oeschinen Lake Campground',
      'Kandersteg, Switzerland',
      'assets/images/oeschinen-lake.jpg',
      textSection_Oeschinen,
    ),
    TravelLocation(
      titleSection_Disneyland,
      'Disneyland',
      'Anaheim, USA',
      'assets/images/disneyland.jpg',
      textSection_Disneyland,
    ),
    TravelLocation(
      titleSection_Maldivas,
      'Maldivas',
      'Maldives',
      'assets/images/maldivas.webp',
      textSection_Maldivas,
    ),
  ];

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Image imageTravel(String img) {
      return Image.asset(
        img,
        width: 600,
        height: 240,
        fit: BoxFit.cover,
      );
    }

    // Filtra a lista de pacotes de viagens com base na consulta de busca
    List<TravelLocation> filteredTravelLocations = travelLocations.where((pack) {
      final title = pack.title.toLowerCase();
      final location = pack.location.toLowerCase();
      final searchLower = searchQuery.toLowerCase();
      return title.contains(searchLower) || location.contains(searchLower);
    }).toList();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Barra de pesquisa
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            // Lista de pacotes de viagens filtrados
            Expanded(
              child: ListView(
                children: filteredTravelLocations.map((pack) {
                  return Column(
                    children: [
                      imageTravel(pack.image),
                      pack.titleSection,
                      buttonSection,
                      pack.textSection,
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

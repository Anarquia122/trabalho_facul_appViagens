import 'package:flutter/material.dart';
import 'dart:async';

// pacotes standart, premium e deluxe

class TravelPacks extends StatelessWidget {
  const TravelPacks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Packs',
      home: Packs(),
    );
  }
}

class Packs extends StatefulWidget {
  @override
  _PacksState createState() => _PacksState();
}

class _PacksState extends State<Packs> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _images = [
    'assets/images/oeschinen-lake.jpg',
    'assets/images/disneyland.jpg',
    'assets/images/maldivas.webp',
  ];

  final List<Map<String, String>> _packages = [
    {
      'title': 'Standart',
      'description':
          'Com o plano Standart você terá direito à: 1-Uma passagem só de ida para algum dos destinos desejados. 2-Hospedagem de uma noite em um hotel 0 estrelas.',
      'price': '10 Reais'
    },
    {
      'title': 'Premium',
      'description':
          'Com o plano Premium você terá direito à: 1-Passagem de ida e volta para o destino desejado. 2-Hospedagem de uma semana em um hotel 3 estrelas.',
      'price': '2.000 reais'
    },
    {
      'title': 'Deluxe',
      'description':
          'Com o plano Deluxe você terá direito à: 1-Passagens ilimitadas, passagens de primeira classe, para qualquer destino desejado. 2-Hospedagem ilimitada em hotéis 5 estrelas. 3-Furar a fila em qualquer lugar, seja no aeroporto, restaurantes, hospitais, cinemas etc. (esses benefícios terão a duração de 1 ano).',
      'price': '100.000 dólares (somente à vista)'
    }
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  colorBg(String title) {
    if (title == 'Premium') {
      return Colors.grey[400];
    } else if (title == 'Deluxe') {
      return Colors.yellow[600];
    } else {
      return Colors.white;
    }
  }

  Widget buildPackageCard(Map<String, String> package) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  color: colorBg(package['title']!),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            package['title']!,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              package['description']!,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(package['price']!),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ImageCarousel(
            pageController: _pageController,
            images: _images,
            currentPage: _currentPage,
          ),
          Column(
            children:
                _packages.map((package) => buildPackageCard(package)).toList(),
          )
        ],
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final PageController pageController;
  final List<String> images;
  final int currentPage;

  ImageCarousel({
    required this.pageController,
    required this.images,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 240,
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

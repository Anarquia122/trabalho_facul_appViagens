import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/app_logo.webp',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      'Boas vindas a app_agência. Estamos no mercado a mais de 5 horas! Somos uma agência brasileira com o objetivo de tornar viajens, ao redor do mundo, uma atividade acessível a todas as pessoas, com planos a partir de 10 reais!',
                      softWrap: true,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

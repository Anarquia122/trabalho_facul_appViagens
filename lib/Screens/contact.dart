import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Center(
                child: Column(
              children: [
                Text(
                  'Entre em contato',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Caso tenha interesse em adquirir algum dos nossos planos, escolha alguma das formas abaixo para entrar em contato.',
                  softWrap: true,
                )
              ],
            )),
            Container(
              margin: EdgeInsets.all(10),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.blue[900],
                    ),
                    Text(' +55 (11) 91234-5678')
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.green,
                    ),
                    Text(' 8765-4321')
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.red[600],
                    ),
                    Text(' app.viagens@email.com')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

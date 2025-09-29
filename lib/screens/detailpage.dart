import 'package:flutter/material.dart';
import 'package:latiankuis/models/movielist.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movieList[index].title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Table(
            columnWidths: {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: [
              TableRow(children: [
                Text('Judul', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(': ${movieList[index].title}'),
              ]),
              TableRow(children: [
                Text('Tahun', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(': ${movieList[index].year}'),
              ]),
              TableRow(children: [
                Text('Sinopsis', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(': ${movieList[index].synopsis}'),
              ]),
              TableRow(children: [
                Text('Genre', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(': ${movieList[index].genre}'),
              ]),
              TableRow(children: [
                Text('Sutradara', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(': ${movieList[index].director}'),
              ]),
              TableRow(children: [
                Text('Daftar Casts', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(': ${movieList[index].casts}'),
              ]),
              TableRow(children: [
                Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(': ${movieList[index].rating}'),
              ])
            ],
          ),
          TextButton(
            onPressed: () {
              launchurl();
            },
            child: Text("Buka Wikipedia"),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6, // 60% lebar layar
              child: Image.network(
                movieList[index].imgUrl,
                fit: BoxFit.contain, // biar proporsional
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> launchurl() async {
    final url = Uri.parse('${movieList[index].movieUrl}');

    if (await canLaunchUrl(url)) {
      //flutter pub add url_launcher di terminal
      await launchUrl(url);
    } else {
      throw 'rusak';
    }
  }
}

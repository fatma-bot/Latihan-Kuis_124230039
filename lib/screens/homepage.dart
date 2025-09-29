import 'package:flutter/material.dart';
import 'package:latiankuis/models/movielist.dart';
import 'package:latiankuis/screens/detailpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Column(
        children: [
          Text(
            'Daftar Film',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: const Color.fromARGB(255, 41, 15, 134),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //ini buat ngatur ada brp kolom
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return _moviecard(context, index);
                },
                itemCount: movieList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moviecard(context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(index: index);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio:
                      2 / 3, //initu buat perbandingan panjang lebar gambarnya
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      movieList[index].imgUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Text(
                movieList[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text("Tahun = ${movieList[index].year}"),
            ],
          ),
        ),
      ),
    );
  }
}

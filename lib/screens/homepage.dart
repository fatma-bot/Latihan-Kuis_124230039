import 'package:flutter/material.dart';
import 'package:latiankuis/models/movielist.dart';
import 'package:latiankuis/screens/detailpage.dart';
import 'package:latiankuis/screens/loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'Daftar Film',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 148, 127, 222),
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
          color: const Color.fromARGB(255, 169, 7, 48),
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



 // ini kalo pake listview
//  Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Movie App - ListView")),
//       body: ListView.builder(
//         itemCount: movieList.length,
//         itemBuilder: (context, index) {
//           final movie = movieList[index];
//           return Card(
//             child: ListTile(
//               leading: Image.network(movie.imgUrl, width: 60, fit: BoxFit.cover),
//               title: Text(movie.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: Text("Tahun: ${movie.year}"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => DetailPage(index: index),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
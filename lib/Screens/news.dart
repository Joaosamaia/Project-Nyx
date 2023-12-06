import 'package:flutter/material.dart';
import '../Models/models_news.dart';
import '../components/news_tile.dart';

class NewsPage extends StatelessWidget {
  final List<News> newsMenu = [
    News(
      title:
          "Mulher vítima de violência\ndoméstica liga para a polícia\nfingindo pedir hambúrguer\nem MG",
      descrition:
          "Vítima estaria sendo agredida e\nameaçada pelo marido há pelo\nmenos 14 anos; suspeito tentou\nresistir à prisão ",
      imagePath: "assets/images/Hamburguer.png",
    ),
    News(
      title:
          "Mulher vítima de violência\ndoméstica liga para a polícia\nfingindo pedir hambúrguer\nem MG",
      descrition:
          "Vítima estaria sendo agredida e\nameaçada pelo marido há pelo\nmenos 14 anos; suspeito tentou\nresistir à prisão ",
      imagePath: "assets/images/Hamburguer.png",
    ),
    News(
      title:
          "Mulher vítima de violência\ndoméstica liga para a polícia\nfingindo pedir hambúrguer\nem MG",
      descrition:
          "Vítima estaria sendo agredida e\nameaçada pelo marido há pelo\nmenos 14 anos; suspeito tentou\nresistir à prisão ",
      imagePath: "assets/images/Hamburguer.png",
    ),
    News(
      title:
          "Mulher vítima de violência\ndoméstica liga para a polícia\nfingindo pedir hambúrguer\nem MG",
      descrition:
          "Vítima estaria sendo agredida e\nameaçada pelo marido há pelo\nmenos 14 anos; suspeito tentou\nresistir à prisão ",
      imagePath: "assets/images/Hamburguer.png",
    ),
    News(
      title:
          "Mulher vítima de violência\ndoméstica liga para a polícia\nfingindo pedir hambúrguer\nem MG",
      descrition:
          "Vítima estaria sendo agredida e\nameaçada pelo marido há pelo\nmenos 14 anos; suspeito tentou\nresistir à prisão ",
      imagePath: "assets/images/Hamburguer.png",
    ),
  ];

  NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: newsMenu.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print(
                                "Card clicado: ${newsMenu[index].title}"); //alterar para tela de erro
                          },
                          child: NewsTile(news: newsMenu[index]),
                        )))
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onDoubleTap: () {
          Navigator.pushNamed(context, '/new');
        },
        onLongPress: () {
          sendWhatsapp();
        },
        child: FloatingActionButton(
          onPressed: () {},
          child: Image.asset(
            "assets/images/logoR.png",
            width: 1500.0,
            height: 1500.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        clipBehavior: Clip.antiAlias,
        color: Colors.black,
        height: 50,
        child: Container(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                iconSize: 30.0,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/map');
                },
              ),
              const SizedBox(width: 24.0),
              IconButton(
                icon: const Icon(
                  Icons.library_books,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/new');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _abrirLinkNoticia(BuildContext context, String link) async {
    String encodedLink = Uri.encodeFull(link);

    try {
      await launch(encodedLink);
    } catch (e) {
      print("Erro ao abrir o link: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível abrir o link da notícia.'),
        ),
      );
    }
  }
}

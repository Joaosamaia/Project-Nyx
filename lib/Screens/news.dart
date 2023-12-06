import 'package:flutter/material.dart';
import '../Models/models_news.dart';
import '../components/news_tile.dart';
import 'package:url_launcher/url_launcher.dart'
import '../Models/button.dart';

class NoticiasScreen extends StatelessWidget {
  final List<Noticia> noticias = [
    Noticia(
      titulo:
          "Mulher vítima de violência doméstica liga para a polícia fingindo pedir hambúrguer em MG",
      descricao:
          "Vítima estaria sendo agredida e ameaçada pelo marido há pelo menos 14 anos; suspeito tentou resistir à prisão",
      imagemUrl: "assets/images/Hamburguer.png",
      link:
          'https://noticias.r7.com/minas-gerais/mulher-que-sofria-violencia-domestica-liga-para-a-policia-fingindo-estar-pedindo-um-lanche-18072023',
    ),
    Noticia(
      titulo:
          "Violência doméstica, gravidez de gêmeos e cirurgias: como o seguro ampara a mulher?",
      descricao:
          "Já existem proteções para bolsa, perda de renda e suporte para implante de silicone",
      imagemUrl: "assets/images/noticia2.png",
      link:
          'https://www.infomoney.com.br/minhas-financas/violencia-domestica-gravidez-de-gemeos-e-cirurgias-como-o-seguro-ampara-a-mulher/',
    ),
    Noticia(
      titulo:
          "Meu Lar Protetivo: quase dois mil jovens recebem informações sobre violência doméstica em Criciúma por meio de programa do MPSC",
      descricao:
          "Já existem proteções para bolsa, perda de renda e suporte para implante de silicone",
      imagemUrl: "assets/images/noticia3.png",
      link:
          'https://www.mpsc.mp.br/noticias/meu-lar-protetivo-quase-dois-mil-jovens-recebem-informacoes-sobre-violencia-domestica-em-criciuma-por-meio-de-programa-do-mpsc',
    ),
    Noticia(
        titulo:
            "Naiara aparece com hematomas em entrevista após caso de violência doméstica",
        descricao:
            "Naiara Azevedo, 34, apareceu com hematomas nos braços e nas pernas na primeira entrevista exclusiva, que será exibida na noite deste domingo (3) no Fantástico (Globo).",
        imagemUrl: "assets/images/naiara.png",
        link:
            'https://www.uol.com.br/splash/noticias/2023/12/03/naiara-azevedo-participa-do-fantastico-apos-caso-de-violencia-domestica.htm'),
    Noticia(
        titulo:
            "Governo de SP lidera reunião sobre lei de auxílio às vítimas de violência doméstica",
        descricao:
            "Grupo de Trabalho Intersecretarial conduz estudos e diretrizes para que mulheres possam morar longe do agressor",
        imagemUrl: "assets/images/saoPaulo.png",
        link:
            'https://www.saopaulo.sp.gov.br/ultimas-noticias/governo-de-sp-lidera-reuniao-sobre-lei-de-auxilio-as-vitimas-de-violencia-domestica/'),
    Noticia(
        titulo:
            "Após caso Ana Hickmann, senadores querem criar CPI para combate à violência doméstica",
        descricao:
            "Comissão Parlamentar de Inquérito deve investigar falhas na rede de proteção da mulher, de acordo com a senadora Damares Alves",
        imagemUrl: "assets/images/anaHickman.png",
        link:
            'https://noticias.r7.com/brasilia/apos-caso-ana-hickmann-senadores-querem-criar-cpi-para-combate-a-violencia-domestica-05122023'),
  ];

  NoticiasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notícias"),
      ),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _abrirLinkNoticia(context, noticias[index].link);
            },
            child: NoticiaCard(noticia: noticias[index]),
          );
        },
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
                icon: const Icon(Icons.home, color: Colors.grey),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.of(context).pushNamed('/home1');
                },
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
                  color: Colors.white,
                ),
                iconSize: 30.0,
                onPressed: () {},
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

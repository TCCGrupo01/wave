import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeIndex = 0;
  int _selectedIndex = 0;
  final List<String> imgList = [
    'assets/images/banner_lanches.png',
    'assets/images/banner_lanches.png',
    'assets/images/banner_lanches.png',
    'assets/images/banner_lanches.png',
    'assets/images/banner_lanches.png',
    'assets/images/banner_lanches.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: stateManagement(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 229, 229, 229),
          selectedItemColor: Colors.blue,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Procurar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant), label: 'Cardápio'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  stateManagement() {
    switch (_selectedIndex) {
      case 0:
        return _home();
      case 1:
        return _procurar();
      case 2:
        return _cardapio();
      case 3:
        return _perfil();
      default:
        return _home();
    }
  }

  _home() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10.0, 48.0, 10.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            // É a primeira seção de produtos da página home.
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.black26,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/snacks.png'),
                      height: 70,
                      width: 107,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                      height:
                          6), // SizedBox é uma caixa usada para separar os elementos.
                  const Text(
                    'Snacks',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.black26,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/refeicao.png'),
                      height: 70,
                      width: 107,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Refeição',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.black26,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/lanches.png'),
                      height: 70,
                      width: 107,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Lanches',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          CarouselSlider(
              items: imgList
                  .map((e) => ClipRRect(
                          child: Stack(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.black26,
                            onTap: () {},
                            child: Ink.image(
                              image: AssetImage(e),
                              height: 178,
                              width: 330,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      )))
                  .toList(),
              options: CarouselOptions(
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                  autoPlay: true,
                  viewportFraction: 1)),
          const SizedBox(
            height: 32,
          ),
          Center(child: buildIndicator()),
          const SizedBox(
            height: 40,
          ),
          const Text("Famosos da cantina",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black;
                    }
                    return const Color.fromARGB(255, 4, 36, 116);
                  }),
                  overlayColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(0, 0, 0, 0))),
              child: const Text("Ver mais"),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.black26,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/strogonoff.png'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Strogonoff',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.black26,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/croissant.png'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Croissant',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.black26,
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage(
                          'assets/images/sanduiche_natural.png'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Sanduíche',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          InkWell(
            splashColor: Colors.black26,
            onTap: () {},
            child: Ink.image(
              image: const AssetImage('assets/images/banner_salgados.png'),
              height: 117,
              width: 334,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  _procurar() {
    return const Center(
      child: Text('Página em desenvolvimento.'),
    );
  }

  _cardapio() {
    return const Center(
      child: Text('Página em desenvolvimento.'),
    );
  }

  _perfil() {
    return const Center(
      child: Text('Página em desenvolvimento.'),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imgList.length,
        effect: const WormEffect(
          spacing: 16.0,
          dotHeight: 7,
          dotWidth: 7,
        ),
      );
}

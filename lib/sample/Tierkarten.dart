class TierInfo {
  final String name;
  final int alter;
  final String bildPfad;
  final String rasse;
  final String geschlecht;
  final String stubenrein;
  final String beschreibung;

  TierInfo({
    required this.name,
    required this.alter,
    required this.bildPfad,
    required this.rasse,
    required this.geschlecht,
    required this.stubenrein,
    required this.beschreibung,
  });
}

class Tierkarten extends StatefulWidget {
  @override
  _Tierkarten createState() => _Tierkarten();
}

class _Tierkarten extends State<Tierkarten> {
  int _currentIndex = 3;

  final List<TierInfo> tierInfos = [
    TierInfo(
        name: 'Bello',
        alter: 1,
        bildPfad: 'lib/images/Hund1Karte.png',
        rasse: 'Basenji',
        geschlecht: 'männlich',
        stubenrein: 'stubenrein',
        beschreibung:
            'Bello ist der perfekte Familienhund. Im Umgang und Kindern geübt und sehr gut erzogen. Er freundet sich schnell mit anderen Hunden an und würde sich sehr über eine liebe Pflegefamilie freuen!'),
    TierInfo(
        name: 'Luna',
        alter: 2,
        bildPfad: 'lib/images/Hund2Karte.png',
        rasse: 'Golden-Retriever',
        geschlecht: 'weiblich',
        stubenrein: 'stubenrein',
        beschreibung:
            'Luna ist zwei Jahre, ihre ausgeglichene Persönlichkeit ist sie ideal für Familien. Ihre gute Erziehung macht sie zu einem angenehmen Begleiter im Alltag. Luna wünscht sich sehnlichst eine Pflegefamilie!'),
    TierInfo(
        name: 'Elvis',
        alter: 2,
        bildPfad: 'lib/images/Hund3Karte.png',
        rasse: 'Havaneser',
        geschlecht: 'männlich',
        stubenrein: 'stubenrein',
        beschreibung:
            'Elvis ist ein Havanese von drei Jahren. Er ist vollständig stubenrein, was ihn zu einem angenehmen Mitbewohner macht. Elvis ist ein idealer Begleiter. Er ist bereit für eine Familie, die ihm viel Lieb bietet!'),
    TierInfo(
        name: 'Peter',
        alter: 2,
        bildPfad: 'lib/images/Hund4Karte.png',
        rasse: 'Malteser',
        geschlecht: 'männlich',
        stubenrein: 'stubenrein',
        beschreibung:
            'Peter ist ein entzückender, zweijähriger Malteser. Trotz seiner Jugend ist er vollständig stubenrein. Peter begeistert Kinder und Erwachsene gleichermaßen. Er wartet sehnsüchtig auf eine Familie!'),
    TierInfo(
        name: 'Tina',
        alter: 1,
        bildPfad: 'lib/images/Hund5Karte.png',
        rasse: 'Labrador',
        geschlecht: 'weiblich',
        stubenrein: 'stubenrein',
        beschreibung:
            'Tina, eine zweijährige Labrador-Hündin, liebt es zu spielen und zu lernen. Sie gewöhnt sich schnell an das Leben in ihrem neuen Zuhause. Tina ist auf der Suche nach einer liebevollen Familie!'),
  ];

  List<bool> isFavoriteList = [];

  @override
  void initState() {
    super.initState();
    isFavoriteList = List<bool>.filled(tierInfos.length, false);
  }

  Widget buildInfoContainer(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
        ),
      ),
    );
  }

  bool isFlipped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(bottom: 0),
          child: Image.asset(
            "lib/images/petstar.png",
            width: 100,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(178, 5, 34, 1),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 2) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (Route<dynamic> route) => false,
            );
          } else if (index == 0) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Favoriten(),
            ));
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriten',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Suche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: tierInfos.length,
          options: CarouselOptions(
            height: 700,
            enableInfiniteScroll: false,
            initialPage: 0,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
          itemBuilder: (context, index, realIndex) {
            if (index < isFavoriteList.length) {
              TierInfo info = tierInfos[index];
              return FlipCard(
                front: Card(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 330,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          child: Image.asset(
                            info.bildPfad,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            fontSize: 40,
                                            color:
                                                Color.fromRGBO(38, 17, 122, 1),
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: info.name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text: ', ${info.alter} Jahre'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Wrap(
                                        spacing: 8,
                                        children: [
                                          buildInfoContainer(
                                              info.rasse,
                                              Color.fromRGBO(244, 211, 160, 1),
                                              Color.fromRGBO(38, 17, 122, 1)),
                                          buildInfoContainer(
                                              info.geschlecht,
                                              Color.fromRGBO(215, 193, 251, 1),
                                              Color.fromRGBO(38, 17, 122, 1)),
                                          buildInfoContainer(
                                              info.stubenrein,
                                              Color.fromRGBO(253, 182, 195, 1),
                                              Color.fromRGBO(38, 17, 122, 1)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'lib/images/Skala.png',
                                  width: 130,
                                  height: 70,
                                ),
                                IconButton(
                                  icon: Icon(
                                    isFavoriteList[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                  ),
                                  color: isFavoriteList[index]
                                      ? Color.fromRGBO(178, 5, 34, 1)
                                      : Color.fromRGBO(38, 17, 122, 1),
                                  iconSize: 60,
                                  onPressed: () {
                                    setState(() {
                                      favoritenListe.add(info);
                                      // favoritenListe.removeAt(1)
                                      isFavoriteList[index] =
                                          !isFavoriteList[index];
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                back: Card(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 5),
                      SizedBox(
                        height: 290,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          child: Center(
                            child: Image.asset(
                              info.bildPfad,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 28,
                                    color: Color.fromRGBO(38, 17, 122, 1),
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: info.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ', ${info.alter} Jahre'),
                                  ],
                                ),
                              ),
                            ),
                            Image.asset(
                              'lib/images/Skala.png',
                              width: 100,
                              height: 70,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          tierInfos[index].beschreibung,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(38, 17, 122, 1),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromRGBO(178, 5, 34, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Melde dich bei ${tierInfos[index].name}!',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                isFavoriteList[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              color: isFavoriteList[index]
                                  ? Color.fromRGBO(178, 5, 34, 1)
                                  : Color.fromRGBO(38, 17, 122, 1),
                              iconSize: 62,
                              onPressed: () {
                                setState(() {
                                  isFavoriteList[index] =
                                      !isFavoriteList[index];
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

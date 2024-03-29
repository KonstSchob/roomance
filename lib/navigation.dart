import 'package:roomance/Seiten/Swipeseite/swipen.dart';
import 'package:roomance/Funktionsbausteine/import.dart';
import 'Seiten/Profilseite/pages/profile_page.dart';

// --- Code, um Navigation der Hauptseiten zu handeln ---

class BottomNavBar extends StatefulWidget {
  
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 2; // Swipe-Seite ist Standardseite

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color.fromARGB(
            71, 220, 193, 174), //leichter grauer Akzent mit Orangton
        shadowColor: Colors.black,
        elevation: 1,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            //Matches
            selectedIcon: GradientIcon(
              icon: Icons.done_all,
              gradient: LinearGradient(
                colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              size: 30,
              offset: Offset(0, 0),
            ),
            icon: Icon(
              Icons.done_all,
              size: 30,
            ),
            label: 'Matches',
          ),
          NavigationDestination(
            // Entdecken
            selectedIcon: GradientIcon(
              icon: Icons.dashboard_rounded,
              gradient: LinearGradient(
                colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              size: 30,
              offset: Offset(0, 0),
            ),
            icon: Icon(
              Icons.dashboard_rounded,
              size: 30,
            ),
            label: 'Entdecken',
          ),
          NavigationDestination(
            // Swipen
            selectedIcon: Image(
              image: AssetImage('assets/images/logoicon.png'),
              width: 50,
              height: 50,
            ),
            icon: ImageIcon(
              AssetImage('assets/images/logoicon.png'),
              size: 50,
            ),
            label: '',
          ),
          NavigationDestination(
            // Chat
            selectedIcon: Badge(
              label: Text('-1'), // Nicht weiter implementiert
              child: GradientIcon(
                icon: Icons.chat_bubble_rounded,
                gradient: LinearGradient(
                  colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                size: 30,
                offset: Offset(0, 0),
              ),
            ),
            icon: Badge(
              label: Text('-1'),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                size: 30,
              ),
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            // Profil
            selectedIcon: GradientIcon(
              icon: Icons.person,
              gradient: LinearGradient(
                colors: [Color(0xFFF24C3D), Color(0xFFFECB2D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              size: 30,
              offset: Offset(0, 0),
            ),
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            label: 'Profil',
          ),
        ],
      ),
      body: <Widget>[
        const Matches(),
        const Entdecken(),
        const Swipen(),
        const Chat(),
        const Profil(),
      ][currentPageIndex],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'character_list.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_3),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return const CharacterList();
              case 1:
                return const Center(
                  child: Text('Settings'),
                );
              default:
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
            }
          },
        );
      },
      //body: Builder(
      //  builder: (context) {
      //    switch (ref.watch(tabIndexProvider)) {
      //      case 0:
      //        return const CharacterList();
      //      case 1:
      //        return const Center(child: CircularProgressIndicator());
      //      default:
      //        return const Center(child: CircularProgressIndicator());
      //    }
      //  },
      //),
      //bottomNavigationBar: CupertinoTabBar(
      //  currentIndex: ref.watch(tabIndexProvider),
      //  items: const [
      //    BottomNavigationBarItem(
      //      icon: Icon(Icons.person),
      //      label: 'Characters',
      //    ),
      //    BottomNavigationBarItem(
      //      icon: Icon(Icons.settings),
      //      label: 'Settings',
      //    ),
      //  ],
      //  onTap: (index) {
      //    ref.read(tabIndexProvider.notifier).state = index;
      //  },
      //),
    );
  }
}

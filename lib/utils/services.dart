import 'package:flutter/material.dart';
import 'package:frontend_frenzy/pages/search_screen.dart';
import 'package:frontend_frenzy/utils/my_colors.dart';
import 'package:frontend_frenzy/utils/service_tile.dart';

class Services extends StatelessWidget {
  final String srvCategory; //Service Category
  const Services({super.key, required this.srvCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 2,
            iconTheme: const IconThemeData(color: white),
            backgroundColor: primary,
            title: Text(
              srvCategory,
              // style: txt.appBarTitle,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Search()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: white,
                    size: 28,
                  )),
            ],
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 5),
                    child: Row(
                      children: [
                        if (srvCategory == 'Popular Services')
                          const Text(
                            'Choose from the most Popular Dishes',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        else if (srvCategory == 'recommend')
                          const Text(
                            'Dishes catered according to your interests',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        else
                          Flexible(
                            child: Text(
                              'Look for the best Services under $srvCategory',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ServiceTile(
                  serviceID: '$index',
                  serviceTitle: 'Dish $index',
                  serviceDesc:
                      'Short Dish Description $index Short Dish Description',
                  uploadedBy: 'Restaurant Name $index',
                  serviceImage: 'assets/images/shop.jpg',
                  servicePrice: 1000 * index,
                  uploaderId: '$index',
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

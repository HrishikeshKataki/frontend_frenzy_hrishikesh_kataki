import 'package:flutter/material.dart';
import 'package:frontend_frenzy/pages/search_screen.dart';
import 'package:frontend_frenzy/utils/my_colors.dart';
import 'package:frontend_frenzy/utils/services.dart';
import 'package:frontend_frenzy/widgets/categories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(20),
              child: TextField(
                readOnly: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Search()),
                  );
                },
                style: const TextStyle(color: txt, fontSize: 16),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search for dishes or restaurants",
                  prefixIcon: const Icon(Icons.search, color: primary),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: primary),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Category(),
            sectionHeader('Popular Dishes', 'Explore top-rated options', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const Services(srvCategory: 'Popular Dishes'),
                ),
              );
            }),
            FeaturedSection(
              sectionTitle: 'Popular Dishes',
              services: [
                FeaturedHome(
                    srvTitle: 'Pizza Margherita',
                    srvImage: 'assets/images/pizza.jpg',
                    srvDescription: 'Classic and fresh!'),
                FeaturedHome(
                    srvTitle: 'Sushi Platter',
                    srvImage: 'assets/images/sushi.jpg',
                    srvDescription: 'A taste of Japan'),
              ],
            ),
            const SizedBox(height: 20),
            sectionHeader('Special Offers', 'Grab the deals!', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const Services(srvCategory: 'Special Offers'),
                ),
              );
            }),
            FeaturedSection(
              sectionTitle: 'Special Offers',
              services: [
                FeaturedHome(
                    srvTitle: 'Burger Combo',
                    srvImage: 'assets/images/burger.jpg',
                    srvDescription: '20% off'),
                FeaturedHome(
                    srvTitle: 'Pizza Special',
                    srvImage: 'assets/images/pizza.jpg',
                    srvDescription: '15% off'),
              ],
            ),
            const SizedBox(height: 20),
            sectionHeader('Recommended for You', 'Based on your taste', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const Services(srvCategory: 'Recommended for You'),
                ),
              );
            }),
            FeaturedSection(
              sectionTitle: 'Recommended for You',
              services: [
                FeaturedHome(
                    srvTitle: 'Sushi Wrap',
                    srvImage: 'assets/images/sushi.jpg',
                    srvDescription: 'Vegan-friendly'),
                FeaturedHome(
                    srvTitle: 'Burger',
                    srvImage: 'assets/images/burger.jpg',
                    srvDescription: 'Spicy & crispy'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Latest Food Trends',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: txt,
              ),
            ),
            const SizedBox(height: 10),
            NewsAndUpdatesSection(
              items: [
                NewsAndUpdateItem(
                  title: 'Healthy Eating',
                  description: 'Learn about our new healthy options',
                  imageAsset: 'assets/images/sushi.jpg',
                  bgColor: Colors.green.shade200,
                ),
                NewsAndUpdateItem(
                  title: 'Special Ingredients',
                  description: 'Fresh ingredients now in our dishes',
                  imageAsset: 'assets/images/pizza.jpg',
                  bgColor: Colors.orange.shade200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String title, String subtitle, VoidCallback onSeeMore) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'coda',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: txt,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: onSeeMore,
          child: const Text(
            'See More',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: primary,
            ),
          ),
        ),
      ],
    );
  }
}

class FeaturedHome {
  final String srvImage;
  final String srvTitle;
  final String srvDescription;

  FeaturedHome({
    required this.srvTitle,
    required this.srvImage,
    required this.srvDescription,
  });
}

class FeaturedSection extends StatelessWidget {
  final String sectionTitle;
  final List<FeaturedHome> services;

  const FeaturedSection({
    super.key,
    required this.sectionTitle,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          final FeaturedHome service = services[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Services(srvCategory: service.srvTitle),
              ),
            ),
            child: Card(
              surfaceTintColor: sbg,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          service.srvImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              service.srvTitle,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (service.srvDescription.isNotEmpty)
                              Text(
                                service.srvDescription,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewsAndUpdatesSection extends StatelessWidget {
  final List<NewsAndUpdateItem> items;

  const NewsAndUpdatesSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final NewsAndUpdateItem item = items[index];
          return NewsAndUpdateItemWidget(
            item: item,
          );
        },
      ),
    );
  }
}

class NewsAndUpdateItem {
  final String title;
  final String description;
  final String imageAsset;
  final Color bgColor;

  NewsAndUpdateItem({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.bgColor,
  });
}

class NewsAndUpdateItemWidget extends StatelessWidget {
  final NewsAndUpdateItem item;

  const NewsAndUpdateItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: item.bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                item.imageAsset,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

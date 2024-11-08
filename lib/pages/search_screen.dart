import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:frontend_frenzy/utils/my_colors.dart';

class FieldModel {
  String? service_title;
  String? freelancer_name;
  FieldModel(this.service_title, this.freelancer_name);
}

class Search extends StatefulWidget {
  static const routename = "search";

  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
// sample lists for filtering

  static List<FieldModel> main_field_list = [
    FieldModel("Pizza", "Mario's Pizzeria"),
    FieldModel("Sushi", "Tokyo Sushi House"),
    FieldModel("Burger", "Burger King"),
    FieldModel("Pasta", "Italian Bistro"),
    FieldModel("Salad", "Fresh Greens Cafe"),
    FieldModel("Tacos", "Taco Bell"),
    FieldModel("Ice Cream", "Sweet Treats"),
    FieldModel("Chinese Food", "Dragon Express"),
    FieldModel("Indian Curry", "Curry Palace"),
    FieldModel("Sandwich", "Deli Delight"),
    FieldModel("Fried Chicken", "Chick'n Shack"),
    FieldModel("Seafood", "Ocean's Catch"),
    FieldModel("Breakfast", "Morning Delights"),
    FieldModel("Desserts", "Sugar Rush"),
    FieldModel("Vegetarian Options", "Green Plate"),
    FieldModel("BBQ", "Smoky BBQ House"),
    FieldModel("Beverages", "Drink Station"),
    FieldModel("Smoothies", "Fruit Blast"),
    FieldModel("Wraps", "Wrap It Up"),
    FieldModel("Bakery", "Bakery Bliss"),
    FieldModel("Coffee", "Coffee Corner"),
    FieldModel("Donuts", "Doughnut Haven"),
    FieldModel("Catering", "Party Platters"),
    FieldModel("Meal Prep", "Healthy Eats"),
    FieldModel("Gourmet Meals", "Gourmet Kitchen"),
    FieldModel("Food Truck", "Street Eats"),
    FieldModel("Vegan Options", "Plant Power"),
    FieldModel("Gluten-Free Options", "Free From Foods"),
  ];
  List<FieldModel> display_list = List.from(main_field_list);
  void Updatelist(String value) {
// for filtering the list
    setState(() {
      display_list = main_field_list
          .where((element) => element.service_title!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 12),
            child: Row(
              children: [
                Text("Search for a Service",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: primary)),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextField(
              onChanged: (value) => Updatelist(value),
              style: const TextStyle(color: txt),
              decoration: InputDecoration(
                filled: true,
                fillColor: sbg,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                hintText: "Mobile Development",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: primary,
                suffixIcon: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    padding: const EdgeInsets.all(22),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.search,
                    color: white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: display_list.isEmpty
                ? const Center(
                    child: Text("No result found",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: display_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          //todo
                        },
                        child: ListTile(
                          title: Text(display_list[index].service_title!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text(display_list[index].freelancer_name!,
                              style: const TextStyle(
                                fontSize: 15,
                              )),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    ));
  }
}

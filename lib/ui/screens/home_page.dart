import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plants_model.dart';
import 'package:plant_app/ui/screens/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Plant> _plantList = Plant.plantList;
  //Plants category
  final List<String> _plantTypes = [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement',
  ];

  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(0.6),
                        ),
                        const Expanded(
                            child: TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                              hintText: "Search Plant",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        )),
                        Icon(
                          Icons.mic,
                          color: Colors.black54.withOpacity(0.6),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              width: size.width,
              child: ListView.builder(
                  itemCount: _plantTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          _plantTypes[index],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                              color: selectedIndex == index
                                  ? Constants.primaryColor
                                  : Constants.blackColor),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(plantId: _plantList[index].plantId ,),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                right: 20,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bool isFavoraited = toggleIsFavorated(
                                            _plantList[index].isFavorated);
                                        _plantList[index].isFavorated =
                                            isFavoraited;
                                      });
                                    },
                                    icon: Icon(
                                        _plantList[index].isFavorated == true
                                            ? Icons.favorite
                                            : Icons.favorite_border),
                                    color: Constants.primaryColor,
                                    iconSize: 20,
                                  ),
                                )),
                            Positioned(
                              top: 50,
                              bottom: 50,
                              left: 50,
                              right: 50,
                              child: Image.asset(_plantList[index].imageURL),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 20,
                              child: Column(
                                children: [
                                  Text(
                                    _plantList[index].category,
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                  Text(
                                    _plantList[index].plantName,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 20,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  r'$' + _plantList[index].price.toString(),
                                  style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                "New Plants",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * .5,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _plantList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(plantId: _plantList[index].plantId ,),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        height: 80,
                        width: size.width,
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Constants.primaryColor
                                          .withOpacity(0.8),
                                      shape: BoxShape.circle),
                                ),
                                Positioned(
                                    bottom: 5,
                                    left: 0,
                                    right: 0,
                                    child: SizedBox(
                                      height: 80,
                                      child: Image.asset(
                                          _plantList[index].imageURL),
                                    )),
                                Positioned(
                                    bottom: 5,
                                    left: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(_plantList[index].category),
                                        Text(
                                          _plantList[index].plantName,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Constants.blackColor),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                r'$' + _plantList[index].price.toString(),
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

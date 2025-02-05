import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plants_model.dart';
import 'package:plant_app/ui/screens/detail_page.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;

  FavoritePage({required this.favoritedPlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.favoritedPlants.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset("assets/images/favorited.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your Favorited Plants",
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    )
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: widget.favoritedPlants.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: DetailPage(
                                    plantId:
                                        widget.favoritedPlants[index].plantId,
                                  ),
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
                                        child: Image.asset(widget
                                            .favoritedPlants[index].imageURL),
                                      )),
                                  Positioned(
                                      bottom: 5,
                                      left: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(widget
                                              .favoritedPlants[index].category),
                                          Text(
                                            widget.favoritedPlants[index]
                                                .plantName,
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
                                  r'$' +
                                      widget.favoritedPlants[index].price
                                          .toString(),
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
              ));
  
  }
}

import 'package:flutter/material.dart';

import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plants_model.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  DetailPage({required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint("Favorite");
                    },
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              bool isFavorited = toggleIsFavorated(
                                  _plantList[widget.plantId].isFavorated);
                              _plantList[widget.plantId].isFavorated =
                                  isFavorited;
                            });
                          },
                          icon: Icon(
                            _plantList[widget.plantId].isFavorated == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Constants.primaryColor,
                          ),
                        )),
                  ),
                ],
              )),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.8,
                padding: EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                        top: 10,
                        left: 0,
                        child: SizedBox(
                          height: 350,
                          child:
                              Image.asset(_plantList[widget.plantId].imageURL),
                        )),
                    Positioned(
                        top: 10,
                        right: 0,
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlantFeature(
                                  title: "Size",
                                  planFeature: _plantList[widget.plantId].size),
                              PlantFeature(
                                  title: "Humidity",
                                  planFeature: _plantList[widget.plantId]
                                      .humidity
                                      .toString()),
                              PlantFeature(
                                  title: "Temperature",
                                  planFeature:
                                      _plantList[widget.plantId].temperature),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantId].plantName,
                            style: TextStyle(
                                fontSize: 30,
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'$' + _plantList[widget.plantId].price.toString(),
                            style: TextStyle(
                                fontSize: 24,
                                color: Constants.blackColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plantList[widget.plantId].rating.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Constants.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.primaryColor,
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: Text(
                    _plantList[widget.plantId].decription,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 18,
                        color: Constants.blackColor.withOpacity(0.7)),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: size.width * .9,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(0.3)),
                  ]),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      bool isSelected = toggleIsSelected(
                          _plantList[widget.plantId].isSelected);

                      _plantList[widget.plantId].isSelected = isSelected;
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: _plantList[widget.plantId].isSelected == true
                        ? Colors.white
                        : Constants.primaryColor,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(0.3)),
                  ]),
              child: const Center(
                child: Text(
                  'BUY NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String title;
  final String planFeature;
  PlantFeature({required this.title, required this.planFeature});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor),
        ),
        Text(
          planFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

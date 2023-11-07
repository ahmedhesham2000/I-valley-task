import 'package:flutter/material.dart';
import 'package:untitled4/core/constants.dart';
import 'package:untitled4/core/size_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDetailsWidget extends StatelessWidget {
    String model;
    String year;
    double price;
    String hours;
    String name;
    String city;
    String image;
    String? categoryType;
    String phoneNumber;
   CarDetailsWidget({super.key, required this.name,required this.price,
     required this.city,
     required this.model,
      required this.hours,
     required this.year,
     required this.image,
     required this.phoneNumber,
     this.categoryType
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
            offset:
            const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                         IconButton(
                           onPressed: () async{
                             final url = 'tel:$phoneNumber';
                             if (await canLaunch(url)) {
                             await launch(url);
                             } else {
                             throw 'Could not launch $url';
                             }
                           },
                           icon: const Icon(  Icons.phone,
                             color: Colors.black,),

                        ),
                        Text(
                          '$model-$year',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                      text: '$price ',
                      style:const TextStyle(
                        fontSize: 15,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),

                      children: const <TextSpan>[
                        TextSpan(
                            text: '(بعد الضريبه)', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
                      ],
                    ),),

                    SizedBox(
                      height: 5.h,
                    ),

                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    categoryType!=null?Text(
                      "  السياره: $name ${categoryType!}",
                      textDirection:TextDirection.rtl ,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ):Container(),
                    year.isNotEmpty?Text(
                      "  موديل: $year",
                      textDirection:TextDirection.rtl ,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ):Container(),

                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              hours,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Container(
                              color: Colors.grey,
                              height: 20.h,
                              width: 1.5.h,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              city,
                              style:
                              const TextStyle(
                                fontSize: 15,
                                color: Color(0xff3f50b5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.redAccent,
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                    image: NetworkImage(
                    baseUrl+image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // width: 500.v,
    );
  }
}

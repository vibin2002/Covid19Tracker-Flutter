import 'package:flutter/material.dart';
import 'package:flutter_app/data_source.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FAQs" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                Icon(Icons.arrow_forward,color: Colors.white,)
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
          //   padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
          //   color: primaryBlack,
          //   child: Row(
          //     children: [
          //       Text("Donate" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          //       Icon(Icons.arrow_forward,color: Colors.white,)
          //     ],
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
          //   padding: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
          //   color: primaryBlack,
          //   child: Row(
          //     children: [
          //       Text("FAQs" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          //       Icon(Icons.arrow_forward,color: Colors.white,)
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

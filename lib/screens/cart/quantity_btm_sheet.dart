import 'dart:developer';

import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),

        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
                color:Colors.grey
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        Expanded(child: ListView.builder(
            itemCount: 25,
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  log("index $index");
                  },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SubTitleTextWidget(label: "${index +1}"),
                  ),
                ),
                
              );


            }
        )
        )
      ],
    );
  }
}

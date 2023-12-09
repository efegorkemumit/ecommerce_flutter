import 'package:ecommerce_flutter/widgets/subtitle_text.dart';
import 'package:ecommerce_flutter/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top:BorderSide(width: 1, color : Colors.red),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:SizedBox(
          height: kBottomNavigationBarHeight +10,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FittedBox(
                    child: TitleTextWidget(label: "Total (6 Product/ 9 Items)")),
                  SubTitleTextWidget(label: " \$ 16.00", color: Colors.red,)
                ],
                
              ),
              ),
              ElevatedButton(onPressed: (){}, child: const Text("Checkout"))
            ],
          ),

        )
      ),
    );
  }
}

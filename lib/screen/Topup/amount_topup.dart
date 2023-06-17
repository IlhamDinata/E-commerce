import 'package:flutter/material.dart';
import 'package:Ecommerce/utils/mycolors.dart';

class AmountWidgets extends StatelessWidget {
  final String amount;
  final String grandTotal;
  final String selected;

  AmountWidgets({
    required this.amount,
    required this.grandTotal,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color:
                selected == 'selected' ? mycolors.purple : Colors.transparent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${amount}',
                style: mycolors().semibold.copyWith(
                      fontSize: 16,
                    ),
              ),
              Text(
                'Rp. ${grandTotal}',
                style: mycolors().semibold.copyWith(
                      fontSize: 15,
                      color: mycolors.purple,
                    ),
              )
            ],
          ),
          Text(
            'Expanded on 10 Days',
            style: mycolors().regular.copyWith(
                  fontSize: 12,
                  color: mycolors.grey,
                ),
          )
        ],
      ),
    );
  }
}

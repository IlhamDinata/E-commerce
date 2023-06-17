import 'package:Ecommerce/controller/cart_controller.dart';
import 'package:Ecommerce/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ecommerce/utils/mycolors.dart';

import '../utils/pages.dart';

// class CartTotal extends StatelessWidget {
// final CartController controller = Get.find();
//   CartTotal({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 75),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Total',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               '\$${controller.total}',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),

//     );

//   }
// }

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: mycolors().semibold.copyWith(
                        fontSize: 14,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 28,
                      width: 45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/visa.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      '. . . .  . . . .  . . . .  1234',
                      style: mycolors().semibold.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Promo Code',
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: mycolors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Promo Code',
                        hintStyle: mycolors().regular.copyWith(
                              fontSize: 12,
                              color: mycolors.grey,
                            )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Payment Summary',
                  style: mycolors().semibold.copyWith(fontSize: 14),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Up',
                      style: mycolors()
                          .regular
                          .copyWith(fontSize: 12, color: mycolors.grey),
                    ),
                    Text(
                      '\$${controller.total}',
                      style: mycolors().semibold.copyWith(fontSize: 14),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Admin Fee',
                      style: mycolors()
                          .regular
                          .copyWith(fontSize: 12, color: mycolors.grey),
                    ),
                    Text(
                      '\$${controller.adminFee}',
                      style: mycolors().semibold.copyWith(fontSize: 14),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: mycolors()
                          .semibold
                          .copyWith(fontSize: 14, color: mycolors.purple),
                    ),
                    Text(
                      '\$${controller.finalTotal}',
                      style: mycolors().semibold.copyWith(
                            fontSize: 14,
                            color: mycolors.purple,
                          ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(PagesPath.topuptransactionsuccess);
                  },
                  child: ButtonWidget(
                    label: 'Click To Pay',
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

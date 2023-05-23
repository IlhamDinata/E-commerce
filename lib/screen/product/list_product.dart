import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/product/detail_product.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        id: 1,
        name: 'Bola',
        price: 10.00,
        imageUrl: 'assets/testproduct1.png',
        description: 'Bola sepak'),
    Product(
        id: 2,
        name: 'SSD',
        price: 20.00,
        imageUrl: 'assets/testproduct2.png',
        description:
            'Lorem ipsum dolor sit amet. Id nulla facilis At praesentium modi est asperiores animi nam tempora omnis sit culpa quia. Et rerum natus et nobis recusandae aut voluptatem laudantium sit magnam rerum et mollitia voluptatem. Est magnam fuga aut laborum quia qui veniam eligendi aut omnis laborum. 33 facere velit aut cumque adipisci sed molestiae optio et voluptas ullam et iure iusto est eaque ipsa qui atque sunt. Cum ipsa voluptatem et illum laborum est voluptatem voluptatem. Qui tenetur quia est omnis accusantium sed mollitia iste et nemo esse aut quia nulla sed exercitationem dolorum quo fuga ipsam. Et earum cumque a quia esse ea placeat accusantium id eius distinctio et veritatis alias eos incidunt sint.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: Image.asset(products[index].imageUrl),
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailPage(products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/data/product_data.dart';

class ProductDetailsScreen extends StatefulWidget {

  final ProductData product;

  ProductDetailsScreen(this.product);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState(product);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ProductData product;

  String size;

  _ProductDetailsScreenState(this.product);

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) {
                return Image.network(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: primaryColor,
              dotColor: Colors.grey,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(product.title,
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  maxLines: 3,
                ),
                Text("R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor
                  ),
                ),
                SizedBox(height: 16),
                Text("Tamanho",
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5
                    ),
                    children: product.sizes.map((size) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (this.size != size) {
                              this.size = size;
                            } else {
                              this.size = null;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                              color: this.size == size ? primaryColor : Colors.grey[500],
                              width: 3
                            )
                          ),
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(size),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: this.size != null ? () {

                    } : null,
                    child: Text("Adicionar ao Carrinho", style: TextStyle(fontSize: 18)),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text("Descrição",
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(product.description, style: TextStyle(
                  fontSize: 16
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:firstproject/adminpanel/adminmodel/product_model.dart';
import 'package:firstproject/adminpanel/adminproduct/productedit.dart';
import 'package:firstproject/adminpanel/adminproduct/productlist_extract.dart';
import 'package:firstproject/funtions/dbfunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  dbhelper dbh = dbhelper();
  @override
  void initState() {
    super.initState();
    dbh.getall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 208, 137, 132),
        ),
        body: ValueListenableBuilder(
          valueListenable: productlist,
          builder: (context, List<Addproduct> addlist, Widget? child) {
            return ListView.builder(
              itemCount: addlist.length,
              itemBuilder: (context, index){
                final product =addlist[index];
              final imagePath = product.image;
                
              return Padding(
                padding: EdgeInsets.all(8),
                child: Slidable(
                  startActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        label: 'Delete',
                        autoClose: true,
                        icon: Icons.delete,
                        onPressed: (context) {
                          dbh.delete(product.id!);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProductList()));
                        },
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.green,
                        label: 'Edit',
                        icon: FontAwesomeIcons.edit,
                        autoClose: true,
                        onPressed: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductEdit(
                                  product: product,
                                index: index,
                                id: product.id!,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                   child: SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Stack(
                      children: [
                        productlistimage(imagePath: imagePath),
                        productlistname(product: product),
                        productlistprize(product: product),
                        productlistdiscount(product: product),
                      ],
                    ),
                  ),
                ),
              );
              },
            );
          },
        ));
  }
}

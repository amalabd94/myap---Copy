import 'package:flutter/material.dart';
import 'package:myap/models/product.dart';
import 'package:myap/viewmodels/products_vm.dart';
import 'package:myap/views/details_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsVM pVM=ProductsVM();
  IconData fav=Icons.favorite_border;
  late List<Product> allProducts;
  @override
  void initState() {
    // TODO: implement initState
    allProducts=pVM.loadAllProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/cart",arguments: ProductsVM.cartItems);
            },
            child: Container(
              child: Badge(child: Icon(Icons.shopping_cart),label: Text("${ProductsVM.cartItems.length}")),
              margin: EdgeInsets.only(top: 10,right: 10),),
          ),

        ],
        title: Text("Home Screen"),
      ),
      body:ListView.builder(
          itemCount: allProducts.length,
          itemBuilder: (ctx,index){
            return
              InkWell(
                onTap: (){

                  Navigator.pushNamed(context, "/details",arguments: allProducts[index]);
                 // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(),settings: RouteSettings(arguments: allProducts[index])));
                },
                child: Card(

                child: Column(children: [
                Stack(
                  children: [
                    Image.network(allProducts[index].image),
                    IconButton(onPressed: (){
                      allProducts[index].isFar=!allProducts[index].isFar?true:false;
                      setState(() {

                      });
                    }, icon: Icon(allProducts[index].isFar?Icons.favorite:Icons.favorite_border,color: Colors.red,))
                  ],
                ),
                             // Image.network("https://storage.googleapis.com/pod_public/1300/168838.jpg"),
                ListTile(
                  leading: InkWell(onTap: (){
                    ProductsVM.addToCart(p: allProducts[index]);
                    setState(() {

                    });
                    print("the length is ${ProductsVM.cartItems.length}");

                  },child: Icon(Icons.add_shopping_cart),),

                  subtitle: Text(allProducts[index].brand),
                  title: Text(allProducts[index].name),trailing: Text("${allProducts[index].price}"),)
                            ],),),
              );
          })

    );
  }
}

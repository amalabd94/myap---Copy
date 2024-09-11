import 'package:myap/data/products_db.dart';
import 'package:myap/models/product.dart';
//وسيط بين  "views"و"model "
class ProductsVM{

  static List<Map<Product,int>>cartItems=[];
  //دالة اضافة للسله"addToCart" تحمل اثنين بارمترات
  static addToCart({required Product p,int qty=1}){
    //لاضافة العناصر على شكل ماب في القائمة
    Map<Product,int> item=Map();
    item[p]=qty;
    cartItems.add(item);
  }
  List<Product>loadAllProducts(){
    ProductsDb db=ProductsDb();
    //تولد قائمة من المنتجات+
    //اي تاخد كل ماب فيها منتج واحد وترجعة على شكل كائن اي"Product"
    //e  الاولى عبارة غن الماب واحدة
    //e عبارة عن كائن من المنتجات
      return db.select().map((e)=>Product.fromMap(e)).toList();

  }
}
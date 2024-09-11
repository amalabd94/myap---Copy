import 'package:myap/models/delivery.dart';

class DeliveryVm {
  List<Delivery> loadTime() {
    return ([
      Delivery(name: "Eveing", value: "ev"),
       Delivery(name: "Moring", value: "mr"),
        Delivery(name: "afternoon", value: "af"),
        
    ]);
  }
}

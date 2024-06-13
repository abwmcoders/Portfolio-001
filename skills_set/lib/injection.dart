import 'package:locator/locator.dart';
import 'package:skills_set/services/implementation/impl_contact_service.dart';


import 'domain/contact_viewmodel.dart';

const locator = Locator();
class Injection{
  static void setUp(){
    locator.put(ImplContactService());
    locator.put(ContactViewModel(service: locator.get<ImplContactService>()));
  }
}
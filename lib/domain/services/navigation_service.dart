
import 'package:flash/domain/routes/routes_services.dart';
import 'package:flash/domain/services/setup_service.dart';


class Nav {
  static NavigationService navigationService =
      SetupService.locator<NavigationService>();

  // static openSubscriptionWidget() {
  //   Navigator.restorablePush<void>(
  //       context!, RevenueController.openSubscriptionWidget);
  // }

}

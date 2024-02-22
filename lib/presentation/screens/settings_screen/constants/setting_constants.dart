// import 'package:crypto_wallet/data/remote/models/balance_model.dart';
// import 'package:crypto_wallet/data/remote/services/auth/auth_service.dart';
// import 'package:crypto_wallet/presentation/controllers/loading_controller.dart';
// import 'package:crypto_wallet/presentation/controllers/update_controller.dart';
// import 'package:crypto_wallet/presentation/screens/home_screens/controllers/balance_controller.dart';
// import 'package:crypto_wallet/presentation/widgets/dialogs/models/action_model.dart';

// class SettingConstants {
//   static List<ActionModel> listButton(List<DataCurrencyList> currencyList,
//       BalanceController balanceController) {
//     return List.generate(
//       currencyList.length,
//       (index) => ActionModel(
//           onTap: () async =>
//               balanceController.saveDataCurrencyList(currencyList[index]),
//           text: currencyList[index].name.toUpperCase()),
//     )
//   }

//   static List<ActionModel> logout(LoadingController loadingController,
//       UpdateController updateController, localizations) {
//     return [
//       ActionModel(
//           onTap: () async =>
//               await AuthService.logout(loadingController, updateController),
//           text: localizations.s0043),
//     ];
//   }

//   static List<ActionModel> deleteAccount(LoadingController loadingController,
//       UpdateController updateController, localizations) {
//     return [
//       ActionModel(
//           onTap: () async =>
//               await AuthService.logout(loadingController, updateController),
//           text: localizations.s0044),
//     ];
//   }
// }

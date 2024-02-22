// import 'package:flash/l10n/l10n.dart';
// import 'package:flash/l10n/local.dart';
// import 'package:flash/presentation/screens/settings_screen/controller/settings_controller.dart';
// import 'package:flutter/material.dart';

// class SettingScreen extends StatelessWidget {
//   const SettingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //
//     final localizations = S.string(context);

//     final settingsController = context.watch<SettingsController>();
//     Locale myLocale = Localizations.localeOf(context);
//     final getLang = L10n.getLang(myLocale.toString());
//     return DetailsTemplate(
//       title: localizations.title01,
//       body: ListView(
//         physics: const ClampingScrollPhysics(),
//         shrinkWrap: true,
//         children: [
//           _SettingsButton(
//             onTap: () async => await ModalPopupWidget.showNotitification(
//                 context,
//                 localizations.s0041,
//                 Text(
//                   localizations.s0049,
//                   style: ThemesFonts.small(),
//                 ),
//                 listButton),
//             icon: CupertinoIcons.money_dollar,
//             title: localizations.s0041,
//             widget: Text(
//               dataCurrencyList.name.toUpperCase(),
//               style: ThemesFonts.small(),
//             ),
//           ),
//           _SettingsButton(
//             onTap: () async => await ModalPopupWidget.showNotitification(
//                 context,
//                 localizations.s0042,
//                 Text(
//                   localizations.s0069,
//                   style: ThemesFonts.small(),
//                 ),
//                 List<ActionModel>.generate(
//                     L10n.all.length,
//                     (index) => ActionModel(
//                         onTap: () async =>
//                             await settingsController.setLang(index),
//                         text: L10n.getLang(L10n.all[index].toString())))),
//             icon: CupertinoIcons.globe,
//             title: localizations.s0042,
//             widget: Text(
//               getLang,
//               style: ThemesFonts.small(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16, bottom: 16),
//             child: Text(
//               localizations.s0047,
//               style: ThemesFonts.bodyMediumBold(),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           _SettingsButton(
//             onTap: () async =>
//                 await launchUrlString('mailto:walletmanagerbtc@gmail.com'),
//             icon: CupertinoIcons.mail,
//             title: localizations.s0048,
//             widget: const Icon(
//               CupertinoIcons.right_chevron,
//               color: ThemesColors.black,
//             ),
//           ),
//           _SettingsButton(
//             onTap: () async =>
//                 await launchUrlString('https://t.me/kupit_bitkoin_bitcoin'),
//             icon: CupertinoIcons.airplane,
//             title: 'Telegram',
//             widget: const Icon(
//               CupertinoIcons.right_chevron,
//               color: ThemesColors.black,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 16, bottom: 16),
//             child: Text(
//               localizations.s0046,
//               style: ThemesFonts.bodyMediumBold(),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           _SettingsButton(
//             onTap: () async => await ModalPopupWidget.showNotitification(
//                 context,
//                 localizations.s0070,
//                 Text(
//                   localizations.s0071,
//                   style: ThemesFonts.small(),
//                 ),
//                 [
//                   ActionModel(
//                       onTap: () async {
//                         final encoded = await DataBaseService.read('auth');
//                         final eMnemonic = encoded['mnemonic'];
//                         List<int> credentials = base64.decode(eMnemonic);
//                         String fromCharCodes =
//                             String.fromCharCodes(credentials);
//                         final key = dotenv.env['APIKEY'] ?? '';
//                         final mnemonic = decryptAESCryptoJS(fromCharCodes, key);

//                         Nav.navigationService.goBack();
//                         // ignore: use_build_context_synchronously
//                         Tools.clipboard(context, mnemonic);
//                       },
//                       text: localizations.s0056),
//                 ]),
//             icon: CupertinoIcons.person,
//             title: localizations.s0068,
//             // widget: const Icon(
//             //   CupertinoIcons.right_chevron,
//             //   color: ThemesColors.black,
//             // ),
//           ),
//           _SettingsButton(
//             onTap: () async => await ModalPopupWidget.showNotitification(
//                 context,
//                 localizations.s0043,
//                 Text(
//                   localizations.s0050,
//                   style: ThemesFonts.small(),
//                 ),
//                 logoutButton),
//             icon: CupertinoIcons.square_arrow_right,
//             title: localizations.s0043,
//             // widget: const Icon(
//             //   CupertinoIcons.right_chevron,
//             //   color: ThemesColors.black,
//             // ),
//           ),
//           _SettingsButton(
//             onTap: () async => await ModalPopupWidget.showNotitification(
//                 context,
//                 localizations.s0044,
//                 Text(
//                   localizations.s0051,
//                   style: ThemesFonts.small(),
//                 ),
//                 deleteAccount),
//             color: ThemesColors.error,
//             icon: CupertinoIcons.delete,
//             title: localizations.s0044,
//             // widget: const Icon(
//             //   CupertinoIcons.right_chevron,
//             //   color: ThemesColors.error,
//             // ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SettingsButton extends StatelessWidget {
//   const _SettingsButton(
//       {required this.title,
//       this.widget,
//       this.onTap,
//       this.icon,
//       this.color = ThemesColors.black});
//   final String title;
//   final Widget? widget;
//   final void Function()? onTap;
//   final IconData? icon;
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     final titleWidget = Text(
//       title,
//       style: ThemesFonts.smallBold(color: color),
//     );
//     return CupertinoButton(
//       padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
//       onPressed: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               if (icon != null)
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 4),
//                       child: Icon(
//                         icon,
//                         color: color,
//                       ),
//                     ),
//                     titleWidget
//                   ],
//                 ),
//               if (icon == null) titleWidget,
//               if (widget != null) widget!,
//             ],
//           ),
//           const Divider()
//         ],
//       ),
//     );
//   }
// }

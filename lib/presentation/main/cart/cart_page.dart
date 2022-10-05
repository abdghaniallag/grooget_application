import 'package:flutter/material.dart';

import '../../../app/di.dart';
import 'cart_page_viewmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartPageViewModel _viewModel = instance<CartPageViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }

//   Widget _getContentWidgets() {
//     return StreamBuilder<AcountInformation>(
//         stream: _viewModel.outputHome,
//         builder: (context, snapshot) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _getUserInfo(snapshot.data),
//               // _getBannersCarousel(snapshot.data?.banners),
//               // _getSection(AppStrings.services),
//               // _getServices(snapshot.data?.services),
//               // _getSection(AppStrings.stories),
//               // _getStores(snapshot.data?.stores)
//             ],
//           );
//         });
//   }

//   Widget _getSection(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(
//           top: AppPadding.p12,
//           left: AppPadding.p12,
//           right: AppPadding.p12,
//           bottom: AppPadding.p2),
//       child: Text(
//         title,
//         style: Theme.of(context).textTheme.headline3,
//       ),
//     );
//   }

//   Widget _getUserInfo(AcountInformation? acount) {
//     if (acount == null) {
//       return Column();
//     } else {
//       return Column(
//         children: [
//           const Text("gthhtfhgho8iukgbikumgjb"),
//           Text(acount.psdata?.firstname.toString() ?? EMPTY),
//           Text(acount.psdata?.lastname.toString() ?? EMPTY),
//           Text(acount.psdata?.id.toString() ?? EMPTY),
//           Text(acount.psdata?.email.toString() ?? EMPTY),
//           Text(acount.psdata?.birthday.toString() ?? EMPTY),
//           Text(acount.psdata?.logged.toString() ?? EMPTY),
//           Text(acount.psdata?.firstname.toString() ?? EMPTY),
//           Text(acount.psdata?.firstname.toString() ?? EMPTY),
//           Text(acount.psdata?.firstname.toString() ?? EMPTY),
//         ],
//       );
//     }
//   }

//   Widget _getBannersCarousel(List<BannerAd>? banners) {
//     if (banners == null) {
//       return Column();
//     } else {
//       return _getBanner(banners);
//     }
//   }

//   Widget _getBanner(List<BannerAd>? banners) {
//     if (banners != null) {
//       return CarouselSlider(
//           items: banners
//               .map((banner) => SizedBox(
//                     width: double.infinity,
//                     child: Card(
//                       elevation: AppSize.s1_5,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(AppSize.s12),
//                           side: BorderSide(
//                               color: ColorManager.white, width: AppSize.s1_5)),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(AppSize.s12),
//                         child: Image.network(
//                           banner.image,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ))
//               .toList(),
//           options: CarouselOptions(
//               height: AppSize.s180,
//               autoPlay: true,
//               enableInfiniteScroll: true,
//               enlargeCenterPage: true));
//     } else {
//       return Container();
//     }
//   }

//   Widget _getServices(List<Service>? services) {
//     if (services == null) {
//       return Column();
//     } else {
//       return _getServicesWidget(services);
//     }
//   }

//   Widget _getServicesWidget(List<Service>? services) {
//     if (services != null) {
//       return Padding(
//         padding:
//             const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
//         child: Container(
//           height: AppSize.s140,
//           margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: services
//                 .map((service) => Card(
//                       elevation: AppSize.s4,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(AppSize.s12),
//                           side: BorderSide(
//                               color: ColorManager.white, width: AppSize.s1_5)),
//                       child: Column(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(AppSize.s12),
//                             child: Image.network(
//                               service.image,
//                               fit: BoxFit.cover,
//                               width: AppSize.s100,
//                               height: AppSize.s100,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: AppPadding.p8),
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 service.title,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ))
//                 .toList(),
//           ),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   Widget _getStores(List<Stores>? stores) {
//     if (stores == null) {
//       return Column();
//     } else {
//       return _getStoresWidget(stores);
//     }
//   }

//   Widget _getStoresWidget(List<Stores>? stores) {
//     if (stores != null) {
//       return Padding(
//         padding: const EdgeInsets.only(
//             left: AppPadding.p12, right: AppPadding.p12, top: AppPadding.p12),
//         child: Flex(
//           direction: Axis.vertical,
//           children: [
//             GridView.count(
//               crossAxisSpacing: AppSize.s8,
//               mainAxisSpacing: AppSize.s8,
//               physics: const ScrollPhysics(),
//               shrinkWrap: true,
//               crossAxisCount: 2,
//               children: List.generate(stores.length, (index) {
//                 return InkWell(
//                   onTap: () {
//                     // navigate to store details screen
//                     Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
//                   },
//                   child: Card(
//                     elevation: AppSize.s4,
//                     child: Image.network(
//                       stores[index].image,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               }),
//             )
//           ],
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   @override
//   void dispose() {
//     _viewModel.dispose();
//     super.dispose();
//   }
}

import 'package:flutter/material.dart';
import '../../resources/assets_manager.dart';
import '../../resources/currency_manager.dart';
import '../../resources/languge_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String language =  LanguageType.TURKY.getValue();
  String currency =CurrencyType.DZDINAR.getValue();
  int? gender = 1;
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(AppStrings.account),
          ),
          _getAccountInformation(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(AppStrings.language),
          ),
          _getLanguage(),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(AppStrings.cuerrcy),
          ),
          _getCurrrency(),
        ],
      ),
    );
  }

  _getAccountInformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Costumer Name'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(AppStrings.signout),
                ),
              ],
            ),
          ),
          ExpansionTile(
              title: const Text(AppStrings.edit),
              collapsedIconColor: ColorManager.black,
              collapsedTextColor: ColorManager.black,
              iconColor: ColorManager.primary,
              textColor: ColorManager.primary,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppStrings.socialTitle),
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    const Text(AppStrings.mr),
                    Radio<int?>(
                      activeColor: ColorManager.primary,
                      value: 1,
                      groupValue: gender,
                      onChanged: (int? value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    const Text(AppStrings.mrs),
                    Radio(
                      activeColor: ColorManager.primary,
                      value: 0,
                      groupValue: gender,
                      onChanged: (int? value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: AppPadding.p8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppStrings.firstName),
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    SizedBox(
                      width: AppSize.s200,
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: AppStrings.firstName,
                            label: Text(AppStrings.firstName),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppPadding.p8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppStrings.lastName),
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    SizedBox(
                      width: AppSize.s200,
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: AppStrings.lastName,
                            label: Text(AppStrings.lastName),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppPadding.p8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppStrings.emailHint),
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    SizedBox(
                      width: AppSize.s200,
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: AppStrings.emailHint,
                            label: Text(AppStrings.emailHint),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppPadding.p8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppStrings.password),
                    const SizedBox(
                      width: AppSize.s16,
                    ),
                    SizedBox(
                      width: AppSize.s200,
                      child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            hintText: AppStrings.password,
                            label: Text(AppStrings.password),
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                              ColorManager.primaryOpacity70)),
                      onPressed: () {},
                      child: Text(AppStrings.save)),
                )
              ]),
          TextButton(
            onPressed: () {},
            child: Text(AppStrings.register),
          ),
          TextButton(
            onPressed: () {},
            child: Text(AppStrings.checkout),
          ),
          TextButton(
            onPressed: () {},
            child: Text(AppStrings.myWishlist),
          ),
        ],
      ),
    );
  }

  _getLanguage() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: changeLanguageToEnglish,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s56),
              child: Image.asset(
                ImageAssets.en,
                fit: BoxFit.fill,
                width: language != LanguageType.ENGLISH.getValue()
                    ? AppSize.s56
                    : AppSize.s80,
              ),
            ),
          ),
          GestureDetector(
            onTap: changeLanguageToTurky,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s56),
                child: Image.asset(
                  ImageAssets.tr,
                  fit: BoxFit.fill,
                  width: language != LanguageType.TURKY.getValue()
                      ? AppSize.s56
                      : AppSize.s80,
                )),
          ),
          GestureDetector(
            onTap: changeLanguageToArabic,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s56),
                child: Image.asset(
                  ImageAssets.ar,
                  fit: BoxFit.fill,
                  width: language != LanguageType.ARABIC.getValue()
                      ? AppSize.s56
                      : AppSize.s80,
                )),
          ),
        ],
      ),
    );
  }

  _getCurrrency() {
    TextStyle active =
        TextStyle(color: ColorManager.primaryOpacity70, fontSize: 30);
    TextStyle inactive = TextStyle(fontSize: 20);
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           GestureDetector(
            onTap: changeCurrencyToDZDINAR,
            child: Text(CurrencyType.DZDINAR.getValue(),
                style: CurrencyType.DZDINAR.getValue() == currency
                    ? active
                    : inactive),
          ),
          GestureDetector(
            onTap: changeCurrencyToEURO,
            child: Text(CurrencyType.EURO.getValue(),
                style:
                    CurrencyType.EURO.getValue() == currency ? active : inactive),
          ),
          GestureDetector(
            onTap:  changeCurrencyToLIRATURKY,
            child: Text(CurrencyType.LIRATURKY.getValue(),
                style: CurrencyType.LIRATURKY.getValue() == currency
                    ? active
                    : inactive),
          ),
          GestureDetector(
            onTap:()=>changeCurrencyToUSDOLLAR(),
            child: Text(CurrencyType.USDOLLAR.getValue(),
                style: CurrencyType.USDOLLAR.getValue() == currency
                    ? active
                    : inactive),
          ),
        ],
      ),
    );
  }

  changeLanguageToEnglish() {
    setState(() {
      language = LanguageType.ENGLISH.getValue();
    });
  }

  changeLanguageToTurky() {
    setState(() {
      language = LanguageType.TURKY.getValue();
    });
  }

  changeLanguageToArabic() {
    setState(() {
      language = LanguageType.ARABIC.getValue();
    });
  }

  void changeCurrencyToDZDINAR() { setState(() {
      currency = CurrencyType.DZDINAR.getValue();
    });
  }

  void changeCurrencyToUSDOLLAR() {setState(() {
      currency = CurrencyType.USDOLLAR.getValue();
    });
  }

  void changeCurrencyToLIRATURKY() {setState(() {
      currency = CurrencyType.LIRATURKY.getValue();
    });
  }

  void changeCurrencyToEURO() {setState(() {
      currency = CurrencyType.EURO.getValue();
    });
  }
}

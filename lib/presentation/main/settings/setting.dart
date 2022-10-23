import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int? gender = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(AppStrings.account),
          _getAccountInformation(),
          Text('Language settings'),
          _getLanguage(),
          Text('Cuerrcy settingd'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Costumer Name'),
              ElevatedButton(
                onPressed: () {},
                child: const Text(AppStrings.signout),
              ),
            ],
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
                      child: Text("save")),
                )
              ]),
          TextButton(
            onPressed: () {},
            child: Text('register account'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('checkout'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('my wishlist'),
          ),
        ],
      ),
    );
  }

  _getLanguage() {
    return Row(
      children: [
        Icon(
          Icons.flag_rounded,
          color: Colors.blue,
        ),
        Icon(
          Icons.flag_rounded,
          color: Colors.green,
        ),
        Icon(
          Icons.flag_rounded,
          color: Colors.red,
        ),
      ],
    );
  }

  _getCurrrency() {
    return Row(
      children: [
        Text('DZD  '),
        Text('EUR  '),
        Text('TRY  '),
        Text('USD  '),
      ],
    );
  }
}

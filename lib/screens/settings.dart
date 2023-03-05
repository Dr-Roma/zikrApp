import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 246),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: 38,
                        width: 54,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 2, 75, 202),
                        ),
                        child: IconButton(
                            onPressed: () {
                              context.go('/');
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      LocaleKeys.settings.tr(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 2,
                                      width: 65,
                                      color:
                                          const Color.fromARGB(255, 2, 75, 202),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Container(
                            height: 49,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(31, 63, 60, 60))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LocaleKeys.language.tr(),
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                          child: TextButton(
                                            onPressed: () {
                                              context.setLocale(
                                                  const Locale('en'));
                                            },
                                            child: const Text(
                                              'En',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        const Text('/'),
                                        SizedBox(
                                          width: 45,
                                          child: TextButton(
                                            onPressed: () {
                                              context.setLocale(
                                                  const Locale('ru'));
                                            },
                                            child: const Text(
                                              'Рус',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VibrationControl(),
                          const ToggleSoundWidget(),
                          const ListSoundWidget(),
                          const MyBanner()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VibrationControl extends StatefulWidget {
  const VibrationControl({
    Key? key,
  }) : super(key: key);

  @override
  State<VibrationControl> createState() => _VibrationControlState();
}

class _VibrationControlState extends State<VibrationControl> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderZikr>();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 49,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
                width: 1, color: const Color.fromARGB(31, 63, 60, 60))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.vibration.tr(),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => provider.toggleVibro(true),
                    child: Text(
                      LocaleKeys.on.tr(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: provider.toggleVibroPlay
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: provider.toggleVibroPlay
                              ? const Color.fromARGB(255, 2, 75, 202)
                              : const Color.fromARGB(125, 62, 62, 63)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => provider.toggleVibro(false),
                    child: Text(
                      LocaleKeys.off.tr(),
                      style: TextStyle(
                          fontWeight: provider.toggleVibroPlay
                              ? FontWeight.normal
                              : FontWeight.bold,
                          color: provider.toggleVibroPlay
                              ? const Color.fromARGB(125, 62, 62, 63)
                              : const Color.fromARGB(255, 2, 75, 202)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBanner extends StatefulWidget {
  const MyBanner({Key? key}) : super(key: key);

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  //ios= ca-app-pub-3940256099942544/2934735716
  //and=
  final BannerAd myBanner = BannerAd(
    adUnitId: Platform.isIOS
        ? 'ca-app-pub-3940256099942544/2934735716'
        : 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.mediumRectangle,
    request: const AdRequest(),
    listener: BannerAdListener(
// Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
// Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
// Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
// Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
// Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
// Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => print('Ad impression.'),
    ),
  );

  @override
  void initState() {
    myBanner.load();
    super.initState();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProviderZikr>();
    return provider.spisok
        ? Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
            child: AdWidget(ad: myBanner),
          )
        : const SizedBox.shrink();
  }
}

class ListSoundWidget extends StatefulWidget {
  const ListSoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListSoundWidget> createState() => _ListSoundWidgetState();
}

class _ListSoundWidgetState extends State<ListSoundWidget> {
  final _bannerKey = GlobalKey<_MyBannerState>();

  @override
  void initState() {
    super.initState();
    _bannerKey;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderZikr>();
    final provider1 = context.read<ProviderZikr>();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: provider1.spisok
          ? Container(
              height: 49,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(31, 63, 60, 60))),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Изменит звук',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                provider1.spisok = false;
                              });
                            },
                            child: const Text(
                              'Выбрать',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 2, 75, 202)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          : Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(31, 63, 60, 60))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Изменит звук',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                provider1.spisok = true;
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: provider.listSounds.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 35,
                            child: InkWell(
                              onTap: () {
                                provider1.onSoundSelected(index, provider);
                                provider.playSound();
                              },
                              child: ListTile(
                                title: Text(
                                  provider.listSounds[index],
                                  style: TextStyle(
                                      color: provider.isSelected[index]
                                          ? provider1.selectedColor
                                          : Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class ToggleSoundWidget extends StatelessWidget {
  const ToggleSoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderZikr>();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 49,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            border: Border.all(
                width: 1, color: const Color.fromARGB(31, 63, 60, 60))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.sound.tr(),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => provider.toggleSound(true),
                    child: Text(
                      LocaleKeys.on.tr(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: provider.togglePlayer
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: provider.togglePlayer
                              ? const Color.fromARGB(255, 2, 75, 202)
                              : const Color.fromARGB(125, 62, 62, 63)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => provider.toggleSound(false),
                    child: Text(
                      LocaleKeys.off.tr(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: provider.togglePlayer
                              ? FontWeight.normal
                              : FontWeight.bold,
                          color: provider.togglePlayer
                              ? const Color.fromARGB(125, 62, 62, 63)
                              : const Color.fromARGB(255, 2, 75, 202)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

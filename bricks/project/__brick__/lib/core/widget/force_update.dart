// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// Project imports:
import 'package:{{projectName.snakeCase()}}/app/page/app/app_vm.dart';
import 'package:{{projectName.snakeCase()}}/core/di/locator.dart';
import 'package:{{projectName.snakeCase()}}/core/res/images.dart';
import 'package:{{projectName.snakeCase()}}/core/util/siren.dart';

class ForceUpdatePage extends StatelessWidget {
  final SirenType sirenType;
  const ForceUpdatePage({Key? key, required this.sirenType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Image(
                image: AppImages.logo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    "Güncelleme Mevcut",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Gücümüz Sensin'in yeni bir sürümü mevcut.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (Platform.isIOS) {
                    launchUrl(Uri.parse(
                        "https://apps.apple.com/tr/app/id6446119264?l=tr"));
                  }

                  if (Platform.isAndroid) {
                    launchUrl(Uri.parse(
                        "https://play.google.com/store/apps/details?id=tr.com.koctas.{{projectName.snakeCase()}}&hl=tr&gl=US"));
                  }
                },
                child: const Text("Güncelle")),
            if (sirenType == SirenType.skip || sirenType == SirenType.option)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: () {
                        getIt<AppViewModel>().setSirenType(SirenType.none);
                      },
                      child: const Text("Atla")),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

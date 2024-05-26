import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:task/core/theme/colors_theme.dart';

class RenderCurrentVersion extends StatelessWidget {
  const RenderCurrentVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        final packageInfo = snapshot.data;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Text(
            'Versión ${packageInfo?.version}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: ColorsAppTheme.blueColor.withOpacity(0.4),
            ),
          ),
        );
      },
    );
  }
}

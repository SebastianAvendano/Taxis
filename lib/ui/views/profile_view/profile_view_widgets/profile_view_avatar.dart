import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AeroTaxi/core/providers/user_provider.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:AeroTaxi/data/models/profile_model/user_model.dart';

class AvatarProfileView extends StatelessWidget {
  const AvatarProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final UserModel currentUser = userProvider.user;

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 15,
          ),
          child: _buildContent(currentUser),
        );
      },
    );
  }

  Widget _buildContent(UserModel user) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: _buildInformation(user.displayName!),
    );
  }

  Widget _buildInformation(String text) => Text(
        text,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: ColorsAppTheme.blueColor,
        ),
      );
}

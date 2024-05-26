import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/providers/user_provider.dart';
import 'package:task/core/theme/colors_theme.dart';
import 'package:task/data/models/profile/user_model.dart';

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
          color: ColorsAppTheme.primaryColor.withOpacity(0.2),
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
        vertical: 36,
      ),
      child: _buildInformation(user.displayName!),
    );
  }

  Widget _buildInformation(String text) => Text(
        text,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );
}

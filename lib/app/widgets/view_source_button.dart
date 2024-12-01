import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:vsdat/gen/gen.dart';
import 'package:vsdat/l10n/l10n.dart';

class ViewSourceButton extends StatelessWidget {
  const ViewSourceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.https(
        'github.com',
        '/ShakyaCsun/val_dynamics',
      ),
      target: LinkTarget.blank,
      builder: (context, followLink) => IconButton(
        onPressed: followLink,
        tooltip: context.l10n.viewSource,
        iconSize: 36,
        icon: Builder(
          builder: (context) {
            final iconSize = IconTheme.of(context).size;
            final isLightTheme =
                Theme.of(context).colorScheme.brightness == Brightness.light;
            return SvgPicture.asset(
              isLightTheme
                  ? Assets.icons.githubMark
                  : Assets.icons.githubMarkWhite,
              width: iconSize,
              height: iconSize,
            );
          },
        ),
      ),
    );
  }
}

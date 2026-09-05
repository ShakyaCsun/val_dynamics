import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/link.dart';
import 'package:vsdat/gen/gen.dart';
import 'package:vsdat/l10n/l10n.dart';

class ViewSourceButton extends StatelessWidget {
  const ViewSourceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.https('github.com', '/ShakyaCsun/val_dynamics'),
      target: LinkTarget.blank,
      builder: (context, followLink) => IconButton(
        onPressed: followLink,
        tooltip: context.l10n.viewSource,
        iconSize: 36,
        icon: Builder(
          builder: (context) {
            final iconSize = IconTheme.of(context).size;
            final svgIcon = switch (Theme.of(context).colorScheme.brightness) {
              .dark => Assets.icons.githubMarkWhite,
              .light => Assets.icons.githubMark,
            };
            return svgIcon.svg(width: iconSize, height: iconSize);
          },
        ),
      ),
    );
  }
}

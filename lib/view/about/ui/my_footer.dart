// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/core/helper/extensions.dart';
import 'package:my_portfolio/core/helper/helper_functions.dart';
import 'package:my_portfolio/core/widget/powered_by_flutter.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/app_menu.dart';
import 'package:my_portfolio/view/home/widget/app_bar/ui/home_app_bar.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: context.theme.appBarTheme.backgroundColor?.withValues(alpha: 0.1),
      padding: EdgeInsets.all(context.insets.cardPadding),
      child: Column(
        children: [
          context.isDesktop ? const _DeskTopFooter() : const _MobileFooter(),
          const Divider(height: 24),
          const PoweredByFlutter(),
        ],
      ),
    );
  }
}

class _DeskTopFooter extends StatelessWidget {
  const _DeskTopFooter();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [AppLogo(), Spacer(), DiskTopMenu(), Spacer(), _ContactMe()],
    );
  }
}

class _MobileFooter extends StatelessWidget {
  const _MobileFooter();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [AppLogo(), MobileMenu(), _ContactMe()]);
  }
}

class _ContactMe extends StatelessWidget {
  const _ContactMe();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () async {
            await HelperFunctions.launchToUrl(Uri.parse(kAboutMe.social.whatsappUrl));
          },
          iconSize: 20,

          icon: Icon(
            FontAwesomeIcons.whatsapp,
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        const Gap(8),
        Tooltip(
          message: '${kAboutMe.phone}\nLong press to copy',
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          textAlign: TextAlign.center,

          textStyle: context.textStyle.bodyMdMedium.copyWith(
            color: context.theme.colorScheme.onSurface,
            height: 2,
          ),
          preferBelow: false,
          verticalOffset: 20,
          child: GestureDetector(
            onLongPress: () {
              _copyToClipboard(kAboutMe.phone, context);
            },
            child: IconButton(
              onPressed: () async {
                final Uri launchUri = Uri(scheme: 'tel', path: kAboutMe.phone);
                await HelperFunctions.launchToUrl(launchUri);
              },
              iconSize: 20,

              icon: Icon(
                Icons.phone_in_talk_outlined,
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ),
        ),
        const Gap(8),

        IconButton(
          onPressed: () async {
            await HelperFunctions.launchToUrl(Uri.parse(kAboutMe.social.githubUrl));
          },
          iconSize: 20,

          icon: Icon(
            FontAwesomeIcons.github,
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        const Gap(8),
        IconButton(
          onPressed: () async {
            await HelperFunctions.launchToUrl(Uri.parse(kAboutMe.social.linkedinUrl));
          },
          iconSize: 20,
          icon: Icon(
            FontAwesomeIcons.linkedinIn,
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        const Gap(8),
        Tooltip(
          message: '${kAboutMe.email}\nLong press to copy',
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 400),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          textStyle: context.textStyle.bodyMdMedium.copyWith(
            color: context.theme.colorScheme.onSurface,
            height: 2,
          ),
          preferBelow: false,
          verticalOffset: 20,
          child: GestureDetector(
            onLongPress: () {
              _copyToClipboard(kAboutMe.email, context);
            },
            child: IconButton(
              onPressed: () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map(
                        (MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                      )
                      .join('&');
                }

                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: kAboutMe.email,
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'Dear Ahmed\n',
                  }),
                );
                await HelperFunctions.launchToUrl(emailLaunchUri);
              },
              iconSize: 20,
              icon: Icon(
                Icons.email_outlined,
                color: context.theme.colorScheme.onBackground,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Copied: $text',
          style: context.textStyle.bodyMdMedium.copyWith(
            color: context.theme.colorScheme.onSurface,
            height: 2,
          ),
        ),
        backgroundColor: context.theme.colorScheme.surface,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

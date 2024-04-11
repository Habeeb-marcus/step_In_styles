// notification page  a clear all textbutton in appbar to clear all notification the list of notification have image with details beside it and also time ago with the dot icon tha shows its unseen notification card

import 'package:flutter/material.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/animations/fade_in_slide.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  static List<Widget> actions(BuildContext context,
          {void Function()? onPressed}) =>
      [
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.clear_all,
            style: AppTextStyle.bodyThree.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: sizer(true, 12, context),
            ),
          ),
        ),
      ];

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(sizer(true, 14, context)),
        child: ListView.separated(
          itemCount: notifications(context).length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return FadeInSlide(
              duration: index * 0.2,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(sizer(true, 8, context)),
                  child: Row(
                    children: [
                      Image.asset(
                        notifications(context)[index].image,
                        width: sizer(true, 50, context),
                        height: sizer(true, 50, context),
                      ),
                      HSpace.small,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.new_products,
                              style: AppTextStyle.bodyThree.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: sizer(true, 14, context),
                              ),
                            ),
                            Text(
                              notifications(context)[index].description,
                              softWrap: true,
                              style: AppTextStyle.bodyThree.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              notifications(context)[index].time,
                              style: AppTextStyle.bodyThree.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<NotificationModel> notifications(BuildContext context) => [
      NotificationModel(
        title: 'New Product',
        description: AppLocalizations.of(context)!.nike_270_avail,
        image: 'assets/images/nike.png',
        time: AppLocalizations.of(context)!.time5hr,
        seen: false,
      ),
      NotificationModel(
        title: 'New Product',
        // access @AppLocalizations
        description: AppLocalizations.of(context)!.puma_avail,
        image: 'assets/images/puma.png',
        time: AppLocalizations.of(context)!.time3min,
        seen: true,
      ),
      NotificationModel(
        title: 'New Product',
        description: AppLocalizations.of(context)!.adidas_avail,
        image: 'assets/images/adidas.png',
        time: AppLocalizations.of(context)!.time20min,
        seen: false,
      ),
      NotificationModel(
        title: 'New Product',
        description: AppLocalizations.of(context)!.converse_avail,
        image: 'assets/images/converse.png',
        time: AppLocalizations.of(context)!.time1hr,
        seen: true,
      ),
      NotificationModel(
        title: 'New Product',
        description: AppLocalizations.of(context)!.helix_avail,
        image: 'assets/images/helix.png',
        time: AppLocalizations.of(context)!.time2hr,
        seen: false,
      ),
    ];

class NotificationModel {
  final String title;
  final String description;
  final String image;
  final String time;
  final bool seen;

  NotificationModel({
    required this.title,
    required this.description,
    required this.image,
    required this.time,
    required this.seen,
  });
}

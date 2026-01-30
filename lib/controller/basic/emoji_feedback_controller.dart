import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/http/web_service.dart';
import 'package:primecustomer/data/model/local/emoji_model.dart';
import 'package:primecustomer/data/model/remote/feedback_model.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/api/notification_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../../res/app/app_dimens.dart';

class EmojiFeedbackController extends BaseController {
  WebService? webService;
  BuildContext? mContext;

  EmojiFeedbackController(this.webService, this.mContext);

  List<EmojiModel> defaultEmoji = [
    EmojiModel(icon: Icons.favorite, data: "❤", color: AppColors.red),
    EmojiModel(icon: Icons.emoji_emotions, data: "😘"),
    // EmojiModel(icon: Icons.thumb_down, data: "👎"),
    EmojiModel(icon: Icons.thumb_up, data: "👍"),
    EmojiModel(icon: Icons.message, data: "📖", isEmoji: false),
    EmojiModel(icon: Icons.more_horiz, color: AppColors.white, isEmoji: false),
  ];

  List<EmojiModel> defaultEmojiPop = [
    EmojiModel(icon: Icons.favorite, data: "❤", color: AppColors.red),
    EmojiModel(icon: Icons.emoji_emotions, data: "😘"),
    EmojiModel(icon: Icons.thumb_down, data: "👎"),
    EmojiModel(icon: Icons.thumb_up, data: "👍"),
  ];

  void popUpEmojis({Function(String)? call}) {
    List<Widget> list = [];
    for (EmojiModel mod in defaultEmojiPop) {
      list.add(InkWell(
        onTap: () {
          UiApi.pop(mContext!, mod.data, done: () {
            NavApi.fireBack();
            if(call != null) call(mod.data);
          });
        },
        child: mod.isEmoji
            ? Text(mod.data, style: AppTextStyles.h2StyleBold)
            : Icon(mod.icon, color: mod.color, size: AppDimens.dimen25),
      ));
    }

    UiApi.popUpContainer(
        context: mContext!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list,
        ));
  }

  void handleEmojis(GiftedCard gift, {Function? mess, Function(String)? call}) {
    List<Widget> list = [];
    for (EmojiModel mod in defaultEmoji) {
      list.add(InkWell(
        onTap: () {
          if (mod.icon == Icons.more_horiz) {
            selectEmoji(gift, call);
          } else if (mod.icon == Icons.message) {
            NavApi.fireBack();
            if (mess != null) mess();
          } else {
            UiApi.pop(mContext!, mod.data, done: () {
              NavApi.fireBack();
              initFeedbackRequest(gift, Emoji("_name", mod.data), call);
            });
          }
        },
        child: mod.isEmoji
            ? Text(mod.data, style: AppTextStyles.h2StyleBold)
            : Icon(mod.icon, color: mod.color, size: AppDimens.dimen25),
      ));
    }

    UiApi.popUpContainer(
        context: mContext!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list,
        ));
  }

  void selectEmoji(GiftedCard gift, Function(String)? call) {
    NavApi.fireBack();
    UiApi.emojiPicker((cat, emoji) {
      UiApi.pop(mContext!, emoji.emoji, done: () {
        initFeedbackRequest(gift, Emoji("_name", emoji.emoji), call);
      });
    });
  }

  void initFeedbackRequest(
    GiftedCard gift,
    Emoji emoji,
    Function(String)? call,
  ) {
    FeedbackModel model = getFeedbackModel(gift, emoji: emoji.emoji);

    webService?.sendGiftCardFeedback(model, gift.id, (response) {
      if (call != null) call(model.emoji);
      NotificationApi.showNotification(
          title: "Card Feedback",
          body: "Your feedback has been successfully submitted");
    });
  }

  FeedbackModel getFeedbackModel(GiftedCard gift, {String emoji = "😊"}) {
    FeedbackModel f = gift.feedback ?? const FeedbackModel();
    return FeedbackModel(
      emoji: emoji,
      message: f.message,
      // id: f.id,
      like: f.like,
      createdAt: f.createdAt.isEmpty
          ? DateTimeUtils.getCurrentDate(format: "yyyy-MM-ddTHH:mm:ss")
          : f.createdAt,
    );
  }
}

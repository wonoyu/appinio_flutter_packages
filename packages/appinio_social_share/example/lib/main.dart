import 'package:appinio_social_share_plus/appinio_social_share_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppinioSocialSharePlus appinioSocialShare = AppinioSocialSharePlus();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Share Feature",
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("ShareToWhatsapp"),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: false);
                  if (result != null && result.paths.isNotEmpty) {
                    shareToWhatsApp("message", result.paths[0]!);
                  }
                },
              ),
            ],
          ),
        ));
  }

  shareToWhatsApp(String message, String filePath) async {
    await appinioSocialShare.android.shareToSMS(message, filePath);
  }

  shareToInstagramStory(String appId, String message, String filePath) async {
    await appinioSocialShare.android
        .shareToInstagramStory(appId, stickerImage: filePath, message: message);
  }

  shareToFacebookStory(String appId, String filePath) async {
    await appinioSocialShare.android
        .shareToInstagramStory(appId, stickerImage: filePath);
  }
}

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

class Rec {
  bool _isRec = false;
  late Uint8List contents;
  late final FlutterAudioRecorder2 recorder;

  //Todo: add init function
  initRecorder() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    if (File("$tempPath/myfile.aac").existsSync()) {
      File("$tempPath/myfile.aac").deleteSync();
    }
    recorder = FlutterAudioRecorder2("$tempPath/myfile.aac",
        audioFormat: AudioFormat.AAC); // .wav .aac .m4a
  }

  recordMic() async {
    //then async await
    _isRec = !(_isRec);
    print("foobar");
    bool? isPermitted = await FlutterAudioRecorder2.hasPermissions;
    print("permission: $isPermitted");
    if (isPermitted ?? false) {
      print("Staring record");
      await recorder.initialized;
      if (_isRec) {
        print("Recording");
        await recorder.start();
        //print('tempPath/myFile.m4a');
      }
      if (!_isRec) {
        var recording = await recorder.stop();
        print("stopping rec..");
        if (recording?.path != null) {
          print(recording!.path!);
          contents = await File(recording!.path!).readAsBytes();
          var url = Uri.parse(
              "https://api-inference.huggingface.co/models/openai/whisper-large-v2");
          var res = await http.post(url,
              headers: {
                "Authorization": "Bearer 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"
              },
              body: contents);
          print(res.body);
        }

        var bartUrl = Uri.parse(
            "https://api-inference.huggingface.co/models/facebook/bart-large-mnli");
        var textaudio = "Where is the principal";
        var intents = '["location", "principal", "time", "student"]';

        // var result = await http.post(bartUrl,
        //     headers: {
        //       "Authorization": "Bearer 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"
        //     },
        //     body:
        //         '{"input": $textaudio, "parameters": {"candidate_labels": ["location", "principal", "time", "student"]} }');
        //
        // print(res.body);
        // }
        // bool nowRecording = await record.isRecording();
        // print(nowRecording);
      }
    }
  }
}

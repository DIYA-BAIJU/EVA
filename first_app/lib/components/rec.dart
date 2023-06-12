import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:http/http.dart' as http;

class Rec {
  bool _isRec = false;
  final record = Record();
  recordMic() async {
    //then async await
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    _isRec = !(_isRec);
    if (await record.hasPermission()) {
      if (_isRec) {
        await record.start(
          path: (tempPath + r'\myFile.aac'), //string interpolation ,$
          encoder: AudioEncoder.aacLc, // by default
          bitRate: 128000, // by default
          samplingRate: 44100,
        );
        //print('tempPath/myFile.m4a');
      }
      //print(tempPath);
      if (!_isRec) {
        await record.stop();
        print("stopping rec..");
        // var contents = await File(tempPath + r'\myFile.aac').readAsBytes();

        var url = Uri.parse(
            "https://api-inference.huggingface.co/models/openai/whisper-large-v2");
        // var res = await http.post(url,
        //     headers: {
        //       "Authorization": "Bearer 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"
        //     },
        //     body: contents);
        // print(res.body);

        var bartUrl = Uri.parse(
            "https://api-inference.huggingface.co/models/facebook/bart-large-mnli");
        var textaudio = "Where is the principal";
        var intents = '["location", "principal", "time", "student"]';

        var res = await http.post(bartUrl,
            headers: {
              "Authorization": "Bearer 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"
            },
            body:
                '{"input": $textaudio, "parameters": {"candidate_labels": ["location", "principal", "time", "student"]} }');

        print(res.body);
      }
      bool nowRecording = await record.isRecording();
      print(nowRecording);
    }
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pickers/picscreen.dart';

late List<CameraDescription> cameras;

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted){
        return;
      }
      setState(() {
        
      });
    }).catchError((Object e){
      if(e is CameraException){
        switch(e.code){
          case 'cameraaccessdenied':
          print('access denied');
          break;
          default:
          print(e.description);
          break;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: CameraPreview(_controller),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: MaterialButton(onPressed: ()async{
                    if(!_controller.value.isInitialized){
                      return null;
                    }
                    if(_controller.value.isTakingPicture){
                      return null;
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Picview(file)));
                    try{
                      await _controller.setFlashMode(FlashMode.auto);
                      XFile picture = await _controller.takePicture();
                      Navigator.push
                      (context, MaterialPageRoute(
                        builder: (context)=>Picview(picture)));

                    } on CameraException catch (e){
                      debugPrint("Occured error while taking pic:$e");
                      return null;
                    }
                  },
                  color: Colors.white70,
                  child: Text("Take picture"),),
                ),
              )
            ],
          )
        ],
       ),
    );
  }
}
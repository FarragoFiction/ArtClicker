import 'package:ArtClicker/ArtClicker.dart';
import 'package:RenderingLib/RendereringLib.dart';
import "dart:html";
import "dart:async";
Element container;

DivElement div;
main() {
    div = querySelector("#container");
    start();
}

void clearDiv() {
    List<Element> children = new List.from(div.children);
    children.forEach((f) {
        f.remove();
    });
}

Future<Null> start() async{
    await Loader.preloadManifest();
    clearDiv();
}


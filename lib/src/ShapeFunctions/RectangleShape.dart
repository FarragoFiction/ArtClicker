import "../../ArtClicker.dart";
import 'dart:html';
import "package:RenderingLib/RendereringLib.dart";

class RectangleShape extends ShapeFunction {
  RectangleShape(int width, int height) : super(width, height);


  @override
  void draw(CanvasElement canvas, Colour color, int x, int y) {
      canvas.context2D.fillStyle = color.toStyleString();
      canvas.context2D.fillRect(x, y, width, height);
  }
}
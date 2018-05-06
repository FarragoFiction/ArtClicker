import "dart:html";
import "package:RenderingLib/RendereringLib.dart";
abstract class ShapeFunction {
    int width = 10;
    int height = 10;

    ShapeFunction(int this.width, int this.height);

    void draw(CanvasElement canvas, Colour color, int x, int y);
}
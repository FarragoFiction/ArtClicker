/*
    A reference to my old modern art clicker, but bigger and better.
 */
import "dart:html";
import "dart:async";
import "../ArtClicker.dart";
import "package:RenderingLib/RendereringLib.dart";

class ArtCanvas {
    CanvasElement canvas;
    CanvasElement buffer;

    CanvasElement modelCanvas;
    ImageData source;

    int timeBetweenAutoClicks = 1000;
    int funds = 0;
    PositionFunction positionFunction;
    ShapeFunction shapeFunction;

    //the canvas could be a png, a doll, or BOTH
    ArtCanvas(Element container, CanvasElement this.modelCanvas, {PositionFunction this.positionFunction:null, ShapeFunction this.shapeFunction:null}) {
        print("making a new art canvas");
        DivElement borderElement = new DivElement();
        borderElement.style.display = "inline-block";
        borderElement.style.border = "3px solid #000000";
        canvas = new CanvasElement(width:modelCanvas.width, height:modelCanvas.height);
        buffer = new CanvasElement(width:modelCanvas.width, height:modelCanvas.height);

        borderElement.append(canvas);
        container.append(borderElement);
        canvas.style.border = "3px solid #ffffff";

        if(positionFunction == null) positionFunction = new RandomPosition(canvas.width, canvas.height);
        if(shapeFunction == null) shapeFunction = new RectangleShape(10,10);

        source = modelCanvas.context2D.getImageData(0, 0, modelCanvas.width, modelCanvas.height);

    }

    static int xyToIndex(int width, int x, int y) {
       return (y * width + x)* 4; //array is in sets of rgba
    }

    Colour getImageColorAtPosition(int x, int y) {

        int i = xyToIndex(source.width, x, y);
        print("x is $x and y is $y and i is $i and data is ${source.data.length}");

        int red = source.data[i];
        int green = source.data[i+1];
        int blue = source.data[i+2];
        int alpha = source.data[i+3];
        return new Colour(red, green, blue, alpha);
    }

    Future<Null> drawBrushStroke() {
        positionFunction.updatePosition();
        Colour color =getImageColorAtPosition(positionFunction.x, positionFunction.y);
        shapeFunction.draw(buffer, color, positionFunction.x, positionFunction.y);
        canvas.context2D.drawImage(buffer,0,0);
    }


}
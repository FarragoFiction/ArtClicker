/*
    A reference to my old modern art clicker, but bigger and better.
 */
import "dart:html";
import "dart:async";
import "../ArtClicker.dart";
import "package:RenderingLib/RendereringLib.dart";

class ArtCanvas {
    CanvasElement canvas;
    CanvasElement modelCanvas;
    int timeBetweenAutoClicks = 1000;
    int funds = 0;
    PositionFunction positionFunction;
    ShapeFunction shapeFunction;

    //the canvas could be a png, a doll, or BOTH
    ArtCanvas(CanvasElement this.modelCanvas, {PositionFunction this.positionFunction:null, ShapeFunction this.shapeFunction:null}) {
        canvas = new CanvasElement(width:modelCanvas.width, height:modelCanvas.height);

        if(positionFunction == null) positionFunction = new RandomPosition(canvas.width, canvas.height);
        if(shapeFunction == null) shapeFunction = new RectangleShape(10,10);

    }

    Future<Null> drawBrushStroke() {
        Colour color = new Colour(255,13,13);
        positionFunction.updatePosition();
        shapeFunction.draw(canvas, color, positionFunction.x, positionFunction.y);
    }


}
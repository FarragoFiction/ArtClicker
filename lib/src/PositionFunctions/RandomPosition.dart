import "../../ArtClicker.dart";
import "package:RenderingLib/RendereringLib.dart";

class RandomPosition extends PositionFunction {
    Random rand = new Random();
    RandomPosition(int maxWidth, int maxHeight) : super(maxWidth, maxHeight);

  @override
  void updatePosition() {
    x = rand.nextIntRange(0, maxWidth-1);
    y = rand.nextIntRange(0, maxHeight-1);
  }
}
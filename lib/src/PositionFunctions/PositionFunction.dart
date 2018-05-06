//give the current position, calculates a new one without going out of bounds
abstract class PositionFunction {
    int x = 0;
    int y = 0;
    int maxWidth = 0;
    int maxHeight = 0;

    PositionFunction(int this.maxWidth, int this.maxHeight);

    //set x and y to the new values
    void updatePosition();
}
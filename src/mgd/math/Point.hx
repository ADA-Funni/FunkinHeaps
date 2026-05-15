package mgd.math;

class Point {
    public var x:Float;
    public var y:Float;

    inline public function new(x:Float = 0, y:Float = 0) {
        set(x, y);
    }

    public function set(x:Float = 0, y:Float = 0) {
        this.x = x;
        this.y = y;
    }
}
package;

import hxd.Key;
import hxd.Res;
import mgd.play.stage.Stage;
import hxd.App;

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

class Main extends App {
    public var stage:Stage;
    override function init() {
        super.init();

        stage = new Stage(s2d, 'yeitsLovelyLittleHouse');
    }

    override function update(dt:Float) {
        final speed:Float = Key.isDown(Key.SHIFT) ? 10 : 1;

        if (Key.isDown(Key.A))
            s2d.camera.x -= speed * s2d.camera.scaleX;

        if (Key.isDown(Key.S))
            s2d.camera.y += speed * s2d.camera.scaleX;

        if (Key.isDown(Key.W))
            s2d.camera.y -= speed * s2d.camera.scaleX;

        if (Key.isDown(Key.D))
            s2d.camera.x += speed * s2d.camera.scaleX;

        if (Key.isPressed(Key.QWERTY_EQUALS)) {
            s2d.camera.scaleX += 0.1;
            s2d.camera.scaleY += 0.1;
        } else if (Key.isPressed(Key.QWERTY_MINUS)) {
            s2d.camera.scaleX -= 0.1;
            s2d.camera.scaleY -= 0.1;
        }

        s2d.camera.scaleX = Math.max(0.1, s2d.camera.scaleX);
        s2d.camera.scaleY = Math.max(0.1, s2d.camera.scaleY);

        stage.update(dt);
        super.update(dt);
    }

    static function main() {
        new Main();

        #if js
        Res.initEmbed();
        #else
        Res.initLocal();
        #end
    }
}
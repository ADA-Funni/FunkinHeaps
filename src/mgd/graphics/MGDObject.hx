package mgd.graphics;

import mgd.math.Point;
import h2d.Tile;
import h2d.Camera;
import h2d.RenderContext;
import h2d.Object;
import h2d.Bitmap;

class MGDObject extends Bitmap {
	public var position = new Point(0, 0);
	public var scroll = new Point(1, 1);

	public var camera:Null<Camera>;

	public function new(tile:Tile, ?parent:Object) {
		super(tile, parent);
	}

	public function updatePos(offsetX:Float = 0, offsetY:Float = 0) {
		setPosition(position.x + offsetX, position.y + offsetY);
	}

	override function sync(ctx:RenderContext) {
		final cam:Camera = camera ?? getScene().camera;

		final tx:Float = (1 - scroll.x) * cam.x;
		final ty:Float = (1 - scroll.y) * cam.y;

		if (tx != x || ty != y)
			updatePos(tx, ty);

		super.sync(ctx);
	}
}
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
	public var centerOffset = new Point(0, 0);

	public var camera:Null<Camera>;

	public function new(tile:Tile, ?parent:Object) {
		super(tile, parent);

		tile.dx -= tile.width * 0.5;
		tile.dy -= tile.height * 0.5;

		centerOffset.set(tile.width * 0.5, tile.height * 0.5);
	}

	public function updatePos(offsetX:Float = 0, offsetY:Float = 0) {
		setPosition(position.x + offsetX + centerOffset.x, position.y + offsetY + centerOffset.y);
	}

	/**
	 * Thanks to PurSnake for the base I used for this function!
	 * @see https://x.com/PurSnake
	 */
	override function sync(ctx:RenderContext) {
		final cam:Camera = camera ?? getScene().camera;

		final tx:Float = ((1 - scroll.x) * cam.x) * cam.scaleX;
		final ty:Float = ((1 - scroll.y) * cam.y) * cam.scaleY;

		if (tx != x || ty != y)
			updatePos(tx, ty);

		super.sync(ctx);
	}
}
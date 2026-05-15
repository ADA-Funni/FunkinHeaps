package mgd.play.stage;

import mgd.graphics.MGDObject;
import h2d.Scene;
import hxd.Res;
import haxe.xml.Access;
import h2d.Object;

using StringTools;

class Stage extends Object {
    private static final STAGE_RES_PATH:String = 'gameplay/stages';

    public var props:Map<String, MGDObject> = [];
    
    public function new(?s2d:Scene, stageId:String = "yeitsLovelyLittleHouse") {
        super(s2d);

        final data:Access = new Access(Xml.parse(Res.load('$STAGE_RES_PATH/$stageId/stage.xml').toText()).firstElement());
        
        for (node in data.nodes.sprite) {
            var bmp = new MGDObject(Res.load('$STAGE_RES_PATH/$stageId/${node.att.image}.png').toTile(), this);

            var node_position:Array<Float> = commaFloatsFromString(node.att.position);
            var node_scale:Array<Float> = commaFloatsFromString(node.att.scale);
            var node_scroll:Array<Float> = commaFloatsFromString(node.att.scroll);

            bmp.position.x = node_position[0];
            bmp.position.y = node_position[1];
            bmp.updatePos();

            bmp.scaleX = node_scale[0];
            bmp.scaleY = node_scale[1];

            bmp.scroll.set(node_scroll[0], node_scroll[1]);

            bmp.alpha = node.has.alpha ? Std.parseFloat(node.att.alpha.trim()) : 1;
            bmp.blendMode = h2d.BlendMode.createByName(node.has.blend ? node.att.blend : 'Alpha');

            props[node.att.id] = bmp;
        }
    }

    public function update(dt:Float) {
        
    }

    static function commaFloatsFromString(str:String):Array<Float> {
        var arr:Array<Float> = [];

        var strAsArr:Array<String> = str.split(',');
        for (item in strAsArr) {
            arr.push(Std.parseFloat(item.trim()));
        }

        return arr;
    }
}
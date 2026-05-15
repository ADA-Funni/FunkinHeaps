package mgd.script;

import insanity.Script;

class HScript implements MGDScript {
    public var script:Script;

    public function new() {
        
    }

    public function load(text:String):MGDScript {
        script = new Script(text, 'hscript');
        return this;
    }

    public function execute():Null<Dynamic> {
        return script.start();
    }

    public function exists(id:String):Bool {
        return script.variables.exists(id);
    }

    public function get(id:String):Null<Dynamic> {
        return exists(id) ? script.variables.get(id) : null;
    }

    public function set(id:String, value:Dynamic):Null<Dynamic> {
        script.variables.set(id, value);
        return value;
    }

    public function call(id:String, ?args:Array<Dynamic>):Null<Dynamic> {
        return exists(id) ? script.call(id, args) : null;
    }
}
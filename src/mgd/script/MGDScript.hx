package mgd.script;

interface MGDScript {
    public function load(text:String):MGDScript;
    public function execute():Null<Dynamic>;

    public function exists(id:String):Bool;
    public function get(id:String):Null<Dynamic>;
    public function set(id:String, value:Dynamic):Null<Dynamic>;

    public function call(id:String, ?args:Array<Dynamic>):Null<Dynamic>;
}
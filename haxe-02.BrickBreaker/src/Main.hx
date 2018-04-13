class Main extends hxd.App {

    var pad : Pad;

    override function init() {
        // Init resources
        hxd.Res.initEmbed();

        // Lander Sprite
        // Create sprite on standard scene
        var tile = h2d.Tile.fromColor(0xFF00AA, 100, 20);
        pad = new Pad(tile, s2d);
        pad.init();
    }
    
    override function update(dt:Float) {
       pad.update(dt);
    }
    
    static function main() {
        new Main();
    }
    
}
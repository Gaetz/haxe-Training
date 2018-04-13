class Main extends hxd.App {

    var pad : Pad;
    var ball : Ball;
    var level : Array<Array<Brick>>;

    var rows = 6;
    var cols = 15;


    override function init() {
        // Init resources
        hxd.Res.initEmbed();

        // Create sprite on standard scene
        var tile = h2d.Tile.fromColor(0xFF00AA, 100, 20);
        pad = new Pad(tile, s2d);
        pad.init();
        ball = new Ball(s2d);
        ball.init(pad);

        // Create level
        level = [for (y in 0...rows) [for (x in 0...cols) new Brick(x, y, s2d, cols)]];
    }
    
    override function update(dt:Float) {
        pad.update(dt);
        ball.update(dt);
    }
    
    static function main() {
        new Main();
    }
    
}
import hxd.Key in K;

class Main extends hxd.App {

    var lander : Lander;
    var ground : h2d.Bitmap;

    var gravity : Float = 0.05;
    var propulsion : Float = -0.1;
    var groundHeight = 40;
    var groundThickness = 30;

    override function init() {
        // Init resources
        hxd.Res.initEmbed();
        
        // Lander Sprite
        // Create sprite on standard scene
        lander = new Lander(s2d);
        lander.init();
        // Load bitmaps in sprite   
        var landerTile = hxd.Res.lander.toTile();
        landerTile.center();   
        new h2d.Bitmap(landerTile, lander);
        // Create fire sprite as a lander child
        var fire = new h2d.Sprite(lander);
        fire.name = "fire";
        var fireTile = hxd.Res.lander_fire.toTile();
        new h2d.Bitmap(fireTile, fire);
        fire.visible = false;

        // Ground
        var groundTile = h2d.Tile.fromColor(0xFFFFFF, s2d.width, groundThickness);
        ground = new h2d.Bitmap(groundTile, s2d);
        ground.y = s2d.height - groundHeight;
    }
    
    override function update(dt:Float) {
        // Controls
        if (K.isDown(K.UP)) {
            lander.fireOn();
            lander.vy += propulsion;
        } else {
            lander.fireOff();
        }
        // Move and gravity
        lander.x += lander.vx * dt;
        lander.y += lander.vy * dt;
        lander.vy += gravity;
    }
    
    static function main() {
        new Main();
    }
    
}
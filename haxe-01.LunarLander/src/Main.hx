class Main extends hxd.App {

    var lander : Lander;
    var ground : h2d.Bitmap;

    var groundHeight = 40;
    var groundThickness = 30;
    var landMaxAngle = 0.4;
    var landMaxSpeed = 5;

    var outcome = 0;
    var font : h2d.Font;

    override function init() {
        // Init resources
        hxd.Res.initEmbed();
        font = hxd.Res.customFont.toFont();

        // Lander Sprite
        // Create sprite on standard scene
        lander = new Lander(s2d);
        lander.init();
        // Load bitmaps in sprite   
        var landerTile = hxd.Res.lander.toTile();
        landerTile.dx = -Math.round(landerTile.width / 2);   
        landerTile.dy = -Math.round(landerTile.height / 2);   
        new h2d.Bitmap(landerTile, lander);
        // Create fire sprite as a lander child
        var fire = new h2d.Sprite(lander);
        fire.name = "fire";
        var fireTile = hxd.Res.lander_fire.toTile();
        fireTile.dx = -Math.round(fireTile.width / 2);   
        fireTile.dy = -Math.round(fireTile.height / 2);   
        new h2d.Bitmap(fireTile, fire);
        fire.visible = false;

        // Ground
        var groundTile = h2d.Tile.fromColor(0xFFFFFF, s2d.width, groundThickness);
        ground = new h2d.Bitmap(groundTile, s2d);
        ground.y = s2d.height - groundHeight;
    }
    
    override function update(dt:Float) {
        if(outcome == 0) {
            // Lander
            lander.update(dt);
            // Victory condition
            if (lander.y + lander.getBounds().height / 2 > s2d.height - groundHeight) { 
                if (lander.vy <= landMaxSpeed 
                && lander.rotation >= -Math.PI / 2 - landMaxAngle 
                && lander.rotation <= -Math.PI / 2 + landMaxAngle) {
                    lander.y = s2d.height - groundHeight - lander.getBounds().height / 2;
                    outcome = 2;
                } else {
                    lander.y = s2d.height - groundHeight - lander.getBounds().height / 2;
                    outcome = 1;
                }
            }
        } else if (outcome == 1) {
            // Loss
            var tf = new h2d.Text(font, s2d);
            tf.textColor = 0xFFFFFF;
            tf.text = "Failure";
        } else if (outcome == 2) {
            // Victory
            var tf = new h2d.Text(font, s2d);
            tf.textColor = 0xFFFFFF;
            tf.text = "Success";
        }
    }
    
    static function main() {
        new Main();
    }
    
}
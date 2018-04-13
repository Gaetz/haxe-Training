class Brick extends h2d.Bitmap {

    public function new(x, y, scene: h2d.Scene, cols) {
        var tile = h2d.Tile.fromColor(0xFF00AA, Math.round(scene.width / cols), 20);
        super(tile, scene);
        trace(x);
        trace(y);
        this.x = x * (tile.width + 1);
        this.y = y * (tile.height + 1);
    }

}
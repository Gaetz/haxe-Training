class Ball extends h2d.Graphics {

    var radius = 10;
    var isLocked: Bool;
    var pad: Pad;

    public function init(pad: Pad) {
        this.pad = pad;
        reset();
        beginFill(0xFFFFFF);
        drawCircle(0, 0, radius, 20);
        endFill();
    }

    public function reset() {
        x = pad.x;
        y = pad.y - radius;
        isLocked = true;
    }

    public function update(dt: Float) {
        if(isLocked) {
            x = pad.x;
            y = pad.y - radius;
        }
    }

}
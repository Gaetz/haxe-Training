import hxd.Key in K;

class Pad extends h2d.Bitmap {
    public var vx : Float;

    var speed = 5;
    var maxSpeed = 100;
    var minSpeed = 0.01;
    var deceleration = 0.8;

    public function init() {
        tile.dx = Math.floor(-tile.width / 2);
        x = getScene().width / 2;
        y = getScene().height - tile.height;
        vx = 0;
    }

    public function update(dt: Float) {
        // Controls
        if (K.isDown(K.LEFT)) {
            vx += -speed;
        }
        if (K.isDown(K.RIGHT)) {
            vx += speed;
        }
        // Speed
        if(Math.abs(vx) > maxSpeed) {
            vx = vx > 0 ? maxSpeed : -maxSpeed;
        }
        if(Math.abs(vx) < minSpeed) {
            vx = 0;
        }
        vx = vx * deceleration;
        // Position
        x += vx * dt;
        if(x < tile.width / 2) {
            x = tile.width / 2;
            vx = 0;
        }
        if(x > getScene().width - tile.width / 2) {
            x = getScene().width - tile.width / 2;
            vx = 0;
        }
    }

}
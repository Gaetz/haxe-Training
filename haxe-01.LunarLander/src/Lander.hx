import hxd.Key in K;

class Lander extends h2d.Sprite {
    public var vx : Float;
    public var vy : Float;

    var propulsion : Float = 0.2;
    var gravity : Float = 0.05;
    var rotateSpeed : Float = 0.05;
    var isFireOn : Bool;

    public function init() {
        x = getScene().width / 2;
        y = 100;
        vx = 0;
        vy = 0;
        isFireOn = false;
        rotation = -Math.PI / 2;
    }

    public function update(dt: Float) {
        // Controls
        if (K.isDown(K.UP)) {
            fireOn();
        } else if (K.isReleased(K.UP)) {
            fireOff();
        }
        if (K.isDown(K.LEFT)) {
            rotation += rotateSpeed * dt;
        }
        if (K.isDown(K.RIGHT)) {
            rotation -= rotateSpeed * dt;
        }
        // Behaviout
        if(isFireOn) {
            var xForce = Math.cos(rotation) * propulsion;
            var yForce = Math.sin(rotation) * propulsion;
            vx += xForce;
            vy += yForce;
        }
        // Move and gravity
        vy += gravity;
        x += vx * dt;
        y += vy * dt;
    }

    public function fireOn() {
        getSpriteByName("fire").visible = true;
        isFireOn = true;
    }

    public function fireOff() {
        getSpriteByName("fire").visible = false;
        isFireOn = false;
    }
}
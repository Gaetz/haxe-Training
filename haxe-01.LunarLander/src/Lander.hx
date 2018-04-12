class Lander extends h2d.Sprite {
    public var vx : Float;
    public var vy : Float;

    public function init() {
        x = getScene().width / 2;
        vx = 0;
        vy = 0;
    }

    public function fireOn() {
        getSpriteByName("fire").visible = true;
    }

    public function fireOff() {
        getSpriteByName("fire").visible = false;
    }
}
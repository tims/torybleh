package
{
    import flash.geom.*;
    import mx.core.*;

    public class Scrolling extends GameObject
    {
        // movement speed of the bouncing object
        protected static const speed:Number = 100;

        // direction that the bouncing object should move (1 for right/down, -1 for left/up)
        protected var direction:Point = new Point(-1, 0);

        public function Scrolling(position:Point)
        {
            super(ResourceManager.BrownPlaneGraphics, position);
        }
        
        override public function shutdown():void
        {
            super.shutdown();
        }

        override public function enterFrame(dt:Number):void
        {
            super.enterFrame(dt);
            position.x += direction.x * speed * dt;
            position.y += direction.y * speed * dt;
        }
    }
}

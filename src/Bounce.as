package
{
    import flash.geom.*;
    import mx.core.*;

    public class Bounce extends GameObject
    {
        // movement speed of the bouncing object
        protected static const speed:Number = 100;

        // direction that the bouncing object should move (1 for right/down, -1 for left/up)
        protected var direction:Point = new Point(1, 1);

        public function Bounce()
        {
            super(ResourceManager.BrownPlaneGraphics, new Point(0,0));
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
            if (position.x >= Application.application.width - graphics.bitmap.width)
                direction.x = -1;
            else if (position.x <= 0)
                direction.x = 1;
            if (position.y >= Application.application.height - graphics.bitmap.height)
                direction.y = -1;
            else if (position.y <= 0)
                direction.y = 1;
        }
    }
}

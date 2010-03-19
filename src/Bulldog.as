package
{
    import flash.events.*;
    import flash.geom.*;
    import flash.ui.Keyboard;
    
    import mx.core.*;

    public class Bulldog extends GameObject
    {
        // movement speed of the bouncing object
        protected static const speed:Number = 150;

        // direction that the bouncing object should move (1 for right/down, -1 for left/up)
        protected var direction:Point = new Point(0, 0);

        public function Bulldog()
        {
            super(ResourceManager.BrownPlaneGraphics, new Point(100,250));
        }

        override public function shutdown():void
        {
            super.shutdown();
        }
             
        override public function enterFrame(dt:Number):void
        {
            super.enterFrame(dt);
            position.y += direction.y * speed * dt;
            if (position.y >= Application.application.height - graphics.bitmap.height) {
                position.y = Application.application.height - graphics.bitmap.height;
                direction.y = 0;
            } else if (position.y <= 0) {
                position.y = 0
                direction.y = 0;
            }
        }
        
        override public function keyDown(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.DOWN) {
                direction.y = 1;
            } else if (event.keyCode == Keyboard.UP) {
                direction.y = -1;
            }
        }

        override public function keyUp(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.DOWN && direction.y > 0) {
                direction.y = 0;
            } else if (event.keyCode == Keyboard.UP && direction.y < 0) { 
                direction.y = 0;
            }
        }
    }
}

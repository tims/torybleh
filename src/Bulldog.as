package
{
    import flash.display.BitmapData;
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
            super(ResourceManager.BullyGraphics, new Point(0,100));
        }

        override public function shutdown():void
        {
            super.shutdown();
        }
             
        override public function enterFrame(dt:Number):void
        {
            super.enterFrame(dt);
            position.y += direction.y * speed * dt;
            position.x += direction.x * speed * dt;
            if (position.y >= Application.application.height - graphics.bitmap.height) {
                position.y = Application.application.height - graphics.bitmap.height;
                direction.y = 0;
            } else if (position.y <= 0) {
                position.y = 0
                direction.y = 0;
            }
            if (position.x >= Application.application.width - graphics.bitmap.width) {
                position.x = Application.application.width - graphics.bitmap.width;
                direction.x = 0;
            } else if (position.x <= 0) {
                position.x = 0
                direction.x = 0;
            }
        }
        
        override public function keyDown(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.DOWN) {
                direction.y = 1;
            } else if (event.keyCode == Keyboard.UP) {
                direction.y = -1;
            } else if (event.keyCode == Keyboard.LEFT) {
                direction.x = -1;
            } else if (event.keyCode == Keyboard.RIGHT) {
                direction.x = 1;
            }
        }

        override public function keyUp(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.DOWN && direction.y > 0) {
                direction.y = 0;
            } else if (event.keyCode == Keyboard.UP && direction.y < 0) { 
                direction.y = 0;
            } else if (event.keyCode == Keyboard.LEFT && direction.x < 0) {
                direction.x = 0;
            } else if (event.keyCode == Keyboard.RIGHT && direction.x > 0) {
                direction.x = 0;
            }
        }
    }
}

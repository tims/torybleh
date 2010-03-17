package
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
 
   /*
    The base class for all objects in the game.
    */
    public class GameObject
    {
        // object position
        public var position:Point = new Point(0, 0);

        // higher zOrder objects are rendered on top of lower ones
        public var zOrder:int = 0;

        // the bitmap data to display
        public var graphics:GraphicsResource = null;

        // true if the object is active in the game
        public var inuse:Boolean = false;

        public function GameObject(graphics:GraphicsResource, position:Point, z:int = 0)
        {
            this.graphics = graphics;
            this.zOrder = z;
            this.position = position.clone();
        }

        public function startup():void
        {
            if (!inuse)
            {
                this.inuse = true;
                GameObjectManager.Instance.addGameObject(this);
            }
        }

        public function shutdown():void
        {
            if (inuse)
            {
                graphics = null;
                inuse = false;
                GameObjectManager.Instance.removeGameObject(this);
            }
        }

        public function copyToBackBuffer(db:BitmapData):void
        {
            db.copyPixels(graphics.bitmap, graphics.bitmap.rect, position, graphics.bitmapAlpha, new Point(0, 0), true);
        }

        public function enterFrame(dt:Number):void
        {
        }
    }
}

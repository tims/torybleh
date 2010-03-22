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

        public var collisionArea:Rectangle;

        public var collisionName:String = CollisionIdentifiers.NONE;

        public function GameObject(graphics:GraphicsResource, position:Point, z:int = 0)
        {
            this.graphics = graphics;
            this.zOrder = z;
            this.position = position.clone();
            if (graphics != null)
                this.collisionArea = graphics.bitmap.rect
            else 
                this.collisionArea = new Rectangle(0,0,1,1);
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
            if (graphics != null)
                db.copyPixels(graphics.bitmap, graphics.bitmap.rect, position, graphics.bitmapAlpha, new Point(0, 0), true);
        }

        public function enterFrame(dt:Number):void
        {
        }
        
        public function keyDown(event:KeyboardEvent):void
        {
        }

        public function keyUp(event:KeyboardEvent):void
        {
        }
        
        public function get CollisionArea():Rectangle {
            return new Rectangle(position.x, position.y, collisionArea.width, collisionArea.height);
        }
        
        public function collision(other:GameObject):void {
        }
    }
}

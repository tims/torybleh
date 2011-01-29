package
{
    import flash.geom.*;
    
    import mx.core.*;

    public class Family extends GameObject
    {
        // movement speed
        protected var speed:Number = 100;

        // direction that the bouncing object should move (1 for right/down, -1 for left/up)
        protected var direction:Point = new Point(-1, 0);

        public function Family(speed:Number) {
            this.speed = speed;
            super(ResourceManager.SingleParentFamilyGraphics, new Point(Application.application.width,0), 1);
            position.y = (Application.application.height - graphics.bitmap.height);
            position.y = position.y * Math.random();  
            collisionName = CollisionIdentifiers.ENEMY;
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
            
            if (position.x < -graphics.bitmap.width) {
                shutdown();
            }
        }
        
        override public function collision(other:GameObject):void {
            GameObjectManager.Instance.incrementScore();
            new Blood(position, graphics.bitmap.rect).startup();
            shutdown();
        }
    }
}

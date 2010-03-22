package
{
    import flash.geom.*;
    import flash.media.SoundTransform;
    
    import mx.core.*;

    public class Bark extends GameObject
    {
        public function Bark(p:Point, rect:Rectangle)
        {
            super(null, p);
            this.collisionArea = rect;
            collisionName = CollisionIdentifiers.PLAYERWEAPON;
        }
        
        override public function startup():void
         {
            super.startup();
            var vol:Number = 0.5;
            var sndT:SoundTransform = new SoundTransform(vol)
            if (Math.random() < 0.3) {
                ResourceManager.Bark1FX.play(0, 0, sndT);
            } else {
                ResourceManager.Bark2FX.play(0, 0, sndT);
            }
        }

        override public function shutdown():void
        {
            super.shutdown();
        }
        
        override public function enterFrame(dt:Number):void
        {   
            this.shutdown();
        }
    }
}

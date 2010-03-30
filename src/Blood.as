package
{
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.geom.*;
    import flash.utils.Timer;
    
    import mx.core.*;

    public class Blood extends GameObject
    {
        protected var timer:Timer
        
        public function Blood(p:Point, rect:Rectangle)
        {
            var blood:GraphicsResource = ResourceManager.BloodGraphics;
            var x:Number = (p.x + rect.width / 2) - (blood.bitmap.width / 2)
            var y:Number = (p.y + rect.height / 2) - (blood.bitmap.height / 2)
            var pos:Point = new Point(x, y);
            super(blood, pos, 0);
        }
        
        override public function startup():void
         {
            super.startup();
            timer = new Timer(5000, 1);
            timer.addEventListener(TimerEvent.TIMER, timerTick);
            timer.start();
        }

        public function timerTick(event:Event):void {
            shutdown();
        }
        
        override public function shutdown():void
        {
            super.shutdown();
        }
        
    }
}

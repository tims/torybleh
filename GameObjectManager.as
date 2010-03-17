package
{
    import mx.core.*;
    import mx.collections.*;
    import flash.geom.*;
    import flash.display.*;
    
    public class GameObjectManager
    {
        // double buffer
        public var backBuffer:BitmapData;

        // colour to use to clear backbuffer with
        public var clearColor:uint = 0xFF0043AB;

        // static instance
        protected static var instance:GameObjectManager = null;

        // the last frame time
        protected var lastFrame:Date;

        // a collection of the GameObjects
        protected var gameObjects:ArrayCollection = new ArrayCollection();
 
        // a collection where new GameObjects are placed, to avoid adding items
        // to gameObjects while in the gameObjects collection while it is in a loop
        protected var newGameObjects:ArrayCollection = new ArrayCollection();
        
        // a collection where removed GameObjects are placed, to avoid removing items
        // to gameObjects while in the gameObjects collection while it is in a loop
        protected var removedGameObjects:ArrayCollection = new ArrayCollection();        
        
        static public function get Instance():GameObjectManager
        {
            if ( instance == null )
                    instance = new GameObjectManager();
            return instance;
        }

        public function GameObjectManager()
        {
            if ( instance != null )
                throw new Error( "Only one Singleton instance should be instantiated" );
            backBuffer = new BitmapData(Application.application.width, Application.application.height, false);
        }

        public function startup():void
        {
            lastFrame = new Date();
            new Bounce().startup();
            new Scrolling(new Point(700,300)).startup();
            new Scrolling(new Point(600,200)).startup();
            new Scrolling(new Point(800,250)).startup();
        }

        public function shutdown():void
        {
            shutdownAll();
        }

        public function enterFrame():void
        {
            // Calculate the time since the last frame
            var thisFrame:Date = new Date();
            var seconds:Number = (thisFrame.getTime() - lastFrame.getTime())/1000.0;
            lastFrame = thisFrame;

            removeDeletedGameObjects();
            insertNewGameObjects();
            // now allow objects to update themselves
            for each (var gameObject:GameObject in gameObjects)
            {
                if (gameObject.inuse)
                    gameObject.enterFrame(seconds);
            }
            drawObjects();
        }

        protected function drawObjects():void
        {
            backBuffer.fillRect(backBuffer.rect, clearColor);
            // draw the objects
            for each (var gameObject:GameObject in gameObjects)
            {
                if (gameObject.inuse)
                    gameObject.copyToBackBuffer(backBuffer);
            }
        }

        public function addGameObject(gameObject:GameObject):void
        {
            newGameObjects.addItem(gameObject);
        }

        public function removeGameObject(gameObject:GameObject):void
        {
            removedGameObjects.addItem(gameObject);
        }

        protected function shutdownAll():void
        {
            // don't dispose objects twice
            for each (var gameObject:GameObject in gameObjects)
            {
                var found:Boolean = false;
                for each (var removedObject:GameObject in removedGameObjects)
                {
                    if (removedObject == gameObject)
                    {
                        found = true;
                        break;
                    }
                }
                if (!found)
                    gameObject.shutdown();
            }
        }

        protected function insertNewGameObjects():void
        {
            for each (var gameObject:GameObject in newGameObjects)
            {
                for (var i:int = 0; i < gameObjects.length; ++i)
                {
                    if (gameObjects.getItemAt(i).zOrder > gameObject.zOrder ||
                    gameObjects.getItemAt(i).zOrder == -1)
                    break;
                }
                gameObjects.addItemAt(gameObject, i);
            }
            newGameObjects.removeAll();
        }

        protected function removeDeletedGameObjects():void
        {
            // insert the object acording to it's z position
            for each (var removedObject:GameObject in removedGameObjects)
            {
                var i:int = 0;
                for (i = 0; i < gameObjects.length; ++i)
                {
                    if (gameObjects.getItemAt(i) == removedObject)
                    {
                        gameObjects.removeItemAt(i);
                        break;
                    }
                }
            }
            removedGameObjects.removeAll();
        }
    }
}



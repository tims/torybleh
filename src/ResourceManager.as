package
{
    import flash.display.*;
    public final class ResourceManager
    {
        [Embed(source="../media/brownplane.png")]
        public static var BrownPlane:Class;
        public static var BrownPlaneGraphics:GraphicsResource = new GraphicsResource(new BrownPlane());
        [Embed(source="../media/bully.gif")]
        public static var Bully:Class;
        public static var BullyGraphics:GraphicsResource = new GraphicsResource(new Bully());
    }
}

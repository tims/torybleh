package
{
    import flash.display.*;
    public final class ResourceManager
    {
        [Embed(source="../media/brownplane.png")]
        public static var BrownPlane:Class;
        public static var BrownPlaneGraphics:GraphicsResource = new GraphicsResource(new BrownPlane());
    }
}

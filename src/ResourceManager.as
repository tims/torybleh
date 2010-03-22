package
{
    import flash.display.*;
    import mx.core.SoundAsset;
    
    public final class ResourceManager
    {
        [Embed(source="../media/singleparent_fam_sml.png")]
        public static var SingleParentFamily:Class;
        public static var SingleParentFamilyGraphics:GraphicsResource = new GraphicsResource(new SingleParentFamily());
        
        [Embed(source="../media/bully_t_sml.gif")]
        public static var Bully:Class;
        public static var BullyGraphics:GraphicsResource = new GraphicsResource(new Bully());
        
        [Embed(source="../media/bully_bark1.mp3")]
        public static var Bark1Sound:Class;
        public static var Bark1FX:SoundAsset = new Bark1Sound() as SoundAsset;

        [Embed(source="../media/bully_bark2.mp3")]
        public static var Bark2Sound:Class;
        public static var Bark2FX:SoundAsset = new Bark2Sound() as SoundAsset;
    }
}

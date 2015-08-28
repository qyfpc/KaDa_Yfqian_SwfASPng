package Yfqian
{
	import flash.display.BitmapData;
	import flash.display.PNGEncoderOptions;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	public class Yfqian_saveImage
	{
		public static function saveImage(path:String,bitmapdata:BitmapData):void{
			try{
				var bytes:ByteArray = bitmapdata.encode(new Rectangle(0,0,bitmapdata.width,bitmapdata.height),new PNGEncoderOptions());
				var file:File = new File(path);
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.WRITE);
				fs.writeBytes(bytes);
				fs.close();
			} 
			catch(error:Error) {
				trace(path);
			}
		}
	}
}
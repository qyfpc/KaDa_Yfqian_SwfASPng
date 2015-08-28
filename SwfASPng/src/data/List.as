package data
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.filesystem.File;
	import flash.utils.Timer;

	public class List
	{
		public static var MaxW:int;
		public static var MaxH:int;
		
		public static var loader:Loader
		public static var fileSwf:File;
		public static var fileMuLu:File;
		public static var GameSwfMUi:Sprite;
		public static var GameDT:Sprite;
		public static var 是否循环:int;
		public static var McMaxH:int;
		public static var McMaxW:int;
		
		public static var McMaxNum:int;
		public static var McNum:int;
		public static var McTimer:Timer;
		public static var McTimeNum:int=30;
		public static var McTime:int=int(1000/McTimeNum);
	}
}
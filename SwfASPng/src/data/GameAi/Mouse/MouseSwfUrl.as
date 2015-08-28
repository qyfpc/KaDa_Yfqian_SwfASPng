package data.GameAi.Mouse
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.FileFilter;
	import flash.net.URLRequest;
	
	import Yfqian.Yfqian_gotoAndStop;
	
	import data.List;
	import data.GameUi.GameKDUi;

	public class MouseSwfUrl
	{

		public function MouseSwfUrl()
		{
			
			var imageTypes:FileFilter = new FileFilter("选择一个Swf", "*.Swf");
			var allTypes:Array = new Array(imageTypes);					
			List.fileSwf=new File();
			List.fileSwf.browse(allTypes);//浏览
			List.fileSwf.addEventListener(Event.SELECT,selected);//添加“选择文件”事件

		}
		private function selected(e:Event):void
		{
			GameKDUi.S_getSwf_text=List.fileSwf.nativePath;
			ListUp();
			
		}
		public var One:int
		public function ListUp():void
		{

			One=0;
			if(List.GameSwfMUi!=null)
			{		
				swfASPng.gameSwc.gameSwf.removeChild(List.GameSwfMUi);	
				List.GameSwfMUi=null;
			}
			List.GameSwfMUi = new Sprite();
			swfASPng.gameSwc.gameSwf.addChild(List.GameSwfMUi);		
			
			List.loader = new Loader();
			List.loader.load(new URLRequest(GameKDUi.S_getSwf_text));
			List.GameSwfMUi.addChild(List.loader);
			
			
			trace(List.GameSwfMUi.width,swfASPng.gameSwc.gameSwf.width)
			List.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			GameKDUi.S_getSwf_idtext.text=GameKDUi.S_getSwf_text;

			function loadComplete(e:Event):void
			{
				var mc:MovieClip = e.target.content as MovieClip;
				var mcNum:int=(mc.getChildAt(0) as  MovieClip).totalFrames;

				GameKDUi.S_getBig=(mc.getChildAt(0) as  MovieClip).totalFrames;
				GameKDUi.S_getsmall=1;

				
				for (var w:int = 0; w < mcNum; w++) {
					Yfqian_gotoAndStop.gotoAndStop(w,(mc.getChildAt(0) as  MovieClip))
				}

				 SwfLog.SwfPlay();
			}
		}
	}
}
package data.GameAi.Mouse
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import Yfqian.Yfqian_gotoAndStop;
	
	import data.List;
	import data.GameUi.GameKDUi;

	public class SwfLog
	{
		public function SwfLog()
		{
			
		}
		public static function SwfPlay(SwfMcNum:int=1):void
		{
			
			if(List.GameSwfMUi!=null)
			{		
				swfASPng.gameSwc.gameSwf.removeChild(List.GameSwfMUi);	
				List.GameSwfMUi=null;
			}
			List.GameSwfMUi = new Sprite();
			swfASPng.gameSwc.gameSwf.addChild(List.GameSwfMUi);		
			
			List.loader = new Loader();
			List.loader.load(new URLRequest(GameKDUi.S_getSwf_text));
			List.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			List.GameSwfMUi.addChild(List.loader);

			var McObj:MovieClip;
			
			
			function loadComplete(e:Event):void
			{

				var mc:MovieClip = e.target.content as MovieClip;
				var mcNum:int=(mc.getChildAt(0) as  MovieClip).totalFrames;				
				McObj=(mc.getChildAt(0) as  MovieClip);
				McObj.addEventListener(Event.ENTER_FRAME,listComplete);
				GameKDUi.S_width=String(mc.width);
				GameKDUi.S_height=String(mc.height);
				
				GameKDUi.S_setsmall.text=String(1);
				GameKDUi.S_setBig.text=String((mc.getChildAt(0) as  MovieClip).totalFrames);
				
				List.是否循环=1;

			}

			function listComplete(e:Event):void
			{
				if(List.是否循环==1){
					GameKDUi.S_getsmall=McObj.currentFrame
				}else{
					McObj.removeEventListener(Event.ENTER_FRAME,listComplete);	
				}
			}	
		}
		public static function SwfStop(SwfMcNum:int=1):void
		{
			
			if(List.GameSwfMUi!=null)
			{		
				swfASPng.gameSwc.gameSwf.removeChild(List.GameSwfMUi);	
				List.GameSwfMUi=null;
			}
			
			List.GameSwfMUi = new Sprite();
			swfASPng.gameSwc.gameSwf.addChild(List.GameSwfMUi);		
			
			List.loader = new Loader();
			List.loader.load(new URLRequest(GameKDUi.S_getSwf_text));
			List.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
			List.GameSwfMUi.addChild(List.loader);
						
			
			function loadComplete(e:Event):void
			{
				
				var mc:MovieClip = e.target.content as MovieClip;
				var mcNum:int=(mc.getChildAt(0) as  MovieClip).totalFrames;				
				
				GameKDUi.S_width=String(mc.width);
				GameKDUi.S_height=String(mc.height);
				
				
				Yfqian_gotoAndStop.gotoAndStop(SwfMcNum,(mc.getChildAt(0) as  MovieClip))
				
				GameKDUi.S_setsmall.text=String(1);
				GameKDUi.S_setBig.text=String((mc.getChildAt(0) as  MovieClip).totalFrames);
				
				
				List.是否循环=2;
			}
		}
	}
}
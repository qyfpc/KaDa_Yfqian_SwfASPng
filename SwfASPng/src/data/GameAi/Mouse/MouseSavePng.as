package data.GameAi.Mouse
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import Yfqian.Yfqian_gotoAndStop;
	import Yfqian.Yfqian_saveImage;
	
	import data.List;
	import data.GameUi.GameKDUi;

	public class MouseSavePng
	{
		public static function MouseSaveOne(imgNum:int):void
		{
			List.是否循环=2;
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
				
				
				Yfqian_gotoAndStop.gotoAndStop(imgNum,(mc.getChildAt(0) as  MovieClip))
				
				GameKDUi.S_setsmall.text=String(1);
				GameKDUi.S_setBig.text=String((mc.getChildAt(0) as  MovieClip).totalFrames);
				
				

				
				
				var bitmapdata:BitmapData = new BitmapData(int(List.McMaxW),int(List.McMaxH),true,0);
				bitmapdata.draw(mc);
				var imgUrl:String;
				if(swfASPng.gameSwc.gameui.srname.text!=="无")
				{
					imgUrl=GameKDUi.S_setlist_text.text+"\\"+swfASPng.gameSwc.gameui.srname.text+imgNum+".png"
				}
				else
				{
					imgUrl=GameKDUi.S_setlist_text.text+"\\咔哒转换"+imgNum+".png"
				}
				Yfqian_saveImage.saveImage(imgUrl,bitmapdata)
				
				trace(imgUrl)
			}
		}
		public static function MouseSaveAll():void
		{
			List.是否循环=2;
			var MinNum:int=int(swfASPng.gameSwc.gameui.sri.text);
			var MaxNum:int=int(swfASPng.gameSwc.gameui.srm.text);
			
			for(var i:int=MinNum;i<MaxNum+1;i++){
				loadfor(i);

			}
			function loadfor(imgNum:int):void{
				trace(1111)
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
					
					Yfqian_gotoAndStop.gotoAndStop(imgNum,(mc.getChildAt(0) as  MovieClip))
					
					GameKDUi.S_width=String(mc.width);
					GameKDUi.S_height=String(mc.height);
					
					GameKDUi.S_setsmall.text=String(1);
					GameKDUi.S_setBig.text=String((mc.getChildAt(0) as  MovieClip).totalFrames);
					
					var bitmapdata:BitmapData = new BitmapData(int(List.McMaxW),int(List.McMaxH),true,0);
					bitmapdata.draw(mc);
					var imgUrl:String;
					if(swfASPng.gameSwc.gameui.srname.text!=="无")
					{
						imgUrl=GameKDUi.S_setlist_text.text+"\\"+swfASPng.gameSwc.gameui.srname.text+imgNum+".png"
					}
					else
					{
						imgUrl=GameKDUi.S_setlist_text.text+"\\咔哒转换"+imgNum+".png"
					}
					Yfqian_saveImage.saveImage(imgUrl,bitmapdata)
				}
			}

		}
		public static function MouseSaveceshi(imgNum:int):void
		{
			var bitmapdata:BitmapData = new BitmapData(int(List.McMaxW),int(List.McMaxH),true,0);
			bitmapdata.draw(List.GameSwfMUi);
			var imgUrl:String;
			if(swfASPng.gameSwc.gameui.srname.text!=="无")
			{
				imgUrl=GameKDUi.S_setlist_text.text+"\\"+swfASPng.gameSwc.gameui.srname.text+imgNum+".png"
			}
			else
			{
				imgUrl=GameKDUi.S_setlist_text.text+"\\咔哒转换"+imgNum+".png"
			}
			Yfqian_saveImage.saveImage(imgUrl,bitmapdata)
		}
	}
}
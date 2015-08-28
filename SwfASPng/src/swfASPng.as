package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import data.List;
	import data.logDH.logDH;
	

	[SWF(width="960",height="640",backgroundColor="#ffffff")]	
	
	public class swfASPng extends Sprite
	{
		public static var gameSwc:gameMax;
		public static var Maxstage:Stage;
		public function swfASPng()
		{
			super();	

			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.color = 0x747474;
			stage.frameRate = 60;
			List.MaxW=960;
			List.MaxH=640;
			swfASPng.Maxstage=stage;
			gameSwc=new gameMax();
			this.addChild(gameSwc);
			new logDH();//加载ui资源
			
			
		}
	}
}
package Yfqian
{
	import flash.display.MovieClip;
	
	import data.List;

	/**
	 * 用户扫描mc下面的全部动画元件*/
	public class Yfqian_gotoAndStop
	{
		public static var McMax:int=0;
		public static function gotoAndStop(frame:int,mc:MovieClip):void{

			if(frame == -1)
				mc.stop();
			else
				if(McMax<=int(mc.numChildren))
				{
					McMax=int(mc.numChildren);
				}
			mc.gotoAndStop(frame);
			var numChildren:int = mc.numChildren;
			for (var i:int = 0; i < numChildren; i++) {
				if(mc.getChildAt(i) is MovieClip){
					gotoAndStop(-1,mc.getChildAt(i) as MovieClip);
				}
				if(int(mc.getChildAt(i).x+mc.getChildAt(i).width)>=int(List.McMaxW))
				{
					List.McMaxW=int(mc.getChildAt(i).x+mc.getChildAt(i).width);
				}
				if(int(mc.getChildAt(i).y+mc.getChildAt(i).height)>=List.McMaxH)
				{
					List.McMaxH=int(mc.getChildAt(i).y+mc.getChildAt(i).height);
				}

			}
			swfASPng.gameSwc.gameui.srw.text=String(List.McMaxW);
			swfASPng.gameSwc.gameui.srh.text=String(List.McMaxH);
//			swfASPng.gameSwc.gameSwf.width=List.McMaxW;
//			swfASPng.gameSwc.gameSwf.height=List.McMaxH;
		}
	}
}


package data.logDH
{
	import com.greensock.TweenMax;
	
	import flash.utils.setTimeout;
	
	import data.GameAi.GameKDAi;

	public class logDH extends GameKDAi
	{
		public function logDH()
		{
			trace(swfASPng.gameSwc)
			setTimeout(function():void{		
				TweenMax.to(swfASPng.gameSwc.gameuilog, 1,{ alpha:0});	
				setTimeout(function():void{	
					swfASPng.gameSwc.removeChild(swfASPng.gameSwc.gameuilog)
				},1000);
			},2000);

		}
	}
}
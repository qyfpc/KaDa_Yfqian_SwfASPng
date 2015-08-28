package data.GameAi
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	
	import data.List;
	import data.GameAi.Mouse.MouseSavePng;
	import data.GameAi.Mouse.MouseSwfMuLu;
	import data.GameAi.Mouse.MouseSwfUrl;
	import data.GameAi.Mouse.SwfLog;
	import data.GameUi.GameKDUi;

	public class GameKDAi extends GameKDUi
	{			
		public var circleTimer:Timer;
		public function GameKDAi()
		{
			S_getSwf.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_getSwf);
			S_setlist.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_setlist);
			
			S_up.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_up);
			S_down.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_down);
			S_start.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_start);
			S_Pause.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_Pause);
			S_save.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_save);
			S_getall.addEventListener(MouseEvent.MOUSE_DOWN,KDAi_S_getall);
			
			swfASPng.gameSwc.addEventListener(Event.ENTER_FRAME, GameEvent);

			swfASPng.Maxstage.frameRate=24;
			

		}

		public function KDAi_S_getSwf(e:MouseEvent):void{
			new MouseSwfUrl();
							
		}
		public function KDAi_S_setlist(e:MouseEvent):void{
			new MouseSwfMuLu();
			
		}
		public function KDAi_S_up(e:MouseEvent):void{
			if(S_getSwf_idtext.text!=='尚未加入Swf')
			{
				if(S_getsmall-1>=1)
				{
					S_getsmall--;
					SwfLog.SwfStop(S_getsmall);
					if(S_Pause.visible==false){
						S_save.visible=true;
					}
					S_start.visible=true;
					S_Pause.visible=false;

				}
			}
			
		}
		public function KDAi_S_start(e:MouseEvent):void{
			if(S_getSwf_idtext.text!=='尚未加入Swf')
			{
				SwfLog.SwfPlay();
				S_start.visible=false;
				S_Pause.visible=true;
				S_save.visible=false;
			}
			
		}
		
		public function KDAi_S_Pause(e:MouseEvent):void{
			if(S_getSwf_idtext.text!=='尚未加入Swf')
			{
				SwfLog.SwfStop(S_getsmall);
				S_start.visible=true;
				S_Pause.visible=false;
				
			}
			
		}
		
		public function KDAi_S_down(e:MouseEvent):void{
			if(S_getSwf_idtext.text!=='尚未加入Swf')
			{
				if(S_getsmall+1<=S_getBig)
				{
					S_getsmall++;
					SwfLog.SwfStop(S_getsmall);
					if(S_Pause.visible==false){
						S_save.visible=true;
					}
					S_start.visible=true;
					S_Pause.visible=false;
					
				}
			}
		}
		public function KDAi_S_save(e:MouseEvent):void{
			if(S_getSwf_idtext.text!=='尚未加入Swf')
			{	
				MouseSavePng.MouseSaveOne(S_getsmall);
			}
		}
		
		public function KDAi_S_getall(e:MouseEvent):void{
			if(S_getSwf_idtext.text!=='尚未加入Swf')
			{			
				var MinNum:int=int(swfASPng.gameSwc.gameui.sri.text);
				var MaxNum:int=int(swfASPng.gameSwc.gameui.srm.text);
				if(MinNum<=MaxNum){
					MouseSavePng.MouseSaveAll();
				}
			}
		}
		public function GameEvent(e:Event):void
		{
			List.McTime=int(1000/List.McTimeNum)
			S_gettext.text=S_getsmall+"/"+S_getBig;
			if((960-int(List.McMaxW))>=1){
				swfASPng.gameSwc.gameSwf.x=(960-int(List.McMaxW))/2;
			}
		}
	}
}


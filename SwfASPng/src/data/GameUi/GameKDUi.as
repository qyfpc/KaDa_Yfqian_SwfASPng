package data.GameUi
{
	import flash.display.Loader;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.utils.setTimeout;
	
	import Yfqian.Yfqian_SaveALoad;

	

	public class GameKDUi
	{
		public static var S_getSwf:*;
		public static var S_setlist:*;
		public static var S_up:*;
		public static var S_down:*;
		public static var S_start:*;
		public static var S_Pause:*;
		public static var S_save:*;
		public static var S_getall:*;
		public static var S_name:*;
		public static var S_height:*;
		public static var S_width:*;
		public static var S_setBig:*;
		public static var S_setsmall:*;
		public static var S_gettext:*;
		public static var S_getBig:int;//最大帧
		public static var S_getsmall:int;//当前帧
		public static var S_getSwf_text:*;
		public static var S_setlist_text:*;
		public static var S_getSwf_idtext:*;


		public function GameKDUi(){
			swfASPng.gameSwc.gameSwf.mouseChildren=swfASPng.gameSwc.gameSwf.mouseEnabled=false;
			S_getSwf=swfASPng.gameSwc.gameui.an1//导入swf
			S_setlist=swfASPng.gameSwc.gameui.an2//选择导出目录
			S_up =swfASPng.gameSwc.gameui.an3//上一帧
			S_down=swfASPng.gameSwc.gameui.an4//下一帧
			S_start=swfASPng.gameSwc.gameui.an5//下一帧
			S_Pause=swfASPng.gameSwc.gameui.an6//暂停
			S_save=swfASPng.gameSwc.gameui.an7//保存
			S_getall=swfASPng.gameSwc.gameui.an8//导出全部		
			swfASPng.gameSwc.gameSwf.y=140;
				
			S_name=swfASPng.gameSwc.gameui.srname//命名
			S_height=swfASPng.gameSwc.gameui.srh	//高度
			S_width=swfASPng.gameSwc.gameui.srw//宽度
			S_setBig=swfASPng.gameSwc.gameui.srm//帧小
			S_setsmall=swfASPng.gameSwc.gameui.sri//帧大
			S_gettext=swfASPng.gameSwc.gameui.srxl//当前swf帧数

			S_getSwf_idtext=swfASPng.gameSwc.gameui.wz1//导入swf文字
			S_setlist_text=swfASPng.gameSwc.gameui.wz2//选择导出目录文字
			S_getBig=0;
			S_getsmall=0;
			S_gettext.text=S_getBig+"/"+S_getsmall;
			S_name.text="咔哒工具";
			S_height.text="自动";
			S_width.text="自动";
			S_setBig.text="自动";
			S_setsmall.text="自动";
			
			S_getSwf_idtext.text="尚未加入Swf"
				trace(1111)
			if(Yfqian_SaveALoad.get('wenzi2log')==null)
			{
				S_setlist_text.text='C:\\yfqian\\kada\\png';
			}
			else
			{
				S_setlist_text.text=Yfqian_SaveALoad.get('wenzi2log');
			}
				
			GameText(S_name,false);
			GameText(S_height);
			GameText(S_width);
			GameText(S_setBig);
			GameText(S_setsmall);
			
			GameKDAnDH(S_getSwf);
			GameKDAnDH(S_setlist);
			GameKDAnDH(S_up);
			GameKDAnDH(S_down);
			GameKDAnDH(S_start);
			GameKDAnDH(S_Pause);
			GameKDAnDH(S_save);
			GameKDAnDH(S_getall);
			S_start.visible=false;
			S_save.visible=false;
			
		}
		public function GameKDAnDH(an:Object):void{
			　an.addEventListener(MouseEvent.MOUSE_DOWN,function():void{
				an.scaleX=an.scaleY=0.5
				setTimeout(function():void{
					an.scaleX=an.scaleY=1
				},100)
			});
			
		}
		
		public function GameText(text:Object,rest:Boolean=true):void{

			if(rest==true){
				text.restrict = "0-9^ "
				text.maxChars=5;
			}else{
				text.restrict = "0-9 a-z A-Z _^ "
				text.maxChars=12;
			}
			　text.addEventListener(MouseEvent.MOUSE_DOWN,function():void{
				text.text="";
			});
		}
	}
}
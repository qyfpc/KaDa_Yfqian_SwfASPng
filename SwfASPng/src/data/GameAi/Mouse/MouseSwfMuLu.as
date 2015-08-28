package data.GameAi.Mouse
{
	import flash.events.Event;
	import flash.filesystem.File;
	
	import Yfqian.Yfqian_SaveALoad;
	
	import data.List;
	import data.GameUi.GameKDUi;

	public class MouseSwfMuLu
	{
		public function MouseSwfMuLu()
		{
			List.fileMuLu=new File();
			List.fileMuLu.browseForDirectory("选择一个目录");
			List.fileMuLu.addEventListener(Event.SELECT,selected);//添加“选择文件”事件

		}
		private function selected(e:Event):void
		{
			GameKDUi.S_setlist_text.text=List.fileMuLu.nativePath;
			Yfqian_SaveALoad.set('wenzi2log',GameKDUi.S_setlist_text.text)
		}
	}
}
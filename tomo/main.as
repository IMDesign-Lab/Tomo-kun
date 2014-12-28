package  {
	
	import flash.display.*;
	import flash.desktop.*;
	import flash.events.*;
	import flash.filesystem.*;
	import flash.text.*;
	import flash.system.*;
	import flash.utils.*;
	import flash.media.*;
	import flash.net.*;
	import flash.text.*;
	import flash.utils.*;
	import fl.video.*;
	import flash.events.*;
	import mx.utils.*;
	import spark.effects.Move;
	import flash.geom.*;
	import mx.effects.easing.Back;
	
	
	public class main extends MovieClip {
		/*変数関連*/
		//http://dev.yuichiroharai.com/post/actionscript-registration-point-change/
		private var video_Num: Number = 1; //ビデオの数
		private var video_count: Number; //現在のビデオを数をカウントするやつ
		private var fadeUnit: Number = 0; //フェードの加減する数
		private var startTime: Number; //wavのスタートするタイマー


		private var video: Array = ["C:\\Users\\E440-2grade-PC\\Desktop\\IDS_movie.mp4"]; //ビデオのファイルたちの格納する配列
		private var kinect_array: Array = [];
		private var speech_array: Array = [];

		private var bytes: ByteArray; //音声データ入れるもの
		private var wavBytes: ByteArray; //wavファイル


		private var kinect_process: NativeProcess;
		private var kinect_nativeProcessStartupInfo: NativeProcessStartupInfo;
		private var kinect_fileName: String = 'C:\\Users\\E440-2grade-PC\\Documents\\GitHub\\interactive_digitalSignage\\Bin64\\Release\\kinect_core64.exe'; //アプリケーション
		private var kinect_file: File = File.applicationDirectory.resolvePath(kinect_fileName);


		private var player = new VideoPlayer();
		//private var tf: TextField = new TextField();

		public var add: RegExp = new RegExp("Add_User_1"); //kinectコンソール
		public var lost: RegExp = new RegExp("Lost_user_1"); //kinectコンソール
		public var ske: RegExp = new RegExp("ske,1,"); //kinectコンソール
		public var pattern: RegExp = /ske,/gi; //"ske,"を全部削除

		/*public var Lkinect_obj : Loader = new Loader();
		public var Rkinect_obj : Loader = new Loader();
		public var Lkinect_url : URLRequest = new URLRequest("L-kinect.png");
		public var Rkinect_url : URLRequest = new URLRequest("R-kinect.png");
		*/

		public var add_answer: Boolean;
		public var lost_answer: Boolean;
		public var ske_answer: Boolean;
		public var ske2_answer: Boolean;


		private var video_Path: String; //再生中のもの
		private var contents_name: String; //コンテンツの名前
		private var contents_name2: String; //コンテンツの名前

		private var kinect_console: String; //kinectのconsoleの変数
		private var kinect_ske: String;
		private var kinect_Rske: String;




		private var mic: Microphone;
		private var sound: Sound;
		private static const record: int = 5; //録音時間
		private var kinect_0: int = 0;
		private var kinect_1: int = 0;
		private var kinect_2: int = 0;
		private var contents_n: int = 0;
		private var c_sx: Number = 0;
		private var c_sy: Number = 0;
		private var c_x: int = 0;
		private var c_y: int = 0;
		private var c_width: int = 1000;
		private var c_height: int = 1000;
		private var kinect_L_handan: int = 0;
		private var kinect_R_handan: int = 0;
		private var not_found_db: int = 0;

		private var kinect_L_x_tmp: Array = [];
		private var kinect_L_y_tmp: Array = [];
		private var kinect_R_x_tmp: Array = [];
		private var kinect_R_y_tmp: Array = [];


		private var enc: Base64Encoder = new Base64Encoder();
		private var LCircleArray: Array = new Array;
		private var RCircleArray: Array = new Array;
		private var ZoomCirleArray: Array = new Array;
		//private var Kinect_zoom:kinect_zoom = new kinect_zoom();


		private var shape = new Shape(); //線書くのに必要
		private var g = shape.graphics; //線書くのに必要

		//private var contents_url: URLRequest;
		private var contents_loader_obj: Loader;
		private var contents_url: URLRequest;
		
		private var x_tmp:int =0;
		private var y_tmp:int =0;
		
		
		public var filePath:String;
		public var loader:URLLoader;
		
		
		public var bx: Array = new Array;
		public var by: Array = new Array;
		public var ax: Array = new Array;
		public var ay: Array = new Array;
		public var xml_contents_array: Array = new Array;
		

		public var tmp_wavBytes = new ByteArray;
		public var xml:XML;
		public var xml_length:uint=0;
		public var xml_found:uint=0;
		public var xml_count:uint=0;
		public var xml_contents:uint=0;
		
		private var L_kinect: l_kinect = new l_kinect();
		private var R_kinect: r_kinect = new r_kinect();
		private var menu_pic: menu_pict = new menu_pict();//menu画像のなんか
		//private var menu_picArray: Array = new Array;
		
		private var fadeType:String;

		
		public function main() {
			stop(); //シーンが出てこないようにおまじない
			
			//menu_picArray.push(menu_pic);
			//gotoAndStop(1, "シーン 2");
			
			//menu();
			op_video();
			kinect();
		}//main
		
		/*##########################ビデオ処理###############################*/
		
		//Stageのリサイズに合わせる
		public function resizeHandler(event: Event = null): void {
			trace("ビデオリサイズ");
			player.width = stage.stageWidth;
			player.height = stage.stageHeight;
		} //resizehandler

		public function fullScreenHandler(event: FullScreenEvent): void {
			//trace("フルスクリーン");
			if (!event.fullScreen) resizeHandler();
		} //fullscreenHandler

		public function videoChange(event: fl.video.VideoEvent) {
			//trace("ビデオ変更");
			if (video_count < video_Num - 1) {
				video_count++;
				video_Path = video[video_count].toString();
				player.play(video_Path);
			} else {
				video_count = 0;
				video_Path = video[video_count].toString();
				player.play(video_Path);
			}
		} //videochange
		
		public function op_video() {
			trace("ビデオ起動");
			player.volume = 1; //ビデオの再生
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			//player.scaleMode = VideoScaleMode.MAINTAIN_ASPECT_RATIO;
			//stage.addEventListener(Event.RESIZE, resizeHandler);
			//stage.addEventListener(FullScreenEvent.FULL_SCREEN, fullScreenHandler);
			resizeHandler();
			video_count = 0;
			video_Path = video[video_count].toString();
			stage.addChild(player);
			stage.setChildIndex(player, 0);
			player.play(video_Path);
			player.addEventListener(fl.video.VideoEvent.COMPLETE, videoChange);
		} //on_video
		
	  /*##########################ビデオ処理###############################*/
		
	  /*##########################Kinect処理###############################*/
		
		public function kinect() {
			kinect_process = new NativeProcess();
			kinect_nativeProcessStartupInfo = new NativeProcessStartupInfo();
			kinect_nativeProcessStartupInfo.executable = kinect_file;
			kinect_process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, kinect_onOutputData);
			kinect_process.start(kinect_nativeProcessStartupInfo);
			trace("NaitiveProcess起動");
		} //kinect
		
		public function kinect_onOutputData(event: ProgressEvent): void {
			kinect_console = kinect_process.standardOutput.readUTFBytes(kinect_process.standardOutput.bytesAvailable);
			add_answer = add.test(kinect_console);
			lost_answer = lost.test(kinect_console);
			ske_answer = ske.test(kinect_console);

			if (add_answer == true) {
				trace("人認識");
				player.stop();
				gotoAndStop(1, "シーン 2");
				stage.addChild(menu_pic);
				menu();
			} else if (lost_answer == true) {
				trace("人認識解除");
				player.play(video_Path);
				menu_pic.addEventListener(Event.ENTER_FRAME,menu_pic_FadeSymbolOut);

			} else if (ske_answer == true) {
				kinect_ske = kinect_console;
				LCircleArray.push(L_kinect);
				RCircleArray.push(R_kinect);
				stage.addChild(LCircleArray[0]);
				stage.addChild(RCircleArray[0]);
				g.lineStyle(5, 0x0CBF56, 100);
				kinect_p();

			} //kinect_onOutputData_if

		} //kinect_onOutputData
		
		public function kinect_p() {

			kinect_Rske = kinect_ske.replace(pattern, ""); //最終的に表示
			//trace(kinect_Rske);
			kinect_array = kinect_Rske.split(",");

			if (kinect_array[1] == 0) { //通常認識
				if (kinect_2 == 1) {
					g.clear();
					//stage.removeChild(shape);
					kinect_2 = 0;
				}

				kinect_0 = 1;
				//画面の比率に合わせる
				//kinect_array[5]->右L
				//kinect_array[6]->右R
				LCircleArray[0].x = int(parseInt(kinect_array[2]) * 2);
				LCircleArray[0].y = int(parseInt(kinect_array[3]) * 2.25);
				RCircleArray[0].x = int(parseInt(kinect_array[5]) * 2);
				RCircleArray[0].y = int(parseInt(kinect_array[6]) * 2.25);
				//trace("X="+(int(parseInt(kinect_array[2]) * 2))+"Y="+(int(parseInt(kinect_array[3]) * 2.25)));
				stage.addChild(LCircleArray[0]);
				stage.addChild(RCircleArray[0]);
			
				
				 /*##########################左手を上に上げたら###############################*/
				if(int(parseInt(kinect_array[3]) * 2.25)<=40){
					if(contents_n == 1){
						contents_loader_obj.unload();
						contents_n=0;
					}
						gotoAndStop(1, "シーン 2");
						//web_api();
				}
				/*##########################左手を上に上げたら###############################*/
				
				/*##########################xmlがある時###############################*/
				if(xml_found==1){
					for (var i:uint = 0; i < xml_length; i++) {
						if(int(parseInt(kinect_array[5]) * 2)<=parseInt(bx[i]) && int(parseInt(kinect_array[5]) * 2)>=parseInt(ax[i]) && int(parseInt(kinect_array[6]) * 2.25)<=parseInt(by[i]) && int(parseInt(kinect_array[6]) * 2.25)>=parseInt(ay[i])){
								var start: uint = getTimer();
								while (getTimer() - start < xml_count) {
										if(int(parseInt(kinect_array[5]) * 2)>=parseInt(bx[i]) && int(parseInt(kinect_array[5]) * 2)<=parseInt(ax[i]) && int(parseInt(kinect_array[6]) * 2.25)>=parseInt(by[i]) && int(parseInt(kinect_array[6]) * 2.25)<=parseInt(ay[i])){
											kinect_p();
										}
									//load処理
									xml_contents=i;
									//contents_view();
									
								}
						}else{
							//何も処理をしないので何も書かない。
						
						}
					
					}
					
				}
				/*##########################xmlがある時###############################*/				

			}//kinect_array[1]


			//%d,2,%f,%f,%f,%f,%f,%f,%f,%f
			if (kinect_array[1] == 1) {
				kinect_1 = 1;
				//trace("片手処理");
				if (kinect_2 == 1) {
					//g.clear();
					//stage.removeChild(shape);
					kinect_2 = 0;
				}
				if (contents_n == 1) {
					//trace("片手=>コンテンツは読み込み済み");
						trace(kinect_array);
						contents_loader_obj.x = parseInt(kinect_array[8]);
						contents_loader_obj.y = parseInt(kinect_array[9]);	
						trace("片手:コンテンツ:X=" +parseInt(kinect_array[8])+ "Y=" +parseInt(kinect_array[9]));

					
					//stage.addChild(contents_loader_obj);
				}
				LCircleArray[0].x = int(parseInt(kinect_array[2]) * 2);
				LCircleArray[0].y = int(parseInt(kinect_array[3]) * 2.25);
				RCircleArray[0].x = int(parseInt(kinect_array[4]) * 2);
				RCircleArray[0].y = int(parseInt(kinect_array[5]) * 2.25);
			}

			//プレイヤー,mode(2),LX,LY,RX,RY,ScaleX,ScaleY->6,7
			if (kinect_array[1] == 2) {
				trace("両手処理");
				kinect_2 = 1;

				if (contents_n == 1) { //画像が読み込んだら
					//trace("両手=>コンテンツは読み込み済み");	
						contents_loader_obj.scaleX = Number(kinect_array[8]);
						contents_loader_obj.scaleY = Number(kinect_array[8]);
						trace("スケール=" +Number(kinect_array[8]));

				}

				LCircleArray[0].x = int(parseInt(kinect_array[2]) * 2);
				LCircleArray[0].y = int(parseInt(kinect_array[3]) * 2.25);
				RCircleArray[0].x = int(parseInt(kinect_array[5]) * 2);
				RCircleArray[0].y = int(parseInt(kinect_array[6]) * 2.25);

			}


		} //kinect_p
		
		/*##########################xmlがある時###############################*/
		
		/*##########################menu###############################*/
		public function menu() {
			trace("menu");
			//フェード
			stage.addChild(menu_pic);//最背面に移動　http://morishige.jp/blog/archives/99
			stage.setChildIndex(menu_pic, 1);
			fadeType = "in";
			menu_pic.addEventListener(Event.ENTER_FRAME,menu_pic_FadeSymbolIn);
			menu_pic.alpha = 0;
			//フェードここまで
		}
		
		
		/*###########################フェイドイン関係###########################*/		

			function menu_pic_FadeSymbolIn(event:Event)//文字のフェード
			{
				menu_pic.alpha += 0.05;
				if(menu_pic.alpha >= 1)
				{
					menu_pic.removeEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolIn);
				}
			}//fl_FadeSymbolin
			function menu_pic_FadeSymbolOut(event:Event)//文字のフェード
			{
				menu_pic.alpha -= 0.05;
				
				if(menu_pic.alpha <= 0)
				{
					menu_pic.removeEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolOut);
					kinect_remove();
					gotoAndStop(1, "シーン 1");
					speech_array = [];

					
				}
			}//fl_FadeSymbolOut
			
		/*######################################################################*/	
			
		public function kinect_remove() {
				stage.removeChild(LCircleArray[0]);
				stage.removeChild(RCircleArray[0]);
				
		}
		

			

	} //main

}
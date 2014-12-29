package {

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
		private var kinect_fileName: String = 'kinect_core64.exe'; //アプリケーション
		private var kinect_file: File = File.applicationDirectory.resolvePath(kinect_fileName);


		private var player = new VideoPlayer();
		//private var tf: TextField = new TextField();

		public var add: RegExp = new RegExp("Add_User_1"); //kinectコンソール
		public var lost: RegExp = new RegExp("Lost_user_1"); //kinectコンソール
		public var ske: RegExp = new RegExp("ske,1,"); //kinectコンソール
		public var pattern: RegExp = /ske,/gi; //"ske,"を全部削除



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

		private var x_tmp: int = 0;
		private var y_tmp: int = 0;


		public var filePath: String;
		public var loader: URLLoader;


		public var bx: Array = new Array;
		public var by: Array = new Array;
		public var ax: Array = new Array;
		public var ay: Array = new Array;
		public var xml_contents_array: Array = new Array;


		public var tmp_wavBytes = new ByteArray;
		public var xml: XML;
		public var xml_length: uint = 0;
		public var xml_found: uint = 0;
		public var xml_count: uint = 0;
		public var xml_contents: uint = 0;

		private var L_kinect: l_kinect = new l_kinect();
		private var R_kinect: r_kinect = new r_kinect();
		private var menu_pic: menu_pict = new menu_pict(); //menu画像のなんか
		//private var menu_picArray: Array = new Array;

		private var fadeType: String;
		private var kinect_pointer_add: Boolean = false;
		private var kinect_user_out: Boolean = false;
		private var menu_in: Boolean = false;


		public function main() {
			stop(); //シーンが出てこないようにおまじない
			gotoAndStop(1, "シーン 2");
			//stage.addChild(menu_pic);
			menu();
			//menu_picArray.push(menu_pic);
			//gotoAndStop(1, "シーン 2");

			//menu();
			//op_video();
			//kinect();



		} //main

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
				kinect_user_out = true;
				menu_pic.addEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolOut);

			} else if (ske_answer == true) {
				kinect_ske = kinect_console;
				kinect_pointer_add = true;
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
				if (int(parseInt(kinect_array[3]) * 2.25) <= 40) {
					if (contents_n == 1) {
						contents_loader_obj.unload();
						contents_n = 0;
					}
					gotoAndStop(1, "シーン 2");
					//web_api();
				}
				/*##########################左手を上に上げたら###############################*/

				/*##########################xmlがある時###############################*/
				if (xml_found == 1) {
					for (var i: uint = 0; i < xml_length; i++) {
						if (int(parseInt(kinect_array[5]) * 2) <= parseInt(bx[i]) && int(parseInt(kinect_array[5]) * 2) >= parseInt(ax[i]) && int(parseInt(kinect_array[6]) * 2.25) <= parseInt(by[i]) && int(parseInt(kinect_array[6]) * 2.25) >= parseInt(ay[i])) {
							var start: uint = getTimer();
							while (getTimer() - start < xml_count) {
								if (int(parseInt(kinect_array[5]) * 2) >= parseInt(bx[i]) && int(parseInt(kinect_array[5]) * 2) <= parseInt(ax[i]) && int(parseInt(kinect_array[6]) * 2.25) >= parseInt(by[i]) && int(parseInt(kinect_array[6]) * 2.25) <= parseInt(ay[i])) {
									kinect_p();
								}
								//load処理
								xml_contents = i;
								//contents_view();

							}
						} else {
							//何も処理をしないので何も書かない。

						}

					}

				}
				/*##########################xmlがある時###############################*/

			} //kinect_array[1]


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
					trace("片手:コンテンツ:X=" + parseInt(kinect_array[8]) + "Y=" + parseInt(kinect_array[9]));


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
					trace("スケール=" + Number(kinect_array[8]));

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
			/*##########################フェード###############################*/
			menu_in=true;
			menu_pic.alpha = 0;
			menu_tx1.alpha = 0;
			menu_tx2.alpha = 0;
			stage.addChild(menu_pic); //最背面に移動　http://morishige.jp/blog/archives/99
			stage.setChildIndex(menu_pic, 0);
			menu_pic.addEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolIn);

			/*##########################フェード###############################*/
		}


		/*###########################フェイドイン関係###########################*/

		function menu_pic_FadeSymbolIn(event: Event) //文字のフェード
		{
			menu_pic.alpha += 0.05;
			menu_tx1.alpha += 0.05;
			menu_tx2.alpha += 0.05;
			if (menu_pic.alpha >= 1) //フェードインが終わったら
			{
				menu_pic.removeEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolIn);
				//音声処理
				/*
				bytes = new ByteArray;
				mic = Microphone.getMicrophone();
				mic.rate = 44.1; //44.1khz
				mic.gain = 90; //ゲイン
				mic.setSilenceLevel(0, 0);
				mic.setUseEchoSuppression(true);
				mic.setLoopBack(true);
				mic.addEventListener(SampleDataEvent.SAMPLE_DATA, mic_Data);
				mic.addEventListener(ActivityEvent.ACTIVITY, mic_onstart);
				*/

				//wavバイパス
				var tmp_loader: URLLoader = new URLLoader;
				tmp_loader.dataFormat = URLLoaderDataFormat.BINARY;
				tmp_loader.addEventListener(Event.COMPLETE, tmp_wav_onComplete);
				tmp_loader.load(new URLRequest("C:\\Users\\E440-2grade-PC\\Desktop\\あの行.wav"));

				function tmp_wav_onComplete(e: Event): void {
					tmp_wavBytes = ByteArray(tmp_loader.data);
					tmp_wavBytes.endian = Endian.LITTLE_ENDIAN;
					trace("たぶんwavファイル読み込み完了");
					web_send();
					//tmp_wavBytes.position=0;
				}

			}
		} //fl_FadeSymbolin
		function menu_pic_FadeSymbolOut(event: Event) //文字のフェード
		{
			if (kinect_user_out == true) {
				menu_pic.alpha -= 0.05;
				menu_tx1.alpha -= 0.05;
				menu_tx2.alpha -= 0.05;
				if (menu_pic.alpha <= 0 || menu_tx1.alpha <= 0 || menu_tx2.alpha <= 0) {
						menu_pic.removeEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolOut);
						kinect_remove();
						speech_array = [];
						kinect_user_out = false;
						gotoAndStop(1, "シーン 1");
					}
			}else{
				menu_pic.alpha -= 0.05;
				menu_tx1.alpha -= 0.05;
				menu_tx2.alpha -= 0.05;
				if (menu_pic.alpha <= 0) {
					if(menu_in==true){
						gotoAndStop(1, "シーン 3");
						stage.addChild(contents_loader_obj);
						stage.setChildIndex(contents_loader_obj, 0);
						menu_in=false;
					}
					menu_pic.removeEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolOut);
				}

			}
		} //fl_FadeSymbolOut

		/*######################################################################*/

		public function kinect_remove() {
			if (kinect_pointer_add == true) {
				stage.removeChild(LCircleArray[0]);
				stage.removeChild(RCircleArray[0]);
				kinect_pointer_add == false;
			}

		} //kinect_remove

		public function mic_onstart(e: ActivityEvent) { //タイマー作成→録音開始
			startTime = (new Date).getTime();
			addEventListener(Event.ENTER_FRAME, sound_f);
		} //mic_onstart

		public function mic_Data(e: SampleDataEvent): void { //音→byteArray
			bytes.writeBytes(e.data);
		} //mic_Data


		private function sound_f(e: Event): void {
			var now: Number = (new Date).getTime();
			var diff: int = (now - startTime) * 0.001;
			if (diff >= record) {
				removeEventListener(Event.ENTER_FRAME, sound_f);
				mic.removeEventListener(SampleDataEvent.SAMPLE_DATA, mic_Data);
				mic.setLoopBack(false);

				// wav用に変換
				var wave: ByteArray = new ByteArray;
				wave.endian = Endian.LITTLE_ENDIAN;
				var len: int = bytes.length * 0.25;
				bytes.position = 0;
				for (var i: int = 0; i < len; i++) {
					var data: int = bytes.readFloat() * 32767;
					wave.writeShort(data);
					wave.writeShort(data);

				}

				//wav用ByteArrayの作成
				wavBytes = new ByteArray;
				wavBytes.endian = Endian.LITTLE_ENDIAN;
				wave.position = 0;
				len = wave.length;
				wavBytes.writeUTFBytes("RIFF");
				wavBytes.writeInt(len + 36);
				wavBytes.writeUTFBytes("WAVE");
				wavBytes.writeUTFBytes("fmt ");
				wavBytes.writeInt(16);
				wavBytes.writeShort(1);
				wavBytes.writeShort(2);
				wavBytes.writeInt(44100);
				wavBytes.writeInt(176400);
				wavBytes.writeShort(4);
				wavBytes.writeShort(16);
				wavBytes.writeUTFBytes("data");
				wavBytes.writeInt(len);
				wavBytes.writeBytes(wave);

			} //sound_f_if

		} //sound_f

		public function web_send() { //webで検索・・・(POST)
			trace("検索中");

			var variables: URLVariables = new URLVariables();
			//var urlRequest:URLRequest = new URLRequest("http://encrypted.sbf-ki17cb.com:12000/wsa/speech.php");
			var urlRequest: URLRequest = new URLRequest("http://10.10.4.138/design_content.php");
			var urlLoader: URLLoader = new URLLoader();

			//enc.encodeBytes(wavBytes); //base64に変換
			enc.encodeBytes(tmp_wavBytes); //base64に変換
			variables.wav = enc.flush();
			urlRequest.method = URLRequestMethod.POST;
			urlRequest.data = variables;


			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.addEventListener(Event.COMPLETE, web_onComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, web_onError);
			urlLoader.load(urlRequest);

			function web_onComplete(e: Event): void //成功したら・・・・
			{
				var urlLoader: URLLoader = e.target as URLLoader;
				var result: String = urlLoader.data as String;
				urlLoader.removeEventListener(Event.COMPLETE, web_onComplete);

				trace(result);
				speech_array = result.split(",");
				if (speech_array[1] == undefined) {
					not_found_db = 1;

					//stage.addChild(sk);
					//text1.text = "検索結果から、データベースに情報がありませんでした\n左手を上に上げ、もう一回検索してください。\n左手を上げて検索する場合は画面が変わったら左手を下げてください。\n検索ワード=>"+speech_array[0];

					//web_api();
				} else if (speech_array[2] == "1") {
					xml_found = 1;
					loader = new URLLoader();
					loader.dataFormat = URLLoaderDataFormat.TEXT;
					loader.addEventListener(Event.COMPLETE, complete, false, 0, true);
					var filePath: String = "../img/" + speech_array[3];
					trace(filePath);
					loader.load(new URLRequest(filePath));

					function complete(evt: Event): void {
						var src: String = evt.target.data;
						trace(parse(src));

					}

					function parse(src: String): String {
						xml = new XML(src);
						var str: String = "";
						xml_length = xml.button.length();
						for (var n: uint = 0; n < xml.button.length(); n++) {
							var button: XML = xml.button[n];
							var bx1: String = button.@bx;
							var by1: String = button.@by;
							var ax1: String = button.@ax;
							var ay1: String = button.@ay;
							bx.push(bx1);
							by.push(by1);
							ax.push(ax1);
							ay.push(ay1);
							xml_contents_array.push(button);
							str += button + " bx=" + bx1 + " by=" + by1 + " ax=" + ax1 + " ay=" + ay1 + "\n";
						}　 //実行する順番は重要
						contents_name = speech_array[0];
						trace("parse->"+speech_array[0]);
						contents_view();
						return str;

					}

				} else {
					contents_name = speech_array[0];

					contents_view();

				}
			} //web_onComplete

			function web_onError(e: IOErrorEvent): void {} //onError

		} //web_soushin

		public function contents_view() { //コンテンツ表示
			trace("contents_view");
			contents_loader_obj = new Loader();
			//gotoAndStop(1, "onsei");
			//gotoAndStop(1, "シーン 3");


			// ローダーインフォを取得
			var info: LoaderInfo = contents_loader_obj.contentLoaderInfo;

			info.addEventListener(Event.OPEN, LoaderInfoOpenFunc);
			function LoaderInfoOpenFunc(event: Event): void {
				trace("読み込みを開始した");
			}

			info.addEventListener(ProgressEvent.PROGRESS, LoaderInfoProgressFunc);
			function LoaderInfoProgressFunc(event: ProgressEvent): void {

				//trace("読込:" + event.bytesLoaded);
				//trace("全体:" + event.bytesTotal);
				//text1.text="パーセント:" + Math.floor(event.bytesLoaded / event.bytesTotal * 100);
				//trace("パーセント:" + Math.floor(event.bytesLoaded / event.bytesTotal * 100));

			}

			info.addEventListener(Event.INIT, LoaderInfoInitFunc);
			function LoaderInfoInitFunc(event: Event): void {
				//trace("読み込んだコンテンツの初期化が行われた");
			}

			info.addEventListener(Event.COMPLETE, LoaderInfoCompleteFunc);
			function LoaderInfoCompleteFunc(event: Event): void {
				//trace("読み込み完了");
				//trace("幅 : " + info.width);
				//trace("高さ : " + info.height);
				c_width = info.width;
				c_height = info.height;

			}

			info.addEventListener(IOErrorEvent.IO_ERROR, LoaderInfoIOErrorFunc);
			function LoaderInfoIOErrorFunc(event: IOErrorEvent): void {
				//text1.text = "ファイルエラー";
				trace("ファイル入出力のエラー");
			}

			// 読み込み開始
			//contents_name="1.swf";
			/*if (xml_contents <= 1) {
				contents_name = xml_contents_array[xml_contents];
			}*/

			

			contents_name2 = "../img/" + contents_name;
			trace("読み込み->"+contents_name2);

			//text1.text = "ファイル名=" + contents_name2;
			contents_url = new URLRequest(contents_name2);




			//x,yは表示させる場所
			var color_transform: ColorTransform = new ColorTransform();
			color_transform.color = 0x000000;
			//contents_loader_obj.scaleX = 1;
			//contents_loader_obj.scaleY = 1;


			contents_loader_obj.load(contents_url);
			if(menu_in==true){
				menu_pic.addEventListener(Event.ENTER_FRAME, menu_pic_FadeSymbolOut);
				//menu_in=false;
			}else{
				stage.addChild(contents_loader_obj);
				stage.setChildIndex(contents_loader_obj, 0);
			}
			
			trace("画像読み込み完了");
			//text1.text="読み込み完了";
			if (xml_found == 1) {
				trace("if->xml_found");
				make_square();
			}

		} //contents_view

		public function make_square() {
			var shape = new Shape();
			stage.addChild(shape);
			var g = shape.graphics;
			g.lineStyle(1, 0x000000, 1.0); // 線のスタイル指定
			g.beginFill(0xFF0000, 0.2); // 面のスタイル設定
			for (var i: uint = 0; i < xml_length; i++) {
				var b_x: int = bx.shift();
				var b_y: int = by.shift();
				var a_x: int = ax.shift();
				var a_y: int = ay.shift();
				//trace("bx="+b_x+"by="+b_y+"ax="+a_x+"ay="+a_y+"\n");
				g.drawRect(b_x, b_y, (a_x - b_x), (a_y - b_y));
			}
			//xml_length=0;
			//xml_found=0;


		} //make_square

	} //main

}
package
{
	import flash.display.MovieClip;
	import flash.desktop.*;
	import flash.display.*;
	import flash.events.*;
	import flash.filesystem.File;
	import flash.geom.ColorTransform;
	import flash.media.Microphone;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.*;
	import flash.filesystem.*;
	import flash.media.*;
	import fl.video.*;
	
	public class main extends MovieClip
	{
		public var nativeProcessStartupInfo:NativeProcessStartupInfo; 
		public var file:File = File.applicationDirectory.resolvePath('k.exe'); 
		public var bytes:ByteArray = new ByteArray();
		public var process: NativeProcess;
		public var add: RegExp = new RegExp("Add,"); //kinectコンソール
		public var lost: RegExp = new RegExp("Lost,"); //kinectコンソール
		public var ske: RegExp = new RegExp("ske,"); //kinectコンソール
		public var pattern_s: RegExp = /ske,/gi;
		public var add_a: Boolean;
		public var lost_a: Boolean;
		public var ske_a: Boolean;
		
		public var video_Num: Number = 1; //ビデオの数
		public var video_count: Number; //現在のビデオを数をカウントするやつ
		public var player = new VideoPlayer();
		public var video_Path: String; //再生中のもの
		public var video: Array = ["C:\\Users\\E440-2grade-PC\\Desktop\\オープニング.mp4"];
		
		public var user_counter: Array = [0,0,0,0,0,0,0,0];//8人で考えれば十分だろ
		public var now_user:uint=0;
		
		public function main()
		{
			stop();
			//バツ押したらプログラムを終わらせるイベント
			stage.nativeWindow.addEventListener(Event.CLOSING, onClosingEvent);
			video_play();
			kinect_process();
		}

		public function resizeHandler(event: Event = null): void
		{
			trace("ビデオリサイズ");
			player.width = stage.stageWidth;
			player.height = stage.stageHeight;
		}

		public function fullScreenHandler(event: FullScreenEvent): void 
		{
			if (!event.fullScreen) resizeHandler();
		}

		public function videoChange(event: fl.video.VideoEvent)
		{
			//trace("ビデオ変更");
			if (video_count < video_Num - 1) 
			{
				video_count++;
				video_Path = video[video_count].toString();
				player.play(video_Path);
			} 
			else
			{
				video_count = 0;
				video_Path = video[video_count].toString();
				player.play(video_Path);
			}
		}

		public function video_play()
		{
			trace("ビデオ起動");
			player.volume = 1; //ビデオの再生
			stage.displayState = StageDisplayState.FULL_SCREEN;
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			player.scaleMode = VideoScaleMode.MAINTAIN_ASPECT_RATIO;
			stage.addEventListener(Event.RESIZE, resizeHandler);
			stage.addEventListener(FullScreenEvent.FULL_SCREEN, fullScreenHandler);
			resizeHandler();
			video_count = 0;
			video_Path = video[video_count].toString();
			stage.addChild(player);
			stage.setChildIndex(player, 0);
			player.play(video_Path);
			player.addEventListener(fl.video.VideoEvent.COMPLETE, videoChange);
		} //on_video
		
		public function kinect_process():void
		{ 
			process = new NativeProcess(); 
			nativeProcessStartupInfo = new NativeProcessStartupInfo();
			nativeProcessStartupInfo.executable = file;
			
			//標準出力のイベント
			process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, dataHandler);
			
			process.start(nativeProcessStartupInfo);
			trace("NaitiveProcess起動");
		}
			
		public function dataHandler(event:ProgressEvent):void//kinectからデータを貰う
		{ 
			//console=process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable);
			//こいつのせいで入れ子みたいになるんだよなぁ
			console_string(process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable));
			
		}
		
		public function kinect_process_input(input:String):void//標準出力ができるならできる
		{
			process.standardInput.writeUTFBytes(input+"\n");
			trace("input実行->"+input);
		}
		
		public function onClosingEvent(e:Event):void
		{
			//終わり処理
			process.exit();
		}
		
		public function console_string(c:String):void
		{
			add_a = add.test(c);
			lost_a = lost.test(c);
			ske_a = ske.test(c);
			var stopper:Boolean=false;//変な動きしたら怪しそう
			
			
			
			if (add_a == true)
			{
				//配列0のところになんか入れる
				//一人目なら変数に入れるがそれ以外は配列に入れるのみ
				trace(c);
				var add_array:Array = c.split(",");
				
				for(var i:uint=0;i<8;i++)
				{
					if(user_counter[i]==0 && stopper==false)
					{
						user_counter[i]=add_array[1];
						stopper=true;
					}
				}
				
				if(user_counter[1]==0)
				{
					now_user=user_counter[0];
				}
				
				//次の処理に行く
				trace(now_user);
				stage.removeChild(player);
				
			}
			else if (lost_a == true)
			{
				//配列から削除する
				//配列に他のユーザが居るか判断して変数に入れる
				trace(c);
				var lost_array:Array = c.split(",");
				
				if(now_user!=0)
				{
					for(var i:uint=0;i<8;i++)
					{
						if(lost_array[1]==user_counter[i])
						{
							user_counter[i]=0;
						}
					}
					
					//ユーザをどれにするか決める
					if(now_user!=0 && now_user!=1)
					{
						for(var j:uint=0;j<8;j++)//頭悪いからもう一回やる
						{
							if(user_counter[i]!=0 && stopper==false)
							{
								now_user=user_counter[i];
								stopper=true;
							}
						}
						
						if(stopper==false)//配列が全部0なら
						{
							now_user=0;
							//ビデオの処理に戻る
							stage.addChild(player);
							player.play(video_Path);
					
						}
						
						trace("現在のユーザー -> "+now_user);
					}
				}
				
			}
			else if (ske_a == true)
			{
				//そっから先頭のやつをskeで判断できるように変数を使って判断
				trace(c);
				
				var ske_array:Array = c.split(",");
				
				if(ske_array[1]==now_user)
				{
					
					pointer(c.replace(pattern_s, ""));//ポインター関係はここではやらない
				}
				
			}
		}
		
		public function pointer(pointer_string:Array):void
		{
			//プレイヤー,0,左X,左Y,左Z,右X,右Y,右Z
			
		}

	}
}
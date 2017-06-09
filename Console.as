package priv.yakiler.hf.uitl.chrome
{
	import flash.external.ExternalInterface;

	/**
	 * Chrome版本日志打印工具，它将调用chrome的console相应的函数来打印日志内容。
	 * <br/>调用此方法请确保您的应用程序运行在html中。
	 * 
	 * */
	public class Console
	{
		public function Console()
		{
		}
		
		/**
		 * 呼叫js并传递相关方法和参数
		 * */
		public static function callJs( functionName:String, ...arg ):*
		{
			ExternalInterface.call( functionName, arg );
		}
		
		/**
		 * 当参数foo的表达式值返回false时，向控制台打印一段信息。
		 * @param foo: 一个返回boolean的表达式
		 * @param object:表达式返回false时，需要打印在控制台的信息
		 * */
		public static function assert( foo:Boolean, object:Object ):void
		{
			var params:String = "";
			params += "" + foo + "," + JSON.stringify(object);
			var funName:String = "function fun(object){console.assert("+params+")}";
			trace(funName);
			callJs( funName, object );
		}
		
		/**
		 * 清空控制台打印信息
		 * */
		public static function clear():void
		{
			callJs( "function (){console.clear()}" );
		}
		
		/**
		 * 统计一个函数或变量使用的次数
		 * @param object 被统计的变量
		 * */
		public static function count( object:*, ...arg ):void
		{
			var params:String = arrayToString(arg);
			params = "'" + object + "'," + params;
			var funName:String = "function (object){console.count("+params+")}";
			callJs( funName );
		}
		
		/**
		 * 和log的作用相同,输出调试信息
		 * */
		public static function debug( ...arg ):void
		{
			var params:String = arrayToString( arg );
			var funName:String = "function(...arg){console.debug("+params+")}";
			callJs( funName, arg );
		}
		
		/**
		 * 输出以 JavaScript 形式表示的指定对象。如果正在记录的对象是 HTML 元素，将输出其以 DOM 形式表示的属性
		 * */
		public static function dir( value:* ):void
		{
			var params:String = objectToString( value );
			var funName:String = "function(...arg){console.dir('"+params+"')}";
			callJs( funName );
		}
		
		/**
		 * 如果可以，输出 object 子级元素的 XML 表示形式，否则输出其 JavaScript 表示形式。
		 * 在 HTML 和 XML 元素上调用 console.dirxml() 等同于调用 console.log()
		 * */
		public static function dirxml( value:* ):void
		{
			var params:String = objectToString( value );
			var funName:String = "function(...arg){console.dirxml('"+params+"')}";
			callJs( funName );
		}
		
		/**
		 * 输出一条类似于 console.log() 的消息，将消息设置成错误样式，并在调用此方法的地方包含一个堆叠追踪。
		 * */
		public static function error( ...arg ):void
		{
			var params:String = arrayToString( arg );
			var funName:String = "function(...arg){console.error("+params+")}";
			callJs( funName, arg );
		}
		
		/**
		 * 启动一个带有可选标题的新日志组。
		 * 以可视化方式将在 console.group() 后、console.groupEnd() 前发生的所有控制台输出组合在一起
		 * */
		public static function group( groupName:String, ...arg ):void
		{
			groupName = apostropheEscaped(groupName);
			var params:String = arrayToString( arg );
			params = "'" + groupName + "'," + params;
			var funName:String = "function(groupName,...arg){console.group("+params+")}";
			callJs( funName, arg );
		}
		
		/**
		 * 创建一个初始处于折叠状态而不是打开状态的新日志组
		 * */
		public static function groupCollapsed( groupName:String, ...arg ):void
		{
			groupName = apostropheEscaped(groupName);
			var params:String = arrayToString( arg );
			params = "'" + groupName + "'," + params;
			var funName:String = "function(groupName,...arg){console.groupCollapsed("+params+")}";
			callJs( funName, arg );
		}
		
		/**
		 * 关闭日志组
		 * */
		public static function groupEnd():void
		{
			var funName:String = "function(){console.group()}";
			callJs( funName );
		}
		
		/**
		 * 输出一条类似 console.log() 的消息，但同时在输出旁显示一个图标（带白色“i”的蓝色圆圈）。
		 * */
		public static function info( ...arg ):void
		{
			var params:String = arrayToString( arg );
			var funName:String = "function(...arg){console.info("+params+")}";
			callJs( funName, arg );
		}
		
		/**
		 * 在控制台中显示一条消息。将一个或多个对象传递到此方法。每个对象都会进行评估并级联到一个由空格分隔的字符串中。
		 * */
		public static function log( ...arg ):void
		{
			var params:String = arrayToString( arg );
			var funName:String = "function(...arg){console.log("+params+")}";
			callJs( funName, arg );
		}
		
		/**
		 * 启动一个带有可选标签的 JavaScript CPU 配置文件。
		 * 要完成配置文件，请调用 console.profileEnd()。
		 *  每一个配置文件都会添加到 Profiles 面板中。
		 * */
		public static function profile():void
		{
			var funName:String = "function(){console.profile()}";
			callJs( funName );
		}
		
		/**
		 * 停止当前的 JavaScript CPU 分析会话（如果正在进行此会话），并将报告输出到 Profiles 面板中。
		 * */
		public static function profileEnd():void
		{
			var funName:String = "function(){console.profileEnd()}";
			callJs( funName );
		}
		
		/**
		 * 启动一个具有关联标签的新计时器。使用相同标签调用 console.timeEnd() 时，定时器将停止，
		 * 经过的时间将显示在控制台中。计时器值精确到亚毫秒。
		 * 传递到 time() 和 timeEnd() 的字符串必须匹配，否则计时器不会结束。
		 * */
		public static function time( startSign:String ):void
		{
			var funName:String = "function(startSign){console.time(startSign)}";
			callJs( funName, startSign );
		}
		
		/**
		 * 停止当前的计时器（如果正在运行一个计时器），并将计时器标签和经过的时间输出到控制台。
		 * */
		public static function timeEnd( startSign:String ):void
		{
			var funName:String = "function(startSign){console.timeEnd(startSign)}";
			callJs( funName, startSign );
		}
		
		/**
		 * 在录制会话期间向 Timeline 添加一个事件。
		 * */
		public static function timeStamp(stameSign:String):void
		{
			var funName:String = "function(stameSign){console.timeStamp(stameSign)}";
			callJs( funName, stameSign );
		}
		
		/**
		 * 从调用此方法的位置输出一个堆叠追踪。
		 * */
		public static function traceInJs(object:*):void
		{
			var params:String = objectToString( object );
			var funName:String = "function(...arg){console.dir('"+params+"')}";
			callJs( funName );
		}
		
		/**
		 * 暂时未找到chrome devtools官方API注释，个人理解是表格化日志输出。
		 * */
		public static function table( object:* ):void
		{
			var params:String = objectToString( object );
			var funName:String = "function(object){console.dir(object)}";
			callJs( funName );
		}
		
		/**
		 * 将数组参数转换为字符串参数
		 * */
		public static function arrayToString( args:Array ):String
		{
			var params:String = "";
			for (var i:int = 0; i < args.length; i++) 
			{
				if( (args[i]+'').search(",") > -1 )
				{
					args[i] = (args[i]+'').replace("'","\\'");
					args[i] = '"' + args[i] + '"';
				}
				var str:String = args[i].toString();
				if( str.search( /\[object/ ) > -1 )
				{
					args[i] += '.toString():' + JSON.stringify(args[i]) + ':end';
				}
				params += (i == 0 ? "'" : ",'") + args[i] + "'";	
			}
			return params;
		}
		
		/**
		 * 单引号转义，当函数的参数为string时可能携带单引号，因为日志函数通常是以单引号包围参数的形式，所以需要转义。
		 * */
		public static function apostropheEscaped( origin:String ):String
		{
			return origin.replace("'","\\'");
		}
		
		/**
		 * 将object对象转为字符串参数，并在js中反序列化为object
		 * */
		public static function objectToString( object:Object ):String
		{
			if( object is String ) return apostropheEscaped(object.toString());
			var params:String = "" + object;
			var str:String = object.toString();
			if( str.search( /\[object/ ) > -1 )
			{
				params += '.toString():' + JSON.stringify(object) + ':end';
			}
			return params;
		}
	}
}
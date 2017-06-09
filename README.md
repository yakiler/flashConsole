# flashConsole
一个用于flash web的调试工具
## 这是一个flash web 日志工具
它可以让您像html那样使用console下的例如log()函数来打印变量，并查看它的相关属性。
————————————————————————————————————————
### 好了让我们看看怎么使用它
如果您需要打印一个自定义对象，它看起来应该像这样
```actionscript
    Class CustomObjecct
    {
        public var customParam:String = "I'm a custom param";
    }
    Class MainClass
    {
        var customObject:CustomObject = new CustomObject();
        Console.log( customObject );
    }
```
<img src="https://raw.githubusercontent.com/yakiler/MyAssets/master/consolePreview.png"/>

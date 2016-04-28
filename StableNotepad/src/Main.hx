package;

import flash.utils.ByteArray;
import flash.net.FileReference;
import flash.events.Event;

import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.InputText;

import openfl.display.Sprite;
import openfl.Lib;

/*
 * Welcome everone to StableNotepad, a notepad made in Haxe and Stablexui.
 * This isn't the best notepad, but it's a start for bigger and better projects,
 * if anyone chooses to. Feel free to edit this all you want and make it better, or 
 * use it for your own projects.
 * 
 * 
 * */


/**
 * ...
 * @author Anguel Esperanza
 */
class Main extends Sprite 
{

	
	var fr:FileReference;
	
	
	public function new() 
	{
		super();
		

		
		UIBuilder.init();
		
		flash.Lib.current.addChild(UIBuilder.buildFn('ui.xml')());	
	}
	
	
	private function loadClicked():Void
	{
		fr = new FileReference();
		
		fr.addEventListener(Event.SELECT, onFileSelect);
		
		fr.addEventListener(Event.CANCEL, cancelFile);
		
		fr.browse();
	}
	
	private function onFileSelect(e:Event)
	{
		fr.addEventListener(Event.COMPLETE, afterLoad);
		fr.load();
	}
	
	
	private function cancelFile(e:Event):Void
	{
		fr = null;
	}
	
	private function afterLoad(e:Event):Void
	{
		
		
		var data:ByteArray = fr.data;
		
		UIBuilder.getAs('textBox', InputText).text = data.readUTFBytes(data.bytesAvailable);
		
	}
	
}

package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	public class BuscarCatalogoEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "BuscarCatalogoEvent";
		public var autor:String;
		public var descripcion:String;
		public var editorial:String;
		public var tema:String;
		public var isbn:String;
		public var buscaComienzo:Boolean;
		[Bindable]
		public var receptor:String;
		
		public function BuscarCatalogoEvent(autor:String,descripcion:String,editorial:String,tema:String,
		isbn:String,buscaComienzo:Boolean, receptor:String){
			super(EVENT_NAME);
			this.autor=autor;
			this.descripcion=descripcion;
			this.editorial=editorial;
			this.tema=tema;
			this.isbn=isbn;
			this.buscaComienzo=buscaComienzo;	
			this.receptor=receptor;
		}

	}
}
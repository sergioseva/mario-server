package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class ImprimirPedidoItemsEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "ImprimirPedidoItemsEvent";
		public var pedidoItems:Array;
		public var distribuidora:String
		
		public function ImprimirPedidoItemsEvent(items:Array,distribuidora:String)
		{
			super(EVENT_NAME);
			this.pedidoItems=items;
			this.distribuidora=distribuidora;
		}
		
	}
}
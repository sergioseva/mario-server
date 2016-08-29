package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	public class BuscarItemsPedidosADistribuidorasEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "BuscarItemsPedidosADistribuidorasEvent";
		public var pendientes:Boolean;
		
		
		public function BuscarItemsPedidosADistribuidorasEvent(pendientes:Boolean){
			super(EVENT_NAME);
			this.pendientes=pendientes;
			}

	}
}
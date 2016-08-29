package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import modules.pedidos.vo.ClienteVO;
	
	public class BuscarLibrosPedidosEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "BuscarLibrosPedidosEvent";
		
		
		public function BuscarLibrosPedidosEvent()
		{
			super(EVENT_NAME);			
		}

	}
}
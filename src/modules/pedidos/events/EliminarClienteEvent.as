package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.ClienteVO;

	public class EliminarClienteEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "EliminarClienteEvent";
		public var cliente:ClienteVO;
		
		public function EliminarClienteEvent(cliente:ClienteVO)
		{
			super(EVENT_NAME);
			this.cliente=cliente;
		}
		
	}
}
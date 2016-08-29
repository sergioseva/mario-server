package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.ClienteVO;

	public class ActualizarClienteEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "ActualizarClienteEvent";
		public var cliente:ClienteVO;
		
		public function ActualizarClienteEvent(cliente:ClienteVO)
		{
			super(EVENT_NAME);
			this.cliente=cliente;
		}
		
	}
}
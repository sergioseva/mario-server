package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.ClienteVO;

	public class InsertarClienteEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "InsertarClienteEvent";
		public var cliente:ClienteVO;
		
		public function InsertarClienteEvent(cliente:ClienteVO)
		{
			super(EVENT_NAME);
			this.cliente=cliente;
		}
		
	}
}
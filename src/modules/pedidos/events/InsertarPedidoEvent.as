package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.PedidoVO;

	public class InsertarPedidoEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "InsertarPedidoEvent";
		public var pedido:PedidoVO;
		
		public function InsertarPedidoEvent(pedido:PedidoVO)
		{
			super(EVENT_NAME);
			this.pedido=pedido;
		}
		
	}
}
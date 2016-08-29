package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.PedidoVO;

	public class ImprimirPedidoEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "ImprimirPedidoEvent";
		public var pedido:PedidoVO;
		
		public function ImprimirPedidoEvent(pedido:PedidoVO)
		{
			super(EVENT_NAME);
			this.pedido=pedido;
		}
		
	}
}
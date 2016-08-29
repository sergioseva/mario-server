package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.PedidoItemVO;

	public class ActualizarPedidoItemEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "ActualizarPedidoItemEvent";
		public var pedidoItem:PedidoItemVO;
		
		public function ActualizarPedidoItemEvent(pedidoItem:PedidoItemVO)
		{
			super(EVENT_NAME);
			this.pedidoItem=pedidoItem;
		}
		
	}
}
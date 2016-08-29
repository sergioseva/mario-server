package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.PedidoItemVO;

	public class InsertarPedidoItemEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "InsertarPedidoItemEvent";
		public var pedidoItem:PedidoItemVO;
		
		public function InsertarPedidoItemEvent(pedidoItem:PedidoItemVO)
		{
			super(EVENT_NAME);
			this.pedidoItem=pedidoItem;
		}
		
	}
}
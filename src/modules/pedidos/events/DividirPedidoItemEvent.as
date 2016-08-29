package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.PedidoItemVO;

	public class DividirPedidoItemEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "DividirPedidoItemEvent";
		public var pedidoItem:PedidoItemVO;
		public var cantidad:Number;
		
		public function DividirPedidoItemEvent(pedidoItem:PedidoItemVO,cantidad:Number)
		{
			super(EVENT_NAME);
			this.pedidoItem=pedidoItem;
			this.cantidad=cantidad;
		}
		
	}
}
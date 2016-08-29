package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.EditorialVO;

	public class ConfirmarPedidoDistribuidoraEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "ConfirmarPedidoDistribuidoraEvent";
		public var pedidoItems:Array;
		public var distribuidora:EditorialVO;
		
		public function ConfirmarPedidoDistribuidoraEvent(items:Array,distribuidora:EditorialVO)
		{
			super(EVENT_NAME);
			this.pedidoItems=items;
			this.distribuidora=distribuidora;
		}
		
	}
}
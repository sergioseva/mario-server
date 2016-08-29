package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.EditorialVO;

	public class BuscarPedidosDistribuidoraEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "BuscarPedidoDistribuidoraEvent";
		public var distribuidora:EditorialVO;
		public var fechaDesde:Date;
		public var fechaHasta:Date;
		public var libro:String
		public var pedidosPendientes:Boolean;
			
		public function BuscarPedidosDistribuidoraEvent(distribuidora:EditorialVO,fechaDesde:Date,fechaHasta:Date,libro:String,pedidosPendientes:Boolean)
		{
			super(EVENT_NAME);
			this.distribuidora =distribuidora;
			this.fechaDesde=fechaDesde;
			this.fechaHasta=fechaHasta;
			this.libro=libro
			this.pedidosPendientes=pedidosPendientes;			
		}
		
	}
}
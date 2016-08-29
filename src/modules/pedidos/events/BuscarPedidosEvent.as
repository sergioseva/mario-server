package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import modules.pedidos.vo.ClienteVO;
	
	public class BuscarPedidosEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "BuscarPedidosEvent";
		public var cliente:ClienteVO;
		public var fechaDesde:Date;
		public var fechaHasta:Date;
		public var libro:String;
		
		public function BuscarPedidosEvent(cliente:ClienteVO,
		fechaDesde:Date,fechaHasta:Date,libro:String)
		{
			super(EVENT_NAME);
			this.cliente=cliente;
			this.fechaDesde=fechaDesde;
			this.fechaHasta=fechaHasta;
			this.libro=libro;
		}

	}
}
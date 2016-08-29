package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import modules.pedidos.vo.EditorialVO;
	public class BuscarRemitosEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "BuscarRemitosEvent";
		public var distribuidora:EditorialVO;
		public var fechaDesde:Date;
		public var fechaHasta:Date;
		public var libro:String;
		
		public function BuscarRemitosEvent(distribuidora:EditorialVO,
		fechaDesde:Date,fechaHasta:Date,libro:String)
		{
			super(EVENT_NAME);
			this.distribuidora=distribuidora;
			this.fechaDesde=fechaDesde;
			this.fechaHasta=fechaHasta;
			this.libro=libro;
		}

	}
}
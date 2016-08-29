package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.RemitoVO;

	public class ImprimirRemitoEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "ImprimirRemitoEvent";
		public var remito:RemitoVO;
		
		public function ImprimirRemitoEvent(remito:RemitoVO)
		{
			super(EVENT_NAME);
			this.remito=remito;
		}
		
	}
}
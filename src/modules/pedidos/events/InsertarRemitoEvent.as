package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.vo.RemitoVO;

	public class InsertarRemitoEvent extends CairngormEvent
	{   static public var EVENT_NAME: String = "InsertarRemitoEvent";
		public var remito:RemitoVO;
		
		public function InsertarRemitoEvent(remito:RemitoVO)
		{
			super(EVENT_NAME);
			this.remito=remito;
		}
		
	}
}
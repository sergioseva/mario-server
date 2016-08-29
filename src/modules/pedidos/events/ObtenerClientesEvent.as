package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class ObtenerClientesEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "ObtenerClientesEvent";
		
		public function ObtenerClientesEvent()
		{
			super(EVENT_NAME);
		}
		
	}
}
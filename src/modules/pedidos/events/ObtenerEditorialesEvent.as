package modules.pedidos.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class ObtenerEditorialesEvent extends CairngormEvent
	{
		static public var EVENT_NAME: String = "ObtenerEditorialesEvent";
		
		public function ObtenerEditorialesEvent()
		{
			super(EVENT_NAME);
		}
		
	}
}
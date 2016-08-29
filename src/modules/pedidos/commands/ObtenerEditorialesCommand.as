package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.ObtenerEditorialesEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class ObtenerEditorialesCommand implements Responder, Command
	{
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			var array :ArrayCollection = resultEvent.result as ArrayCollection;
			EnterpriseModelLocator.Instance.editoriales= array;
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Buscar editoriales fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			var obtenerEditorialesEvent:ObtenerEditorialesEvent=ObtenerEditorialesEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.obtenerEditoriales();
		}
		
	}
}
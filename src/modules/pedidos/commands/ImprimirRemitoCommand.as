package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.ImprimirRemitoEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.controls.Alert;
	
	public class ImprimirRemitoCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			model.impresionOk=true;	
			Alert.show("Remito enviado a la impresora correctamente");
		}
		
		public function onFault(event:*=null):void
		{
			model.impresionOk=false;
			Alert.show("Imprimir remito fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{ 
			var imprimirRemitoEvent:ImprimirRemitoEvent=ImprimirRemitoEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     model.impresionOk=false;
		     enterpriseBusinessDelegate.imprimirRemito(imprimirRemitoEvent.remito);
		}
		
	}
}
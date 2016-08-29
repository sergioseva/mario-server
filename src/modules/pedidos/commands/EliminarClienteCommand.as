package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.EliminarClienteEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class EliminarClienteCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			model.clienteEliminadoOk=true;
			
		}
		
		public function onFault(event:*=null):void
		{
			if (String(event.fault).search("exceptions.EliminarClienteTienePedidosException")>0) {
			Alert.show("El cliente tiene pedidos en los registros, no se puede eliminar\n");
			} else
			{
			Alert.show("Eliminar Cliente fault: " + event + "\n");
			};
		}
		
		public function execute(event:CairngormEvent):void
		{
			var eliminarClienteEvent:EliminarClienteEvent=EliminarClienteEvent(event);		 
		    var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		    model.clienteEliminadoOk=false;
		    enterpriseBusinessDelegate.eliminarCliente(eliminarClienteEvent.cliente);
		} 
		
	}
}
package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.ObtenerClientesEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class ObtenerClientesCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function execute(event:CairngormEvent):void
		{
			 var obtenerClientesEvent:ObtenerClientesEvent=ObtenerClientesEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.obtenerClientes();
		     
		     //esto estaba en el mxml principal
		     /* 
		     private function resultHandlerClienteDAO(event:ResultEvent):void {                
                clientes= event.result as ArrayCollection;
                if (!(ultimoClienteInsertado==null)) {
                cmbCliente.selectedIndex=clientes.getItemIndex(ultimoClienteInsertado);
                cmbCliente.text=getCl_nombre(ultimoClienteInsertado);
                ultimoClienteInsertado=null;
                }
            }
			*/
		}
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			var array:ArrayCollection = resultEvent.result as ArrayCollection;
						
			model.clientes= array;
			model.clientesActualizados=true;
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Buscar clientes fault: " + event.fault + "\n");
		}
		
		
		
	}
}
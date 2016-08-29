package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.BuscarLibrosPedidosEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class BuscarLibrosPedidosCommand implements Command,Responder{
		
		
		public function execute(event:CairngormEvent):void{	
			 var buscarLibrosPedidosEvent:BuscarLibrosPedidosEvent=BuscarLibrosPedidosEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.buscarLibrosPedidos();
		
		}  
		
		public function onResult( event : * = null ) : void{			
			
			var resultEvent: ResultEvent = event as ResultEvent;
			var array :ArrayCollection = resultEvent.result as ArrayCollection;
			//Alert.show("Cant pedidos consulta:" + array.length.toString());			
			EnterpriseModelLocator.Instance.librosPedidos= array;
			}
		
		public function onFault( event : * = null ) : void
		{
			Alert.show("Buscar libros pedidos fault: " + event.fault + "\n");
		}
		
		
	}
}
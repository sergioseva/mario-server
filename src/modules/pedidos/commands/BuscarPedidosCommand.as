package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.BuscarPedidosEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class BuscarPedidosCommand implements Command,Responder{
		
		
		public function execute(event:CairngormEvent):void{	
			 var buscarPedidosEvent:BuscarPedidosEvent=BuscarPedidosEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.buscarPedidos(buscarPedidosEvent.cliente,
			 buscarPedidosEvent.fechaDesde,
			 buscarPedidosEvent.fechaHasta,
			 buscarPedidosEvent.libro);
		
		}  
		
		public function onResult( event : * = null ) : void{			
			
			var resultEvent: ResultEvent = event as ResultEvent;
			var array :ArrayCollection = resultEvent.result as ArrayCollection;
			//Alert.show("Cant pedidos consulta:" + array.length.toString());			
			EnterpriseModelLocator.Instance.pedidosConsulta= array;
			}
		
		public function onFault( event : * = null ) : void
		{
			Alert.show("Buscar pedidos fault: " + event.fault + "\n");
		}
		
		
	}
}
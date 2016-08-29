package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.BuscarPedidosDistribuidoraEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class BuscarPedidosDistribuidoraCommand implements Command,Responder{
		
		
		public function execute(event:CairngormEvent):void{	
			 var buscarPedidosDistribuidoraEvent:BuscarPedidosDistribuidoraEvent=BuscarPedidosDistribuidoraEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.buscarPedidosDistribuidoras(buscarPedidosDistribuidoraEvent.distribuidora,
			 buscarPedidosDistribuidoraEvent.fechaDesde,
			 buscarPedidosDistribuidoraEvent.fechaHasta,
			 buscarPedidosDistribuidoraEvent.libro,
			 buscarPedidosDistribuidoraEvent.pedidosPendientes);
		
		}  
		
		public function onResult( event : * = null ) : void{			
			//Alert.show("hijo de remilputa");
			var resultEvent: ResultEvent = event as ResultEvent;
			var array :ArrayCollection = resultEvent.result as ArrayCollection;
			//Alert.show("Cant pedidos consulta:" + array.length.toString());			
			EnterpriseModelLocator.Instance.pedidosDistribuidorasConsulta = array;
			}
		
		public function onFault( event : * = null ) : void
		{
			Alert.show("Buscar pedidos fault: " + event.fault + "\n");
		}
		
		
	}
}	

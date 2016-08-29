package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.BuscarRemitosEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class BuscarRemitosCommand implements Command,Responder{
		
		
		public function execute(event:CairngormEvent):void{	
			 var buscarRemitosEvent:BuscarRemitosEvent=BuscarRemitosEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.buscarRemitos(buscarRemitosEvent.distribuidora,
			 buscarRemitosEvent.fechaDesde,
			 buscarRemitosEvent.fechaHasta,
			 buscarRemitosEvent.libro);
		
		}  
		
		public function onResult( event : * = null ) : void{			
			
			var resultEvent: ResultEvent = event as ResultEvent;
			var array :ArrayCollection = resultEvent.result as ArrayCollection;
			//Alert.show("Cant pedidos consulta:" + array.length.toString());			
			EnterpriseModelLocator.Instance.remitosConsulta= array;
			}
		
		public function onFault( event : * = null ) : void
		{
			Alert.show("Buscar pedidos fault: " + event.fault + "\n");
		}
		
		
	}
}
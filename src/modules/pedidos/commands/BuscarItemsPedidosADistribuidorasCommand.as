package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.BuscarCatalogoEvent;
	import modules.pedidos.events.BuscarItemsPedidosADistribuidorasEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class BuscarItemsPedidosADistribuidorasCommand implements Command,Responder{
		
		
		public function execute(event:CairngormEvent):void{	
			 var buscarItemsPedidosADistribuidorasEvent:BuscarItemsPedidosADistribuidorasEvent=BuscarItemsPedidosADistribuidorasEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.buscarItemsPedidosADistribuidoras(buscarItemsPedidosADistribuidorasEvent.pendientes);
		}  
		
		public function onResult( event : * = null ) : void{			
			var resultEvent: ResultEvent = event as ResultEvent;
			var array :ArrayCollection = resultEvent.result as ArrayCollection;
						
			EnterpriseModelLocator.Instance.itemsPedidosADistribuidoras= array;
			

		}
		
		public function onFault( event : * = null ) : void
		{
			Alert.show("Buscar items fault: " + event.fault + "\n");
		}
		
		
	}
}
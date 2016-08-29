package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.ActualizarPedidoItemEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	
	
	
	public class ActualizarPedidoItemCommand implements Responder, Command
	{
		
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
			
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			model.pedidoItemActualizadoOk=true;
			
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Actualizar pedido item fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			 var actualizarPedidoItemEvent:ActualizarPedidoItemEvent=ActualizarPedidoItemEvent(event);		 
		     var enterpriseBusinessDelegate:EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.actualizarPedidoItem(actualizarPedidoItemEvent.pedidoItem);
		} 

	}
}
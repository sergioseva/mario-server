package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.DividirPedidoItemEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	
	public class DividirPedidoItemCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			model.dividirPedidoOk=true;
			
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Dividir pedido item fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			 var dividirPedidoItemEvent:DividirPedidoItemEvent=DividirPedidoItemEvent(event);		 
		     var enterpriseBusinessDelegate:EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.dividirPedidoItem(dividirPedidoItemEvent.pedidoItem,dividirPedidoItemEvent.cantidad);
		} 

	}
}
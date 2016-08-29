package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.InsertarPedidoItemEvent;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	
	public class InsertarPedidoItemCommand implements Responder, Command
	{
		
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Insertar pedido item fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			 var insertarPedidoItemEvent:InsertarPedidoItemEvent=InsertarPedidoItemEvent(event);		 
		     var enterpriseBusinessDelegate:EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.insertarPedidoItem(insertarPedidoItemEvent.pedidoItem);
		} 

	}
}
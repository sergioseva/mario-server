package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.InsertarPedidoEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	import modules.pedidos.vo.PedidoVO;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class InsertarPedidoCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			var p:PedidoVO = resultEvent.result as PedidoVO;
			EnterpriseModelLocator.Instance.pedido= p;
			model.insertarPedidoOk=true;
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Insert pedido fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			var insertarPedidoEvent:InsertarPedidoEvent=InsertarPedidoEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     model.insertarPedidoOk=false;
		     enterpriseBusinessDelegate.insertarPedido(insertarPedidoEvent.pedido);
		}
		
	}
}
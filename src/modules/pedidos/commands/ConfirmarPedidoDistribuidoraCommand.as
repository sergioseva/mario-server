package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.ConfirmarPedidoDistribuidoraEvent;
	import modules.pedidos.events.ImprimirPedidoItemsEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.controls.Alert;
	
	public class ConfirmarPedidoDistribuidoraCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			model.confirmarPedidoDistribuidoraOk=true;	
			Alert.show("Pedido confirmado correctamente");
		}
		
		public function onFault(event:*=null):void
		{
			model.confirmarPedidoDistribuidoraOk=false;
			Alert.show("Confirmar pedido distribuidora fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			var confirmarPedidoDistribuidoraEvent:ConfirmarPedidoDistribuidoraEvent=ConfirmarPedidoDistribuidoraEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     //model.impresionItemsOk=false;
		     enterpriseBusinessDelegate.confirmarPedidoDistribuidora(confirmarPedidoDistribuidoraEvent.pedidoItems,confirmarPedidoDistribuidoraEvent.distribuidora);
		}
		
	}
}
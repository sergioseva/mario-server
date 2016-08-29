package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.ActualizarClienteEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	import modules.pedidos.vo.ClienteVO;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class ActualizarClienteCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			var c:ClienteVO = resultEvent.result as ClienteVO;
			EnterpriseModelLocator.Instance.ultimoClienteInsertado= c;
			model.actualizarClienteOk=true;
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Actualizar Cliente fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			var actualizarClienteEvent:ActualizarClienteEvent=ActualizarClienteEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     model.actualizarClienteOk=false;
		     enterpriseBusinessDelegate.actualizarCliente(actualizarClienteEvent.cliente);
		} 
		
	}
}
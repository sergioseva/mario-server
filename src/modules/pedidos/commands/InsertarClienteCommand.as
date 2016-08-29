package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.InsertarClienteEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	import modules.pedidos.vo.ClienteVO;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class InsertarClienteCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			var c:ClienteVO = resultEvent.result as ClienteVO;
			model.ultimoClienteInsertado= c;
			model.insertarClienteOk=true;
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Insert Cliente fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			var insertarClienteEvent:InsertarClienteEvent=InsertarClienteEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     model.insertarClienteOk=false;
		     enterpriseBusinessDelegate.insertarCliente(insertarClienteEvent.cliente);
		} 
		
	}
}
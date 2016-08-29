package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.InsertarRemitoEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	import modules.pedidos.vo.RemitoVO;
	
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;

	public class InsertarRemitoCommand implements Responder, Command
	{
		private var model:EnterpriseModelLocator=EnterpriseModelLocator.Instance;
		
		public function onResult(event:*=null):void
		{
			var resultEvent: ResultEvent = event as ResultEvent;
			var p:RemitoVO = resultEvent.result as RemitoVO;
			EnterpriseModelLocator.Instance.remito= p;
			model.insertarRemitoOk=true;
		}
		
		public function onFault(event:*=null):void
		{
			Alert.show("Insert remito fault: " + event.fault + "\n");
		}
		
		public function execute(event:CairngormEvent):void
		{
			var insertarRemitoEvent:InsertarRemitoEvent=InsertarRemitoEvent(event);		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     model.insertarRemitoOk=false;
		     enterpriseBusinessDelegate.insertarRemito(insertarRemitoEvent.remito);
		}
		
	}
}
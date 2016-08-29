package modules.pedidos.commands
{
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import modules.pedidos.business.EnterpriseBusinessDelegate;
	import modules.pedidos.events.BuscarCatalogoEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	
	

	public class BuscarCatalogoCommand implements Command,Responder{
		[Bindable]
		private var receptor:String;
		
		public function execute(event:CairngormEvent):void{	
			 
			 var buscarCatalogoEvent:BuscarCatalogoEvent=BuscarCatalogoEvent(event);
			 receptor=buscarCatalogoEvent.receptor;		 
		     var enterpriseBusinessDelegate: EnterpriseBusinessDelegate= new EnterpriseBusinessDelegate(this);
		     enterpriseBusinessDelegate.buscarCatalogos(buscarCatalogoEvent.autor,
			 buscarCatalogoEvent.descripcion,
			 buscarCatalogoEvent.editorial,
			 buscarCatalogoEvent.tema,buscarCatalogoEvent.isbn,buscarCatalogoEvent.buscaComienzo);
			 
		}  
		
		public function onResult( event : * = null ) : void{			
			var resultEvent: ResultEvent = event as ResultEvent;
			var array :ArrayCollection = resultEvent.result as ArrayCollection;
			
			if (receptor=="model.catalogos"){			
				EnterpriseModelLocator.Instance.catalogos= array;
				}
				else
					{
					EnterpriseModelLocator.Instance.catalogosRemitos= array;
					}
			//this.receptor=array;

		}
		
		public function onFault( event : * = null ) : void
		{
			Alert.show("Buscar catalogo fault: " + event.fault + "\n");
		}
		
		
	}
}
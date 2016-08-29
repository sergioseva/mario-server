package modules.pedidos.business
{
	import com.adobe.cairngorm.business.Responder;
	
	import common.business.AbstractBussinesDelegate;
	
	import modules.pedidos.vo.ClienteVO;
	import modules.pedidos.vo.EditorialVO;
	import modules.pedidos.vo.PedidoItemVO;
	import modules.pedidos.vo.PedidoVO;
	import modules.pedidos.vo.RemitoVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	
	public class EnterpriseBusinessDelegate extends AbstractBussinesDelegate {
		private var responder: Responder;

		public function EnterpriseBusinessDelegate(iresponder:Responder){
			super();
			responder = iresponder; //es el command
		}

		
		public function buscarCatalogos(autor:String,descripcion:String,editorial:String,tema:String,
		isbn:String,buscaComienzo:Boolean):void{
			var ro: RemoteObject = this.getRemoteObject("catalogoDAO");
	      	var token : AsyncToken = ro.getCatalogos(autor,descripcion,editorial,tema,isbn,buscaComienzo);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function buscarPedidos(cliente:ClienteVO,fechaDesde:Date,fechaHasta:Date,libro:String):void{
			var ro: RemoteObject = this.getRemoteObject("pedidoDAO");
	      	var token : AsyncToken = ro.getPedidos(cliente,fechaDesde,fechaHasta,libro);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function buscarRemitos(distribuidora:EditorialVO,fechaDesde:Date,fechaHasta:Date,libro:String):void{
			var ro: RemoteObject = this.getRemoteObject("remitoDAO");
	      	var token : AsyncToken = ro.getRemitos(distribuidora,fechaDesde,fechaHasta,libro);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function buscarPedidosDistribuidoras(distribuidora:EditorialVO,fechaDesde:Date,fechaHasta:Date,libro:String,pedidosPendientes:Boolean):void{
			var ro: RemoteObject = this.getRemoteObject("pedidoADistribuidoraDAO");
	      	var token : AsyncToken = ro.getPedidosADistribuidoras(distribuidora,fechaDesde,fechaHasta,libro,pedidosPendientes);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function obtenerClientes():void{
			var ro: RemoteObject = this.getRemoteObject("clienteDAO");
	      	var token : AsyncToken = ro.getClientes();
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function obtenerEditoriales():void{
			var ro: RemoteObject = this.getRemoteObject("editorialDAO");
	      	var token : AsyncToken = ro.getEditoriales();
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function imprimirPedido(pedido:PedidoVO):void{
			var ro: RemoteObject = this.getRemoteObject("pedidoPrinter");
	      	var token : AsyncToken = ro.imprimirPedido(pedido);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function imprimirRemito(remito:RemitoVO):void{
			var ro: RemoteObject = this.getRemoteObject("remitoPrinter");
	      	var token : AsyncToken = ro.imprimirRemito(remito);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function imprimirPedidoItems(items:Array,distribuidora:String):void{
			var ro: RemoteObject = this.getRemoteObject("pedidoItemsPrinter");
	      	var token : AsyncToken = ro.imprimirPedido(items,distribuidora);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function confirmarPedidoDistribuidora(items:Array,distribuidora:EditorialVO):void{
			var ro: RemoteObject = this.getRemoteObject("sistema");
	      	var token : AsyncToken = ro.grabarPedido(items,distribuidora);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}

		public function insertarPedido(pedido:PedidoVO):void{
			var ro: RemoteObject = this.getRemoteObject("pedidoDAO");
	      	var token : AsyncToken = ro.insert(pedido);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}
		
		public function insertarRemito(remito:RemitoVO):void{
			var ro: RemoteObject = this.getRemoteObject("remitoDAO");
	      	var token : AsyncToken = ro.insert(remito);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		}			
		
		public function insertarCliente(cliente:ClienteVO):void{
			var ro: RemoteObject = this.getRemoteObject("clienteDAO");
	      	var token : AsyncToken = ro.insert(cliente);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		
		public function eliminarCliente(cliente:ClienteVO):void{
			var ro: RemoteObject = this.getRemoteObject("clienteDAO");
	      	var token : AsyncToken = ro.delete_cliente(cliente);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		
		public function actualizarCliente(cliente:ClienteVO):void{
			var ro: RemoteObject = this.getRemoteObject("clienteDAO");
	      	var token : AsyncToken = ro.update(cliente);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		
		public function buscarItemsPedidosADistribuidoras(pendientes:Boolean):void {
			var ro: RemoteObject = this.getRemoteObject("pedidoItemDAO");
			var token : AsyncToken = ro.getPedidoItems(pendientes);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		
		public function insertarPedidoItem(pi:PedidoItemVO):void {
			var ro: RemoteObject = this.getRemoteObject("pedidoItemDAO");
			var token : AsyncToken = ro.insert(pi,true);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		
		public function actualizarPedidoItem(pi:PedidoItemVO):void {
			var ro: RemoteObject = this.getRemoteObject("pedidoItemDAO");
			var token : AsyncToken = ro.update(pi,true,null);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		
		public function buscarLibrosPedidos():void {
			var ro: RemoteObject = this.getRemoteObject("pedidoItemDAO");
			var token : AsyncToken = ro.getLibrosPedidos();
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 
		public function dividirPedidoItem(pi:PedidoItemVO, cantidad:Number):void {
			var ro: RemoteObject = this.getRemoteObject("sistema");
			var token : AsyncToken = ro.dividirPedidoItem(pi,cantidad);
	      	token.resultHandler = responder.onResult;  
			token.faultHandler = responder.onFault;
		} 

	}
}
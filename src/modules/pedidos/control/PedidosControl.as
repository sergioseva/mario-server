package modules.pedidos.control
{
	import com.adobe.cairngorm.control.FrontController;
	
	import modules.pedidos.commands.ActualizarClienteCommand;
	import modules.pedidos.commands.ActualizarPedidoItemCommand;
	import modules.pedidos.commands.BuscarCatalogoCommand;
	import modules.pedidos.commands.BuscarItemsPedidosADistribuidorasCommand;
	import modules.pedidos.commands.BuscarLibrosPedidosCommand;
	import modules.pedidos.commands.BuscarPedidosCommand;
	import modules.pedidos.commands.BuscarPedidosDistribuidoraCommand;
	import modules.pedidos.commands.BuscarRemitosCommand;
	import modules.pedidos.commands.ConfirmarPedidoDistribuidoraCommand;
	import modules.pedidos.commands.DividirPedidoItemCommand;
	import modules.pedidos.commands.EliminarClienteCommand;
	import modules.pedidos.commands.ImprimirPedidoCommand;
	import modules.pedidos.commands.ImprimirPedidoItemsCommand;
	import modules.pedidos.commands.ImprimirRemitoCommand;
	import modules.pedidos.commands.InsertarClienteCommand;
	import modules.pedidos.commands.InsertarPedidoCommand;
	import modules.pedidos.commands.InsertarPedidoItemCommand;
	import modules.pedidos.commands.InsertarRemitoCommand;
	import modules.pedidos.commands.ObtenerClientesCommand;
	import modules.pedidos.commands.ObtenerEditorialesCommand;
	import modules.pedidos.events.*; 
	
	public class PedidosControl extends FrontController
	{
		public function PedidosControl()		{
			
			addCommand(BuscarCatalogoEvent.EVENT_NAME,BuscarCatalogoCommand);
			addCommand(ObtenerClientesEvent.EVENT_NAME,ObtenerClientesCommand);
			addCommand(ObtenerEditorialesEvent.EVENT_NAME,ObtenerEditorialesCommand);
			addCommand(ImprimirPedidoEvent.EVENT_NAME,ImprimirPedidoCommand);
			addCommand(ImprimirRemitoEvent.EVENT_NAME,ImprimirRemitoCommand);
			addCommand(InsertarPedidoEvent.EVENT_NAME,InsertarPedidoCommand);
			addCommand(InsertarClienteEvent.EVENT_NAME,InsertarClienteCommand);
			addCommand(EliminarClienteEvent.EVENT_NAME,EliminarClienteCommand);
			addCommand(ActualizarClienteEvent.EVENT_NAME,ActualizarClienteCommand);
			addCommand(BuscarItemsPedidosADistribuidorasEvent.EVENT_NAME,BuscarItemsPedidosADistribuidorasCommand);
			addCommand(ActualizarPedidoItemEvent.EVENT_NAME,ActualizarPedidoItemCommand);
			addCommand(InsertarPedidoItemEvent.EVENT_NAME,InsertarPedidoItemCommand);
			addCommand(DividirPedidoItemEvent.EVENT_NAME,DividirPedidoItemCommand);
			addCommand(ImprimirPedidoItemsEvent.EVENT_NAME,ImprimirPedidoItemsCommand);
			addCommand(ConfirmarPedidoDistribuidoraEvent.EVENT_NAME,ConfirmarPedidoDistribuidoraCommand);
			addCommand(BuscarPedidosEvent.EVENT_NAME,BuscarPedidosCommand);
			addCommand(BuscarPedidosDistribuidoraEvent.EVENT_NAME ,BuscarPedidosDistribuidoraCommand);
			addCommand(InsertarRemitoEvent.EVENT_NAME ,InsertarRemitoCommand);
			addCommand(BuscarRemitosEvent.EVENT_NAME ,BuscarRemitosCommand);
			addCommand(BuscarLibrosPedidosEvent.EVENT_NAME,BuscarLibrosPedidosCommand);
		}

	}
}
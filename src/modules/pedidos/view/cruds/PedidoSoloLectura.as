package modules.pedidos.view.cruds
{
	import modules.pedidos.events.ImprimirPedidoEvent;
	import modules.pedidos.model.EnterpriseModelLocator;
	
	import mx.collections.ArrayCollection;
	
	public class PedidoSoloLectura extends Pedido
	{
		
		[Bindable] 
        private var model: EnterpriseModelLocator= EnterpriseModelLocator.Instance;
		
		[Bindable] 
  		private var clientes:ArrayCollection;
  
		override  public  function init():void {
		super.init();
		pedidoItems.list=model.pedidoConsulta.items;
		txtSenia.text=model.pedidoConsulta.pe_senia.toString();
		chkDomicilio.selected=model.pedidoConsulta.pe_adomicilio;
		txtDomicilio.text=model.pedidoConsulta.pe_domicilio;
		dtFechaEnvio.selectedDate=model.pedidoConsulta.pe_fecha_envio;
		txtObservaciones.text=model.pedidoConsulta.pe_observaciones;
		cmbCliente.dataProvider=clientes=new ArrayCollection(model.clientes.toArray());	
		this.btnAgregarItem.visible=false;
		this.btnEliminarItem.visible=false;
		this.btnFinalizarPedido.visible=false;
		this.btnNuevoPedido.visible=false;
		this.btnImprimirPedido.enabled=true;
		this.cmbCliente.visible=false;
		this.txtCliente.visible=true;
		this.txtCliente.text=model.pedidoConsulta.cliente.cl_nombre + "-" + model.pedidoConsulta.cliente.cl_telefono_movil; 
		
		/*cmbCliente=new MatchComboBox();
		cmbCliente.dataProvider=model.clientes;
		cmbCliente.matchFirstPosition=false;
		cmbCliente.matchCaseSensitive=false; */
        /*cmbCliente.labelFunction=function getCl_nombre(cliente : Object): String
            {
                return ClienteVO(cliente).cl_nombre + "-" + ClienteVO(cliente).cl_telefono_movil;
            };*/

		
		//cmbCliente.selectedIndex=model.getIndiceCliente(model.pedidoConsulta.cliente);
		}
		
		public function PedidoSoloLectura() {
		super();
		}
		
		override public function recalcularTotalPedido():void {
               txtTotal.text=currencyFormatter.format(model.pedidoConsulta.total().toString());
        }
        
        override public function imprimirPedido():void {
      		new ImprimirPedidoEvent(model.pedidoConsulta).dispatch();
      	}
	}
}
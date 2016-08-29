package modules.pedidos.model
{
	 import com.adobe.cairngorm.model.IModelLocator;
	 
	 import modules.pedidos.vo.CatalogoVO;
	 import modules.pedidos.vo.ClienteVO;
	 import modules.pedidos.vo.PedidoItemVO;
	 import modules.pedidos.vo.PedidoVO;
	 import modules.pedidos.vo.RemitoItemVO;
	 import modules.pedidos.vo.RemitoVO;
	 
	 import mx.collections.ArrayCollection;
	 import mx.controls.Alert;
  
  
  [Bindable]
  public class EnterpriseModelLocator implements IModelLocator
  {
    static private var _instance: EnterpriseModelLocator = new EnterpriseModelLocator();
	public var catalogos : ArrayCollection = new ArrayCollection();	
	public var catalogosRemitos: ArrayCollection = new ArrayCollection();
	public var clientes: ArrayCollection = new ArrayCollection();
	public var editoriales: ArrayCollection = new ArrayCollection();
	public var pedidos: ArrayCollection = new ArrayCollection();
	public var pedidosConsulta: ArrayCollection = new ArrayCollection();
	public var librosPedidos: ArrayCollection = new ArrayCollection();
	public var remitosConsulta: ArrayCollection = new ArrayCollection();
	public var pedidosDistribuidorasConsulta: ArrayCollection = new ArrayCollection();
	public var itemsPedidosADistribuidoras:ArrayCollection=new ArrayCollection();
	public var ultimoClienteInsertado:ClienteVO;
	public var pedido:PedidoVO;
	public var pedidoConsulta:PedidoVO;
	public var remito:RemitoVO;
		    
    public var impresionOk : Boolean;
    public var insertarPedidoOk : Boolean;
    public var insertarRemitoOk : Boolean;
    public var insertarClienteOk : Boolean;
    public var actualizarClienteOk : Boolean;
    public var dividirPedidoOk:Boolean;
    public var confirmarPedidoDistribuidoraOk:Boolean;
    public var clienteEliminadoOk:Boolean;
    public var pedidoItemActualizadoOk:Boolean;
    public var clientesActualizados:Boolean;
  
    
	public function newPedido():void {
	pedido=new PedidoVO;
	ultimoClienteInsertado=null;
	}
	
	public function newRemito():void {
	remito=new RemitoVO;
	}
	
	public function totalPedido():Number {
	return pedido.total();
	}

    public function EnterpriseModelLocator()
    {
      if(_instance != null)
        throw new Error("Error: No instanciar singleton");
    }
    
    static public function get Instance(): EnterpriseModelLocator
    {
      return _instance;
    }
    
           public function agregarItemAPedido(cg:CatalogoVO):void {
           var pi:PedidoItemVO;    
           var cg:CatalogoVO;
           var piExistente:PedidoItemVO;
           if (this.pedido.finalizado) {
           	Alert.show("El pedido está finalizado, no se pueden ingresar mas items, realice un pedido nuevo");
           	return;
           }    
           pi=new PedidoItemVO;
           pi.pi_catalogo_cg=cg;
           pi.pi_autor=cg.cg_autor; 
           pi.pi_editorial=cg.cg_editorial;
           pi.pi_nombre_libro=cg.cg_descripcion;
           pi.pi_precio=cg.cg_precio;
           pi.pi_isbn=cg.cg_isbn;           
           pi.pi_cantidad=1;
           pi.pi_pendiente=true;          
           piExistente=this.pedido.incluye(pi);
           
           if (piExistente==null) {
           this.pedido.items.addItem(pi);	
           	} else
           {piExistente.pi_cantidad++;
           }

           }
           
           public function agregarPedidoItemAPedido(pi:PedidoItemVO):void {
               
           var cg:CatalogoVO;
           var piExistente:PedidoItemVO;
           if (this.pedido.finalizado) {
           	Alert.show("El pedido está finalizado, no se pueden ingresar mas items, realice un pedido nuevo");
           	return;
           }    
           piExistente=this.pedido.incluye(pi);
           
           if (piExistente==null) {
           this.pedido.items.addItem(pi);	
           	} else
           {piExistente.pi_cantidad++;
           }

           }
           
           public function getIndiceCliente(c:ClienteVO):int {
           var i:int;
			var len:int = clientes.length;
        	for (i = 0; i < len; i++)
        		{
        		if (clientes.getItemAt(i).equal(c)) {
        		return i;
        			}
        		}
        		return -1;
           }
           
		  public function agregarItemARemito(cg:CatalogoVO):void {
           var ri:RemitoItemVO;    
           var cg:CatalogoVO;
           var riExistente:RemitoItemVO;
           if (this.remito.finalizado) {
           	Alert.show("El remito está finalizado, no se pueden ingresar mas items, realice un pedido nuevo");
           	return;
           }    
           
           ri=new RemitoItemVO;
           ri.ri_catalogo_cg=cg;
           ri.ri_autor=cg.cg_autor; 
           ri.ri_editorial=cg.cg_editorial;
           ri.ri_nombre_libro=cg.cg_descripcion;           
           ri.ri_isbn=cg.cg_isbn;           
           ri.ri_cantidad=1;                     
           riExistente=this.remito.incluye(ri);
           
           if (riExistente==null) {
           this.remito.items.addItem(ri);	
           	} else
           {riExistente.ri_cantidad++;
           }

           }
           
           public function agregarRemitoItemARemito(pi:RemitoItemVO):void {
               
           var cg:CatalogoVO;
           var piExistente:RemitoItemVO;
           if (this.remito.finalizado) {
           	Alert.show("El remito está finalizado, no se pueden ingresar mas items, realice un pedido nuevo");
           	return;
           }    
           piExistente=this.remito.incluye(pi);
           
           if (piExistente==null) {
           this.remito.items.addItem(pi);	
           	} else
           {piExistente.ri_cantidad++;
           }

           }

    

  }
}
package modules.pedidos.vo
{
	[Bindable]
	[RemoteClass(alias="model.librosmario.PedidoItem")]
	public class PedidoItemVO
	{
	  public var selected:Boolean;	
	  public var pi_pedido_item_k:int;
	  public var pi_pedido_pe:PedidoVO;
	  public var pi_catalogo_cg:CatalogoVO;
	  public var pi_cantidad:int;
	  public var pi_nombre_libro:String;
	  public var pi_autor:String;
	  public var pi_editorial:String;
	  public var pi_isbn:String;
	  public var pi_precio:Number;
	  public var pi_editorial_ed:EditorialVO;
	  public var pi_pendiente:Boolean;
	  
	  
	  public function igual(pi:PedidoItemVO):Boolean {
	  return (this.pi_nombre_libro==pi.pi_nombre_libro) &&
	  		 (this.pi_autor==pi.pi_autor) &&
	  		 (this.pi_isbn==pi.pi_isbn) &&
	  		 (this.pi_precio==pi.pi_precio); 
	  }
	  
		public function PedidoItemVO()		
		{
			pi_editorial_ed=new EditorialVO();
			pi_editorial_ed.ed_editorial_k=1
			pi_editorial_ed.ed_descripcion="Cassasa y Lorenzo";
		}

	}
}
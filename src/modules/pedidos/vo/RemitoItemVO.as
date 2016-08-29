package modules.pedidos.vo
{
	[Bindable]
	[RemoteClass(alias="model.librosmario.RemitoItem")]
	public class RemitoItemVO
	{	
		public var ri_remito_item_k:int;
	  	public var ri_remito_re:RemitoVO;
	  	public var ri_catalogo_cg:CatalogoVO;	  	
	  	public var ri_cantidad:int;
	  	public var ri_nombre_libro:String;
	  	public var ri_autor:String;
	  	public var ri_editorial:String;
	  	public var ri_isbn:String;
	  	public var ri_motivo:String;
	  	public var ri_factura:String;
	  	
	    public function igual(ri:RemitoItemVO):Boolean {
	     return (this.ri_nombre_libro==ri.ri_nombre_libro) &&
	  		 (this.ri_autor==ri.ri_autor) &&
	  		 (this.ri_isbn==ri.ri_isbn) ; 
	    }
		public function RemitoItemVO()
		{
			ri_motivo="";
			ri_factura="";
		}

	}
}
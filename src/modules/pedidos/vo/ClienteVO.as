package modules.pedidos.vo
{
	import mx.controls.Alert;
	
	[Bindable]
	[RemoteClass(alias="model.librosmario.Cliente")]
	public class ClienteVO
	{
	 public var cl_cliente_k:int;
	 public var cl_nombre:String;
	 public var cl_direccion:String;
	 public var cl_telefono_fijo:String;
	 public var cl_telefono_movil:String;
	 public var cl_telefono_laboral:String;
	 public var cl_telefono_otro:String;
	 public var cl_telefono_otro_descr:String;
	 public var cl_email:String;
	 
	 public function equal(c:ClienteVO):Boolean {
	 		return this.cl_cliente_k==c.cl_cliente_k;
			
	 }
		public function ClienteVO()
		{
		}

	}
}
package modules.pedidos.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="model.librosmario.Pedido")]
	public class PedidoVO
	{
		public var pe_pedido_k:int;
		public var cliente:ClienteVO;
		public var pe_fecha:Date;
		public var pe_senia:Number;
		public var pe_total:Number;
		public var pe_adomicilio:Boolean;
		public var pe_domicilio:String;
		public var pe_fecha_envio:Date ;
		public var pe_observaciones:String;
		public var items:ArrayCollection;
		public var finalizado:Boolean;
		
		public function total():Number {
			var l_total:Number=0;
		for each (var pi:PedidoItemVO in items) {
			l_total=l_total+(pi.pi_precio*pi.pi_cantidad);		
		}
		return l_total;
		}
		
		public function incluye(pedidoItem:PedidoItemVO):PedidoItemVO {
			for each (var pi:PedidoItemVO in items) {
				if (pi.igual(pedidoItem)) {
				return pi;
				};		
			}
			return null;
		}
		 
		public function getCliente_name():String {
		    return cliente.cl_nombre;
		} 
		
		public function getCliente_name_phone():String {
		    return cliente.cl_nombre + "-" + cliente.cl_telefono_movil ;
		}
		
		public function PedidoVO()
		{
			items=new ArrayCollection;
			finalizado=false;
		}

	}
}
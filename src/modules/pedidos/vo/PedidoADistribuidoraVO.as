package modules.pedidos.vo
{
	import mx.collections.ArrayCollection;
	[Bindable]
	[RemoteClass(alias="model.librosmario.PedidoADistribuidora")]
	
	public class PedidoADistribuidoraVO
	{
		public var pd_pedido_a_distribuidora_k:int;
	 	public var pd_fecha:Date;
	 	public var pd_distribuidora_ed:EditorialVO;
	 	public var items:ArrayCollection;
		
		public function PedidoADistribuidoraVO()
		{
			items=new ArrayCollection;
		}
		
		public function itemsCant():Number {
			return items.length;
		}

		public function toString():String {
		return pd_distribuidora_ed.ed_descripcion;
		}
	}
}
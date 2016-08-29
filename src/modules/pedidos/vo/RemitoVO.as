package modules.pedidos.vo
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="model.librosmario.Remito")]
	public class RemitoVO
	{
		public var re_remito_k:Number;
	 	public var re_fecha:Date;
	 	public var re_distribuidora_ed:EditorialVO;	 
	 	public var items:ArrayCollection;
	 	public var finalizado:Boolean;
	 	public var re_observaciones:String;
	 
		public function RemitoVO()
		{
			items=new ArrayCollection;
		}
		
		public function incluye(remitoItem:RemitoItemVO):RemitoItemVO{
			for each (var ri:RemitoItemVO in items) {
				if (ri.igual(remitoItem)) {
				return ri; 
				};		
			}
			return null;
		}

	}
}
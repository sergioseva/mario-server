package modules.pedidos.vo
{
	[Bindable]
	[RemoteClass(alias="model.librosmario.Editorial")]
	public class EditorialVO
	{
		public var ed_editorial_k:int;
  		public var ed_descripcion:String;
		public function equal(editorial:EditorialVO):Boolean {
			return this.ed_editorial_k==editorial.ed_editorial_k;
		}  
		public function EditorialVO()
		{
		}

	}
}
package modules.pedidos.view.finders
{
	import modules.pedidos.vo.CatalogoVO;
	
	import mx.controls.Alert;
	
	public class CatalogosFinderRemito extends CatalogosFinder
	{
		public function CatalogosFinderRemito()
		{
			super();
			dgCatalogo.dataProvider=model.catalogosRemitos;
			}
		
		override  public  function init():void {
			super.init();
			
			dgCatalogo.executeBindings();						
			receptor="model.catalogosRemitos";
		}
				
		override protected function agregarItemAPedido():void {		
			Alert.show("agregarItemARemito");
			model.agregarItemARemito(CatalogoVO(dgCatalogo.selectedItem));
		}
		
	}
}
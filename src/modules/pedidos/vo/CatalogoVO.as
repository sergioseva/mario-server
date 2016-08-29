package modules.pedidos.vo

{
	
	import mx.controls.Alert;
	import flash.net.URLRequest;
    import flash.net.navigateToURL;
  
	[Bindable]
	[RemoteClass(alias="model.librosmario.Catalogo")]
	public class CatalogoVO
	{
	public var cg_catalogo_k:int;	
	public var cg_codigo_luongo:int;
	public var cg_autor:String;
	public var cg_descripcion:String;
	public var cg_precio:Number;
	public var cg_pedido:int;
	public var cg_vigente:Boolean;
	public var cg_editorial:String;
	public var cg_tema:String;
	public var cg_isbn:String;
	public var cg_pst:int;
	public var cg_observaciones:String;
	public var cg_creador:String;
	public var cg_inputdate:Date;
	
		
	public function createdByLibrosMario():Boolean {
	return cg_creador=="librosmario";
	}
	
	public function buscarDescripcionCassasa():void {
      var urlReq:URLRequest = new URLRequest(this.getUrlDescripcionCassasa());
      navigateToURL(urlReq);
	}
	
	public function buscarIsbnCassasa():void {
      var urlReq:URLRequest = new URLRequest(this.getUrlIsbnCassasa());
      navigateToURL(urlReq);
	}
	
		public function buscarDescripcionTematika():void {
      var urlReq:URLRequest = new URLRequest(this.getUrlDescripcionTematika());
      navigateToURL(urlReq);
	}
	
	public function buscarIsbnTematika():void {
      var urlReq:URLRequest = new URLRequest(this.getUrlIsbnTematika());
      navigateToURL(urlReq);
	}
	
	
	
	public function getUrlDescripcionCassasa():String {
	return "http://www.casassaylorenzo.com/resultados.aspx?c="+ cg_descripcion  +"&por=&submit.x=0&submit.y=0";
	}
	
	public function getUrlIsbnCassasa():String {		    
	return "http://www.casassaylorenzo.com/resultados.aspx?c="+ cg_isbn  +"&por=ISBN&submit.x=27&submit.y=7";
	}
	
	public function getUrlDescripcionTematika():String {
	return "http://www.tematika.com/buscar.do?idSeccionPropia=0&optSeleccionada=En%20Libros&idSeccion=1&seccionDeBusqueda=En%20Libros&texto="+ cg_descripcion;
	}
	
	public function getUrlIsbnTematika():String {		    
	return "http://www.tematika.com/buscar.do?claveDeBusqueda=porISBN&idSeccionPropia=1&optSeleccionada=ISBN&idSeccion=1&seccionDeBusqueda=En%20Libros&texto="+ cg_isbn  ;
	}
		
		public function CatalogoVO()
		{
		
		}

	}
}
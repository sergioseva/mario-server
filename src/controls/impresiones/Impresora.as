package controls.impresiones
{
	import flash.printing.PrintJob;
	
	import model.Pedido;
	
	import org.alivepdf.layout.Orientation;
	import org.alivepdf.layout.Size;
	import org.alivepdf.layout.Unit;
	import org.alivepdf.pdf.PDF;
	
	public class Impresora
	{
		public function imprimirPedido(pedido:Pedido) {
		private var myPdf:PDF;
		
		myPdf=new PDF(Orientation.PORTRAIT,Unit.CM, Size.A4);
		myPdf.addPage();
		
		var f : File FileStream = new FileStream();
		
		var f:FileStream
		
		var file : File = File.desktopDirectory.resolvePath("MyPDF.pdf");
		f.
		f.open( file, FileMode.WRITE);
		var bytes : ByteArray = myPDF.savePDF(Method.LOCAL);
		f.writeBytes(bytes);
		
		f.close();
		
		
		
		 
		}
		
		public function Impresora()
		{
		}

	}
}
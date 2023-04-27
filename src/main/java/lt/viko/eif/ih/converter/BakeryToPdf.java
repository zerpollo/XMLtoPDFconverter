package lt.viko.eif.ih.converter;
import org.xml.sax.SAXException;
import javax.xml.transform.TransformerException;
import java.io.IOException;


public class BakeryToPdf
{
    public static void main(String[] args) throws IOException, TransformerException, SAXException {
        Converter.convertToPDF();
    }

}

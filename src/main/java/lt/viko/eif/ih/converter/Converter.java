package lt.viko.eif.ih.converter;

import org.apache.fop.apps.*;
import org.xml.sax.SAXException;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

/**

 The Converter class provides a static method for converting an XML file to PDF format using XSL-FO.
 */

public class Converter {


    /**
     * Converts an XML file to PDF format using XSL-FO.
     *
     * @throws IOException if there is an I/O error.
     * @throws SAXException if there is an error parsing the XML file.
     * @throws FOPException if there is an error creating the PDF.
     * @throws TransformerException if there is an error transforming the XML file to XSL-FO.
     */

    public static void convertToPDF() throws IOException, SAXException, FOPException, TransformerException
    {
        File xsltFile = new File("bakeries-to-pdf.xsl");
        StreamSource xmlSource = new StreamSource(new File("bakeries.xml"));
        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
        OutputStream out;
        out = new java.io.FileOutputStream("bakeryinpdf.pdf");

        try {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFile));

            Result res = new SAXResult(fop.getDefaultHandler());

            transformer.transform(xmlSource, res);
        }
        finally {
            out.close();
        }
    }
}

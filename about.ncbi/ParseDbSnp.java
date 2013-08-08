import gov.nih.nlm.ncbi.snp.docsum.*;
import javax.xml.bind.*;
import javax.xml.stream.*;
import javax.xml.stream.events.*;
class ParseDbSnp
  {
  public static void main(String[] args) throws Exception
  	{
  	JAXBContext jaxbCtxt=JAXBContext.newInstance("gov.nih.nlm.ncbi.snp.docsum");
	Unmarshaller unmarshaller=jaxbCtxt.createUnmarshaller();
	XMLInputFactory ifactory = XMLInputFactory.newInstance();
	XMLEventReader r= ifactory.createXMLEventReader(System.in);
	while(r.hasNext())
		{
		XMLEvent evt=r.peek();
		if(!(evt.isStartElement() && evt.asStartElement().getName().getLocalPart().equals("Rs")))
			{
			evt=r.nextEvent();
			continue;
			}
		
		Rs rs=unmarshaller.unmarshal(r, Rs.class).getValue();
		if("genomic".equals(rs.getMolType())) continue;
		System.out.println("rs"+rs.getRsId()+" "+rs.getMolType());
		}
	r.close();
  	}
  }

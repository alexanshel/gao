package gautoorders

import grails.test.*
import org.ash.gao.domains.*
import org.ash.gao.part.Part;
import org.ash.gao.part.PartType;

class PatsTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
        //m.save()

        PartType pt = new PartType(name: "Тип запчасти 0")
        pt.save()
        Part p = new Part(code: "123456")
        pt.addToParts(p)
        p.setManufacturer(m)

        pt.parts.each{
            println "code=${it.code}"
            println "manuf=${it.manufacturer}"
        }
    }
}

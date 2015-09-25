package arch.sm213.machine.student;

import junit.framework.Assert;
import org.junit.Test;

/**
 * Created by Vincent on 2015-01-18.
 */
public class MainMemoryTest {
    @Test
    public void testIsAccessAligned(){
        MainMemory mainMemory = new MainMemory(50);
        Assert.assertTrue(mainMemory.isAccessAligned(4,4));
        Assert.assertTrue(mainMemory.isAccessAligned(8,2));
        Assert.assertFalse(mainMemory.isAccessAligned(2,4));
        Assert.assertFalse(mainMemory.isAccessAligned(3,4));

    }
    @Test
    public void testBytesToInteger(){
        MainMemory mainMemory = new MainMemory(50);


    }

}

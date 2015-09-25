package arch.sm213.machine.student;

import machine.AbstractMainMemory;
import org.junit.Test;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * Created by Clarence on 2015-01-17.
 */
public class TestMainMemory {

    @Test
    public void testIsAccessAligned() {
        MainMemory memory = new MainMemory(50);
        assertTrue(memory.isAccessAligned(4, 4));
        assertTrue(memory.isAccessAligned(30, 2));
        assertTrue(memory.isAccessAligned(40, 4));
        assertTrue(memory.isAccessAligned(0, 1));

    }
    @Test
    public void testBytesToInteger(){
        MainMemory memory = new MainMemory(50);
        assertEquals(memory.bytesToInteger((byte) 1, (byte) 2, (byte) 3, (byte) 4), 16909060);
        assertEquals(memory.bytesToInteger((byte) 3, (byte) 5, (byte) 7, (byte) 11), 50661131);
        assertEquals(memory.bytesToInteger((byte) 0, (byte) 0, (byte) 0, (byte) 2),  2);
        assertEquals(memory.bytesToInteger((byte) 0, (byte) 0, (byte) 2, (byte) 0),  512);
        assertEquals(memory.bytesToInteger((byte) 0, (byte) 2, (byte) 0, (byte) 0),  131072);
        assertEquals(memory.bytesToInteger((byte) -81, (byte) 0, (byte) 0, (byte) 0),  -1358954496);
    }
    @Test
    public void testIntegerToBytes(){
        MainMemory memory = new MainMemory(50);
        byte[] temp = new byte[4];
        temp[0] = 0;
        temp[1] = 0;
        temp[2] = 2;
        temp[3] = 0;
        assertEquals(memory.integerToBytes(512), temp);

    }

    @Test
    public void testGet() throws AbstractMainMemory.InvalidAddressException {
        byte[] bytes = {1,2,3,4};
        MainMemory memory = new MainMemory(50);
        memory.set(0, bytes);
        assertArrayEquals(memory.get(0, 4), bytes);
    }

    @Test (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testPositiveGetException() throws AbstractMainMemory.InvalidAddressException {
        byte[] bytes = {1, 2, 3, 4};
        MainMemory memory = new MainMemory(50);
        memory.set(0, bytes);
        memory.get(40, 11);
    }
    @Test (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testNegativeGetException() throws AbstractMainMemory.InvalidAddressException {
        byte[] bytes = {1, 2, 3, 4};
        MainMemory memory = new MainMemory(50);
        memory.set(0, bytes);
        memory.get(-10, 16);
    }
    @Test
    public void testSet() throws AbstractMainMemory.InvalidAddressException {
        byte[] bytes = {1,2,3,4};
        MainMemory memory = new MainMemory(50);
        memory.set(0, bytes);
        assertArrayEquals(memory.get(0, 4), bytes);
    }

    @Test (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testPositiveSetException() throws AbstractMainMemory.InvalidAddressException {
        byte[] bytes = {1, 2, 3, 4};
        MainMemory memory = new MainMemory(3);
        memory.set(0, bytes);
    }

    @Test  (expected = AbstractMainMemory.InvalidAddressException.class)
    public void testNegativeSetException() throws AbstractMainMemory.InvalidAddressException {
        byte[] bytes = {1,2,3,4};
        MainMemory mainMemory = new MainMemory(50);
        mainMemory.set(-5, bytes);
    }
}

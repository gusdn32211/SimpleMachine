package arch.sm213.machine.student;

import machine.AbstractMainMemory;


/**
 * Main Memory of Simple CPU.
 *
 * Provides an abstraction of main memory (DRAM).
 */

public class MainMemory extends AbstractMainMemory {
  private byte [] mem;
  
  /**
   * Allocate memory.
   * @param byteCapacity size of memory in bytes.
   */
  public MainMemory (int byteCapacity) {
    mem = new byte [byteCapacity];
  }
  
  /**
   * Determine whether an address is aligned to specified length.
   * @param address memory address.
   * @param length byte length.
   * @return true iff address is aligned to length.
   */
  @Override protected boolean isAccessAligned (int address, int length) {
    return address % length == 0;
  }
  
  /**
   * Convert an sequence of four bytes into a Big Endian integer.
   * @param byteAtAddrPlus0 value of byte with lowest memory address (base address).
   * @param byteAtAddrPlus1 value of byte at base address plus 1.
   * @param byteAtAddrPlus2 value of byte at base address plus 2.
   * @param byteAtAddrPlus3 value of byte at base address plus 3 (highest memory address).
   * @return Big Endian integer formed by these four bytes.
   */
  @Override public int bytesToInteger (byte byteAtAddrPlus0, byte byteAtAddrPlus1, byte byteAtAddrPlus2, byte byteAtAddrPlus3) {
    int b0 = (byteAtAddrPlus0) << 24;
    int b1 = (byteAtAddrPlus1) << 16;
    int b2 = (byteAtAddrPlus2) << 8;
    int b3 = (byteAtAddrPlus3) << 0;

    return b0 | b1 | b2 | b3;
  }
  
  /**
   * Convert a Big Endian integer into an array of 4 bytes organized by memory address.
   * @param  i an Big Endian integer.
   * @return an array of byte where [0] is value of low-address byte of the number etc.
   */
  @Override public byte[] integerToBytes (int i) {
      mem[0] = (byte) (i  >> 24);
      mem[1] = (byte) (i  >> 16);
      mem[2] = (byte) (i  >> 8);
      mem[3] = (byte) (i  >> 0);

      return mem;
  }
  
  /**
   * Fetch a sequence of bytes from memory.
   * @param address address of the first byte to fetch.
   * @param length  number of bytes to fetch.
   * @throws InvalidAddressException  if any address in the range address to address+length-1 is invalid.
   * @return an array of byte where [0] is memory value at address, [1] is memory value at address+1 etc.
   */
  @Override protected byte[] get (int address, int length) throws InvalidAddressException {
      byte[] bytes = new byte[length];
      if (address+length-1 >= mem.length | address < 0 ) {
          throw new InvalidAddressException();
      }
      else
          for (int i = 0; i < length; i++, address++) {
              bytes[i] = mem[address];
          }

      return bytes;
  }
  
  /**
   * Store a sequence of bytes into memory.
   * @param  address                  address of the first byte in memory to recieve the specified value.
   * @param  value                    an array of byte values to store in memory at the specified address.
   * @throws InvalidAddressException  if any address in the range address to address+value.length-1 is invalid.
   */
  @Override protected void set (int address, byte[] value) throws InvalidAddressException {
      if (address + value.length - 1 >= mem.length | address < 0) {
          throw new InvalidAddressException();
      } else
          for (int i = 0; i < value.length; i++, address++) {
              mem[i] = value[address];
          }
  }

      /**
       * Determine the size of memory.
       * @return the number of bytes allocated to this memory.
       */
      @Override public int length () {
          return mem.length;
      }
  }

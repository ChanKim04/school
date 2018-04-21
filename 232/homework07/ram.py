RAM_SIZE = 1024


class RAM:
    def __init__(self, size=RAM_SIZE):
        self._minAddr = 0
        self._maxAddr = RAM_SIZE - 1
        self._memory = []   # a list of values.  Could be #s or instructions.
        for i in range(size):
            self._memory.append(0)

    def __getitem__(self, addr):
        return self._memory[addr]

    def __setitem__(self, addr, val):
        self._memory[addr] = val

    def is_legal_addr(self, addr):
        return self._minAddr <= addr <= self._maxAddr

    class MMU:
        def __init__(self, ram):
            self._ram = ram
            self._reloc_register = 0
            self._limit_register = 0
            
        def get_value(self, addr):
            if (addr < 0):
                print("BAD ADDRESS %d: too low" % addr)
            elif (addr >= self._limit_register):
                print("BAD ADDRESS %d: too high" % addr)
            return self._ram[addr + self._reloc_register]

        def set_value(self, addr, val):
            if (addr < 0):
                print("BAD ADDRESS %d: too low" % addr)
            elif (addr >= self._limit_register):
                print("BAD ADDRESS %d: too high" % addr)        
            self._ram[addr + self._reloc_register] = val
        
        def set_reloc_register(self, val):
            self._reloc_register = val

        def set_limit_register(self, val):
            self._limit_register = val
        
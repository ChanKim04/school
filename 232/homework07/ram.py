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
        return self._ram[addr]

    def set_value(self, addr, val):
        self._ram[addr] = val
    
    def set_reloc_register(self, val):
        self._reloc_register = val

    def set_limit_register(self, val):
        self._limit_register = val

    def is_legal_addr(self, addr):
        if addr < self._limit_register
            return addr += self._reloc_register
        else:
            print("BAD ADDRESS %d: too low" % addr)
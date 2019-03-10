import numpy as np
import struct

def main():
	x = input("enter the Fp")
	a=struct.pack("H",int(x,2))
	out= np.frombuffer(a, dtype =np.float16)[0]
	print(out)

if __name__ == '__main__':
	main()
import numpy as np


def main():
	x = float(input("give the number"))
	fx = bin(np.float16(x).view('H'))[2:].zfill(16)
	print (x , fx)

if __name__ == '__main__':
	main()
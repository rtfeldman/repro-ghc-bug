install :
	ghc main.hs -O2 -threaded -o reproduce

test :
	./check_output.sh

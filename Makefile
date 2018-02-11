install :
	ghc main.hs -o reproduce

test :
	./check_output.sh

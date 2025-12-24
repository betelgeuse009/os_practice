.PHONY: clean
target :
	echo "compiling my applications"
	gcc -Wall e04p1.c -o myLs



install : target
	mkdir bin
	mv myLs ./bin


clean :
	rm -f *.o

distclean : clean
	rm -R ./bin


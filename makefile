CC := g++

test: test.cpp # 测试test
	$(CC) -c $^ -o test.o
	$(CC) test.o -o $@
	./$@

clean:
	rm *.o test

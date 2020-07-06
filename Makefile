OPT=-g3 -O0
FINAL_CFLAGS=-I./third_party/jemalloc/obj/include $(OPT)
FINAL_LIBS=./third_party/jemalloc/obj/lib/libjemalloc.a -lpthread -ldl

%.o: %.c
	$(CC) $(FINAL_CFLAGS) -c $<

TEST_EXEC=test
TEST_OBJ=test.o

all: $(TEST_EXEC) jemalloc
	@echo ""
	@echo "make done"
	@echo ""

$(TEST_EXEC): $(TEST_OBJ)
	$(CC) -o $@ $^ $(FINAL_LIBS)

jemalloc:
	(cd third_party/jemalloc && autoconf && mkdir -p obj && cd obj && ../configure --with-jemalloc-prefix=je_ CFLAGS="-g3 -O0" --enable-debug && $(MAKE))

clean:
	$(RM) $(TEST_EXEC) $(TEST_OBJ) *.o

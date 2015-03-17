SRC = cube.cu
TARGET = $(SRC:.cu=.cuda.out)

All: $(TARGET)

$(TARGET): $(SRC)
	nvcc $(SRC) -o $(TARGET)

clean:
	-rm $(TARGET)
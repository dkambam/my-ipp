SRC = square.cu
TARGET = $(SRC:.cu=.cuda.out)

all: $(TARGET)

$(TARGET): $(SRC)
	nvcc -o $(TARGET) $(SRC)

clean:
	-rm $(TARGET)
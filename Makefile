# Compiler
CXX := g++
# Compiler flags
CXXFLAGS := -std=c++17 -Wall

# Directories
SRC_DIR := src/
BUILD_DIR := build/
BIN_DIR := bin/

# Source files
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
# Object files
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC_FILES))
# Executable
TARGET := $(BIN_DIR)/rbs

.PHONY: all clean

all: $(TARGET)

# Linking the object files to create the final executable
$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CXX) $(OBJS) -o $@

# Compiling each source file into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@ -I src/

# Create the build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Create the bin directory
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Clean rule
clean:
	$(RM) -r $(BUILD_DIR) $(BIN_DIR)

run:
	./$(TARGET) ./test/test.cbs
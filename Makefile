# Compiler
CXX = g++
CXXFLAGS = -std=c++17 -Iinclude -Wall
LDFLAGS = -lsfml-graphics -lsfml-window -lsfml-system

SRCDIR = lib
INCDIR = include
BUILDDIR = build

TARGET = $(BUILDDIR)/game_of_life

SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(BUILDDIR)/%.o,$(SOURCES))

all: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Suppression du dossier de build
clean:
	rm -rf $(BUILDDIR)
	rm simulation_log.txt

run:
	make all
	./$(TARGET)

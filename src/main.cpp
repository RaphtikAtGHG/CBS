#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

int main(int argc, char* argv[]) {
    std::string filename;

    // Check if there is exactly one argument
    if (argc == 2) {
        // If there is, set filename to the argument value
        filename = argv[1];
    } else {
        // If there isn't exactly one argument, set filename to "build.rbs"
        filename = "build.rbs";
    }

    // Open the file
    std::ifstream file(filename);
    
    // Check if the file is opened successfully
    if (!file.is_open()) {
        std::cerr << "Error: Unable to open file: " << filename << std::endl;
        return 1;
    }

    std::vector<std::string> lines;
    std::string line;

    // Read the file line by line and store each line in the vector
    while (std::getline(file, line)) {
        lines.push_back(line);
    }

    // Close the file
    file.close();

    // Output the contents of the vector
    std::cout << "Contents of " << filename << ":" << std::endl;
    for (const auto& l : lines) {
        std::cout << l << std::endl;
    }

    return 0;
}

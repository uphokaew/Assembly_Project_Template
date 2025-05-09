# 🧠 asmyapp — Hobby Project for Multi-Architecture Assembly

> A personal hobby project to **learn and experiment with x86_64 and i686 Assembly programming** using **NASM**.  
> This prototype demonstrates a simple assembly program with cross-architecture (x86_64, i686) and cross-OS (Linux, macOS) support, serving as a foundation for low-level programming exploration.

---

## 📚 Purpose

This project is **purely educational** and created as a hobby to deepen my understanding of assembly programming across different architectures and operating systems.  
The goal is to build a minimal, reusable assembly application that supports x86_64 and i686 architectures, with OS-specific configurations for Linux and macOS.

---

## 🧪 Features

- **Multi-Architecture Support**: Builds for x86_64 and i686 architectures.
- **Cross-OS Compatibility**: Configurable for Linux and macOS using macros in `config.inc`.
- **Simple Output**: Prints "Hello from ASM!" using `printf` via C library linkage.
- **Modular Build System**: Uses a `makefile` to automate compilation for multiple architectures.
- **Docker Support**: Optional containerized environment for consistent builds.
- **Extensible Structure**: Designed to support additional `.asm` files or subdirectories in `src/`.

Future expansions may include:
- Additional system calls or utility functions.
- Support for more architectures (e.g., AArch64, if implemented).
- Unit tests for assembly code.

---

## ⚙️ Tools Used

- **NASM**: Netwide Assembler for x86_64 and i686 assembly programming.
- **GCC**: Compiler for linking assembly objects with C libraries.
- **Make**: Automates multi-architecture builds via a `makefile`.
- **Docker**: Optional containerized build environment.

---

## 🧰 Requirements

To build and run this project, you need:

- ✅ **Linux** or **macOS** (x86_64 or i686 architecture).
- ✅ `nasm` installed:
  ```bash
  # Ubuntu/Debian
  sudo apt install nasm
  
  # Fedora
  sudo dnf install nasm
  
  # macOS (Homebrew)
  brew install nasm
  ```
- ✅ `gcc` installed:
  ```bash
  # Ubuntu/Debian
  sudo apt install gcc
  
  # Fedora
  sudo dnf install gcc
  
  # macOS (Xcode Command Line Tools)
  xcode-select --install
  ```
- ✅ `make` utility.
- ✅ `docker` (optional, for containerized builds).

---

## 🔨 How to Build

### Using `make`
The `makefile` supports building for both x86_64 and i686 architectures.

```bash
make            # Build for both x86_64 and i686
make x86_64     # Build only for x86_64
make i686       # Build only for i686
make clean      # Remove build artifacts
make re         # Clean and rebuild
```

Output binaries are placed in:
- `build/x86_64/asmyapp_x86_64` (x86_64)
- `build/i686/asmyapp_i686` (i686)

### Using Docker
```bash
docker build -t asmyapp .         # Build the Docker image
docker run -it asmyapp            # Run the container
```

---

## 🧪 How to Run

Run the binary for a specific architecture (default: x86_64):

```bash
make run                    # Run x86_64 binary
make run ARCH=i686          # Run i686 binary
```

Alternatively, execute the binary directly:

```bash
./build/x86_64/asmyapp_x86_64    # Run x86_64 binary
./build/i686/asmyapp_i686        # Run i686 binary
```

Expected output:
```
Hello from ASM!
```

---

## 📁 Project Structure

```
asmyapp/
├── dockerfile            # Docker configuration for containerized builds
├── includes/
│   └── config.inc        # Assembly macros for OS-specific configurations
├── LICENSE               # License file (e.g., MIT)
├── makefile              # Multi-architecture build automation
├── README.md             # Project documentation
├── src/
│   └── main.asm          # Main assembly source file
├── obj/                  # Object files (x86_64/, i686/)
└── build/                # Output binaries (x86_64/, i686/)
```

- **dockerfile**: Defines a containerized build environment.
- **includes/config.inc**: Contains macros for OS-specific entry points and library functions.
- **src/main.asm**: Implements a simple "Hello from ASM!" program with multi-architecture support.
- **makefile**: Automates compilation and linking for x86_64 and i686.
- **obj/**: Stores intermediate object files for each architecture.
- **build/**: Stores final binaries for each architecture.

---

## 👨‍💻 Author

**uphokaew (B)** 🐝  
A hobbyist and student passionate about low-level programming and systems design.  
This project is part of my self-learning journey into assembly programming across multiple architectures.

---

## 💬 Notes

- This is a **hobby project** and a work-in-progress. It may evolve to include more features, such as additional system calls or architecture support (e.g., AArch64).
- The `main.asm` file is designed to be extensible, with conditional compilation for different architectures and OSes.
- Suggestions or feedback from fellow learners are welcome!
- The project is kept minimal to serve as a template for future assembly experiments.

---

## 📜 License

This project is licensed under the Apache License. See the [LICENSE](./LICENSE) file for details.
NAME_PROJECT = asmyapp

NASM = nasm
CC = gcc

SRC_DIR = src
OBJ_DIR = obj
BUILD_DIR = build

ASM_FILES = $(shell find $(SRC_DIR) -type f -name '*.asm')

ifeq ($(strip $(ASM_FILES)),)
	$(error No .asm files found in $(SRC_DIR))
endif

OBJ_x86_64 = $(patsubst $(SRC_DIR)/%.asm,$(OBJ_DIR)/x86_64/%.o,$(ASM_FILES))
OBJ_i686   = $(patsubst $(SRC_DIR)/%.asm,$(OBJ_DIR)/i686/%.o,$(ASM_FILES))

$(info ASM_FILES = $(ASM_FILES))
$(info OBJ_x86_64 = $(OBJ_x86_64))
$(info OBJ_i686 = $(OBJ_i686))

ARCH_LIST = x86_64 i686

OUT_x86_64 = $(NAME_PROJECT)_x86_64
OUT_i686   = $(NAME_PROJECT)_i686

NASM_FMT_x86_64 = -f elf64
NASM_FMT_i686   = -f elf32

CC_FLAGS_x86_64 = -g -m64 -no-pie -Wall
CC_FLAGS_i686   = -g -m32 -no-pie -Wall

TARGET_x86_64 = $(BUILD_DIR)/x86_64/$(OUT_x86_64)
TARGET_i686   = $(BUILD_DIR)/i686/$(OUT_i686)

TARGETS = $(foreach arch,$(ARCH_LIST),$(TARGET_$(arch)))
DIRS = $(foreach arch,$(ARCH_LIST),$(OBJ_DIR)/$(arch) $(BUILD_DIR)/$(arch))

$(info DIRS = $(DIRS))

all: $(TARGETS)

$(foreach arch,$(ARCH_LIST), \
  $(eval \
    $(TARGET_$(arch)): $(OBJ_$(arch)) | $(BUILD_DIR)/$(arch) ; \
    $$(CC) $$(CC_FLAGS_$(arch)) -o $$@ $$^ \
  ) \
  $(eval \
    $(OBJ_DIR)/$(arch)/%.o: $(SRC_DIR)/%.asm | $(OBJ_DIR)/$(arch) ; \
    @mkdir -p $$(@D) ; \
    $$(NASM) $$(NASM_FMT_$(arch)) -o $$@ $$< \
  ) \
)

$(DIRS):
	@mkdir -p $@

$(ARCH_LIST): %: $(TARGET_%)

ARCH ?= x86_64
run: $(TARGET_$(ARCH))
	@echo "Running: ./$(TARGET_$(ARCH))"
	@./$(TARGET_$(ARCH))

clean:
	rm -rf $(OBJ_DIR) $(BUILD_DIR)

re: clean all

.PHONY: all clean re run $(ARCH_LIST)
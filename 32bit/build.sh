#!/bin/bash
for f in *.dmp ; do
    a=`basename $f .dmp`
    cut -d'#' -f1 <$f | xxd -p -r >$a
    chmod +x $a
done

gcc -m32 hello-32.S -o hello-32-asm -static -nostdlib

as -o hello64.o hello64.S
ld -static -nostdlib -o hello64-asm hello64.o

as --32 -o hello32.o hello32.S
ld -m elf_i386 -nostdlib -static -o hello32-asm hello32.o

as -o hello64-int.o hello64-int.S
ld -nostdlib -static -o hello64-int-asm hello64-int.o


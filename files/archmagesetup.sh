#!/bin/bash

touch '/home/archmage/arcaneCTF{flag}'
mkdir '/home/archmage/level-1' && touch '/home/archmage/level-1/arcaneCTF{flag}'
mkdir '/home/archmage/level-2' && echo 'arcaneCTF{flag}' > '/home/archmage/level-2/README.txt' && chown root:archmage '/home/archmage/level-1' '/home/archmage/level-2'
addgroup "arcaneCTF-FLAG" && usermod -a -G "arcaneCTF-FLAG" archmage
mkdir -p "/home/archmage/level-3/dir1/dir2/dir3/dir4/dir5/dir6/dir7/dir8"

mkdir "/home/archmage/level-4" 

mkdir "/home/archmage/level-5" && echo "print('Hello world')" > /home/archmage/level-5/script.py
mkdir "/home/archmage/level-6" && echo 'import base64
flag = "YXJjYW5lQ1RGe2ZsYWd9"
print(base64.b64decode(flag))' > "/home/archmage/level-6/script.py"
echo "arcaneCTF{flag}" > "/usr/sbin/.hiddenFlag" && chown root:arcaneCTF-FLAG /usr/sbin/.hiddenFlag
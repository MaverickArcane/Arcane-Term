#!/bin/bash

touch '/home/archmage/arcaneCTF{W3lc0m3_1N!}'
mkdir '/home/archmage/level-1' && touch '/home/archmage/level-1/arcaneCTF{3Y3_LS_Y0U}'
mkdir '/home/archmage/level-2' && echo 'arcaneCTF{C4T_M0m3Nt}' > '/home/archmage/level-2/README.txt' && chown root:archmage '/home/archmage/level-1' '/home/archmage/level-2'
addgroup "arcaneCTF-Gr0up-Fl4g" && usermod -a -G "arcaneCTF-Gr0up-Fl4g" archmage
mkdir -p "/home/archmage/level-3/dir1/dir2/dir3/dir4/dir5/dir6/dir7/dir8"

mkdir "/home/archmage/level-4" 

mkdir "/home/archmage/level-5" && echo "print('arcaneCTF{Sn4ke_Pr0f3ssi0n4l}')" > /home/archmage/level-5/script.py
mkdir "/home/archmage/level-6" && echo 'import base64
flag = "YXJjYW5lQ1RGe0I2NF8xTl9QeXRoME59Cg=="
print(base64.b64decode(flag))' > "/home/archmage/level-6/script.py"
echo "arcaneCTF{C4NT_S33_M3!}" > "/usr/sbin/.hiddenFlag" && chown root:arcaneCTF-Gr0up-Fl4g /usr/sbin/.hiddenFlag
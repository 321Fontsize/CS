#!/bin/bash

find . -type f -name "*.html" -print0 | xargs -0 zip ./2-4html/output.zip

# find /path/to/folder -type f -name "*.html" -print0: 使用 find 查找 /path/to/folder 目录下所有后缀为 .html 的文件，并使用 -print0 以 null 字符分隔文件名。
# xargs -0 zip output.zip: 使用 xargs 读取通过 find 输出的文件名列表，并使用 -0 表示按 null 字符分隔参数。然后，将这些文件名作为参数传递给 zip 命令，创建名为 output.zip 的压缩文件。
# 这个命令的关键之处在于使用 -print0 和 -0 来处理文件名中可能包含空格的情况，确保正确地将文件名传递给 zip 命令。#
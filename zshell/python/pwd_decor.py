import os
import sys


def path_decor(path):
    levels = int(os.environ.get("ZSH_VAR_PATH_SHOW_DEPTH"))
    path = path.replace(os.environ.get("HOME"), "~")
    lst = os.path.join(path).split("/")
    n = len(lst)

    path_ellipsis = os.environ.get("ZSH_VAR_PATH_ELLIPSIS")
    if levels < n:
        sub_lst = [path_ellipsis]
        sub_lst += lst[n-levels:n]
    else:
        sub_lst = lst

    path_delimiter = os.environ.get("ZSH_VAR_PATH_DELIMITER")
    dir_color = os.environ.get("ZSH_VAR_PATH_DIR_COLOR")
    delimiter_color = os.environ.get("ZSH_VAR_PATH_DELIMITER_COLOR")
    colorized_dirs = [f"%F{{{dir_color}}}{dir}%f" for dir in sub_lst]
    return f"%F{{{delimiter_color}}}{path_delimiter}%f".join(colorized_dirs)

#m
if __name__ == "__main__":
    print(path_decor(sys.argv[1]) )

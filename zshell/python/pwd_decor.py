import os
import sys


def path_decor(path, levels, slash_color, dir_color):
    levels = int(levels)
    path = path.replace(os.environ.get("HOME"), "~")
    lst = os.path.join(path).split("/")
    n = len(lst)

    if levels < n:
        sub_lst = ["^"]
        sub_lst += lst[n+1-levels:n]
    else:
        sub_lst = lst

    colorized_dirs = [f"%F{{{dir_color}}}{dir}%f" for dir in sub_lst]
    return f"%F{{{slash_color}}}/%f".join(colorized_dirs)




if __name__ == "__main__":
    print(path_decor(*sys.argv[1:5]))
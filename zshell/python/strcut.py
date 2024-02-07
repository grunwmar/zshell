import sys


def cut_string(string, n=None):
    if len(string) > n and n is not None:
        return string[0:n]+"..."
    return string


if __name__ == "__main__":
    string = " ".join(sys.argv[2:])
    print(cut_string(string, n=int(sys.argv[1])))
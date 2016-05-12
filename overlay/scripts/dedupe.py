#!/usr/bin/env python3

import sys
import os


def read_list(path):
    """
    Return non-blank and non-comment lines from a file
    """
    paths = []
    if not path:
        return paths
    with open(path, 'r') as fd:
        for line in fd:
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            paths.append(line)
    return paths


def clean(target, delete_list=[]):
    """
    Remove files in ``taget`` directory that appear in ``delete_list``.
    """
    for root, dirs, files in os.walk(target):
        for f in files:
            abspath = os.path.abspath(os.path.join(root, f))
            relpath = os.path.relpath(abspath, target)
            if relpath not in delete_list:
                continue
            os.unlink(abspath)
            print("Removed '{}'".format(abspath))


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('target', metavar='SOURCE')
    parser.add_argument('--delete', '-d', metavar='FILE',
                        help='List of paths to remove')
    args = parser.parse_args()
    clean(args.target, read_list(args.delete))


if __name__ == '__main__':
    sys.exit(main())

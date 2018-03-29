# -*- coding: utf-8 -*-
import argparse
from . import helpers


def main():
	parser = argparse.ArgumentParser(description='<PROJECTSHORTDESCRIPTION>')
    parser.add_argument('--debug', action='store_true', default=False,
                    help='If true, add more print statement')
    args = parser.parse_args()

    debug = args.debug

if __name__ == "__main__":
	print("Starting <PROJECTNAME>")
    main()

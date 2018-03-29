init:
	pip install -r requirements.txt

test: clean-pyc
	nosetests tests

run: init
	python <PROJECTNAME>/main.py

runWithArgs: init
	python minesweeper/main.py ${ARGUMENTS}

help: init
	python minesweeper/main.py --help

clean-pyc:
    find . -name '*.pyc' -exec rm --force {} +
    find . -name '*.pyo' -exec rm --force {} +
   	name '*~' -exec rm --force  {}

clean-build:
    rm --force --recursive build/
    rm --force --recursive dist/
    rm --force --recursive *.egg-info

.PHONY: clean-pyc clean-build

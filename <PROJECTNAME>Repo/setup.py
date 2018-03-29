# -*- coding: utf-8 -*-

from setuptools import setup, find_packages


with open('README.rst') as f:
    readme = f.read()

with open('LICENSE') as f:
    license = f.read()

setup(
    name='<PROJECTNAME>',
    version='0.1.0',
    description='<PROJECTSHORTDESCRIPTION>',
    long_description=readme,
    author='<YOURNAME>',
    author_email='<YOUREMAIL>',
    license=license,
    packages=find_packages(exclude=('tests', 'docs'))
)


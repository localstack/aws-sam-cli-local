#!/usr/bin/env python

import re
from setuptools import find_packages, setup

VERSION = '1.53.0'

# parameter variables
install_requires = []
package_data = {}

# determine requirements
with open('requirements.txt') as f:
    requirements = f.read()
for line in re.split('\n', requirements):
    if line and line[0] != '#':
        lib_stripped = line.split(' #')[0].strip()
        install_requires.append(lib_stripped)


if __name__ == '__main__':

    setup(
        name='aws-sam-cli-local',
        version=VERSION,
        description='Simple wrapper around AWS SAM CLI for use with LocalStack',
        author='LocalStack Team',
        author_email='info@localstack.cloud',
        url='https://github.com/localstack/aws-sam-cli-local',
        scripts=['bin/samlocal', 'bin/samlocal.bat'],
        packages=find_packages(exclude=('tests', 'tests.*')),
        package_data=package_data,
        install_requires=install_requires,
        license='Apache License 2.0',
        zip_safe=False,
        classifiers=[
            'Programming Language :: Python :: 3',
            'Programming Language :: Python :: 3.6',
            'Programming Language :: Python :: 3.7',
            'Programming Language :: Python :: 3.8',
            'License :: OSI Approved :: Apache Software License',
            'Topic :: Software Development :: Testing',
        ]
    )

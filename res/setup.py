""" Zinc: A library for visualisation of FE models.

"""

classifiers = """\
Development Status :: 5 - Production/Stable
Intended Audience :: Developers
Intended Audience :: Education
Intended Audience :: Science/Research
License :: OSI Approved :: Apache Software License
Programming Language :: Python
Operating System :: Microsoft :: Windows
Operating System :: Unix
Operating System :: MacOS :: MacOS X
Topic :: Software Development :: Libraries :: Python Modules
"""

import os
import platform

from skbuild import setup

cmake_args = ["-DUNIT_TESTS=OFF", "-DCOVERAGE=OFF", "-DMEMCHECK=OFF", "-DLLVM_COVERAGE=OFF", "-DCLANG_TIDY=OFF"]

if platform.system() == "Windows":
    cmake_args.append("-DLibXml2_DIR=C:/Program Files (x86)/libxml2/libxml2-2.9.10/CMake/")

doclines = __doc__.split("\n")

tag = os.environ.get("ZINC_VERSION_TAG", "v0.0.0")

setup(
    name="cmlibs.cibuildwheel",
    version=tag[1:],
    description=doclines[0],
    author="Zinc contributors",
    url="https://cmlibs.org",
    license="Apache 2.0",
    packages=["cmlibs", "cmlibs.zinc"],
    classifiers=classifiers.split("\n"),
    long_description=open('README.rst').read(),
    long_description_content_type='text/x-rst',
    include_package_data=True,
#    cmake_install_target="install-wheel",
    cmake_args=cmake_args,
    exclude_package_data={"": ["bin/*", "cmake/*", "include/*", "lib/*"]},
)

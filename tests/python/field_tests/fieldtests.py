"""
PyZinc Unit Tests

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""

'''
Created on May 23, 2013

@author: hsorby
'''
import sys
import unittest

try:
    from field_tests import applytests, compositetests, fieldmodulenotifiertests, fieldrangetests, \
        grouptests, sceneviewerprojectionfieldtests, vectoroperatortests
except ImportError:
    import applytests, compositetests, fieldrangetests, fieldmodulenotifiertests, sceneviewerprojectionfieldtests, \
        vectoroperatortests
    
def suite():
    #import ImportTestCase
    tests = unittest.TestSuite()

    tests.addTests(applytests.suite())
    tests.addTests(sceneviewerprojectionfieldtests.suite())
    tests.addTests(vectoroperatortests.suite())
    tests.addTests(compositetests.suite())
    tests.addTests(fieldmodulenotifiertests.suite())
    tests.addTests(fieldrangetests.suite())
    tests.addTests(grouptests.suite())
    
    return tests

if __name__ == '__main__':
    res = unittest.TextTestRunner().run(suite())
    sys.exit(len(res.failures))

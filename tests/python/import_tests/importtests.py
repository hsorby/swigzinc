"""
PyZinc Unit Tests

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""
import sys
import unittest

class ImportTestCase(unittest.TestCase):

    def testImportContext(self):
        from cmlibs.zinc import context

    def testImportDifferentialoperator(self):
        from cmlibs.zinc import differentialoperator
    
    def testImportElement(self):
        from cmlibs.zinc import element
    
    def testImportField(self):
        from cmlibs.zinc import field
    
    def testImportFieldcache(self):
        from cmlibs.zinc import fieldcache
    
    def testImportFieldmodule(self):
        from cmlibs.zinc import fieldmodule
    
    def testImportGraphics(self):
        from cmlibs.zinc import graphics
        
    def testImportLight(self):
        from cmlibs.zinc import light
        
    def testImportLogger(self):
        from cmlibs.zinc import logger
    
    def testImportMaterial(self):
        from cmlibs.zinc import material
    
    def testImportNode(self):
        from cmlibs.zinc import node
    
    def testImportOptimisation(self):
        from cmlibs.zinc import optimisation
    
    def testImportRegion(self):
        from cmlibs.zinc import region
    
    def testImportScene(self):
        from cmlibs.zinc import scene
    
    def testImportScenecoordinatesystem(self):
        from cmlibs.zinc import scenecoordinatesystem
        
    def testImportScenefilter(self):
        from cmlibs.zinc import scenefilter
    
    def testImportSceneviewer(self):
        from cmlibs.zinc import sceneviewer
    
    def testImportSceneviewerinput(self):
        from cmlibs.zinc import sceneviewerinput
    
    def testImportSelection(self):
        from cmlibs.zinc import selection
    
    def testImportSpectrum(self):
        from cmlibs.zinc import spectrum
    
    def testImportStatus(self):
        from cmlibs.zinc import status
    
    def testImportStream(self):
        from cmlibs.zinc import stream
    
    def testImportTessellation(self):
        from cmlibs.zinc import tessellation
    
    def testImportTimekeeper(self):
        from cmlibs.zinc import timekeeper
    
    def testImportTimenotifier(self):
        from cmlibs.zinc import timenotifier
    
    def testImportTimesequence(self):
        from cmlibs.zinc import timesequence
    


def suite():
    #import ImportTestCase
    tests = unittest.TestSuite()
    tests.addTests(unittest.TestLoader().loadTestsFromTestCase(ImportTestCase))
    return tests

if __name__ == '__main__':
    res = unittest.TextTestRunner().run(suite())
    sys.exit(len(res.failures))

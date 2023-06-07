"""
PyZinc Unit Tests

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""

'''
Created on Jun 7, 2023

@author: rchristie
'''
import unittest

from cmlibs.zinc.context import Context
from cmlibs.zinc.field import Field


class GroupFieldTestCase(unittest.TestCase):

    def setUp(self):
        self.context = Context("grouptest")
        root_region = self.context.getDefaultRegion()
        self.field_module = root_region.getFieldmodule()

    def tearDown(self):
        del self.field_module
        del self.context

    def testGroupMesh(self):
        mesh = self.field_module.findMeshByDimension(3)
        self.assertTrue(mesh.isValid())
        group = self.field_module.createFieldGroup()        
        self.assertTrue(group.isValid())
        meshGroup = group.getOrCreateMeshGroup(mesh)
        self.assertTrue(meshGroup.isValid())
        self.assertEqual(group, meshGroup.getFieldGroup())

    def testGroupNodeset(self):
        nodeset = self.field_module.findNodesetByFieldDomainType(Field.DOMAIN_TYPE_NODES)
        self.assertTrue(nodeset.isValid())
        group = self.field_module.createFieldGroup()        
        self.assertTrue(group.isValid())
        nodesetGroup = group.getOrCreateNodesetGroup(nodeset)
        self.assertTrue(nodesetGroup.isValid())
        self.assertEqual(group, nodesetGroup.getFieldGroup())


def suite():
    #import ImportTestCase
    tests = unittest.TestSuite()
    tests.addTests(unittest.TestLoader().loadTestsFromTestCase(GroupFieldTestCase))
    return tests


if __name__ == '__main__':
    unittest.TextTestRunner().run(suite())

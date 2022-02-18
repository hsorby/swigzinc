"""
PyZinc Unit Tests

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""
'''
Created on Nov 2, 2021

@author: rchristie
'''
import unittest

from opencmiss.zinc.context import Context
from opencmiss.zinc.material import Material
from opencmiss.zinc import status


class MaterialmoduleRecordChange:

    def __init__(self):
        self._lastMaterialmoduleevent = None

    def callback(self, materialmoduleevent):
        self._lastMaterialmoduleevent = materialmoduleevent

    def clearLastEvent(self):
        self._lastMaterialmoduleevent = None

    def getLastEvent(self):
        return self._lastMaterialmoduleevent


class MaterialTestCase(unittest.TestCase):

    def setUp(self):
        self._context = Context('materialtest')
        self._root_region = self._context.getDefaultRegion()

    def tearDown(self):
        del self._context

    def testMaterialmodulenotifier(self):
        mm = self._context.getMaterialmodule()
        self.assertTrue(mm.isValid())

        materialmodulenotifier = mm.createMaterialmodulenotifier()
        self.assertTrue(materialmodulenotifier.isValid())

        materialName = "bob"
        recordChange = MaterialmoduleRecordChange()
        self.assertEqual(status.OK, materialmodulenotifier.setCallback(recordChange.callback))

        material = mm.createMaterial()
        self.assertTrue(material.isValid())
        result = recordChange.getLastEvent().getSummaryMaterialChangeFlags()
        self.assertEqual(Material.CHANGE_FLAG_ADD, result)
        result = recordChange.getLastEvent().getMaterialChangeFlags(material)
        self.assertEqual(Material.CHANGE_FLAG_ADD, result)
        recordChange.clearLastEvent()

        self.assertEqual(status.OK, material.setName(materialName))
        result = recordChange.getLastEvent().getSummaryMaterialChangeFlags()
        self.assertEqual(Material.CHANGE_FLAG_IDENTIFIER, result)
        result = recordChange.getLastEvent().getMaterialChangeFlags(material)
        self.assertEqual(Material.CHANGE_FLAG_IDENTIFIER, result)
        recordChange.clearLastEvent()

        self.assertEqual(status.OK, material.setAttributeReal(Material.ATTRIBUTE_ALPHA, 0.5))
        result = recordChange.getLastEvent().getSummaryMaterialChangeFlags()
        self.assertEqual(Material.CHANGE_FLAG_DEFINITION | Material.CHANGE_FLAG_FULL_RESULT, result)
        result = recordChange.getLastEvent().getMaterialChangeFlags(material)
        self.assertEqual(Material.CHANGE_FLAG_DEFINITION | Material.CHANGE_FLAG_FULL_RESULT, result)
        recordChange.clearLastEvent()

        diffuseColour = [0.2, 0.4, 0.6]
        self.assertEqual(status.OK, material.setAttributeReal3(Material.ATTRIBUTE_DIFFUSE, diffuseColour))
        result = recordChange.getLastEvent().getSummaryMaterialChangeFlags()
        self.assertEqual(Material.CHANGE_FLAG_DEFINITION | Material.CHANGE_FLAG_FULL_RESULT, result)
        result = recordChange.getLastEvent().getMaterialChangeFlags(material)
        self.assertEqual(Material.CHANGE_FLAG_DEFINITION | Material.CHANGE_FLAG_FULL_RESULT, result)
        recordChange.clearLastEvent()

        self.assertEqual(status.OK, material.setManaged(True))
        result = recordChange.getLastEvent().getSummaryMaterialChangeFlags()
        self.assertEqual(Material.CHANGE_FLAG_DEFINITION, result)
        result = recordChange.getLastEvent().getMaterialChangeFlags(material)
        self.assertEqual(Material.CHANGE_FLAG_DEFINITION, result)
        recordChange.clearLastEvent()

        materialName2 = "fred"
        # add another material while unmanaging above material
        mm.beginChange()
        material2 = mm.createMaterial()
        self.assertTrue(material2.isValid())
        self.assertEqual(status.OK, material2.setName(materialName2))
        self.assertEqual(status.OK, material.setManaged(False))
        mm.endChange()
        result = recordChange.getLastEvent().getSummaryMaterialChangeFlags()
        self.assertEqual(Material.CHANGE_FLAG_ADD | Material.CHANGE_FLAG_DEFINITION, result)
        result = recordChange.getLastEvent().getMaterialChangeFlags(material)
        self.assertEqual(Material.CHANGE_FLAG_DEFINITION, result)
        result = recordChange.getLastEvent().getMaterialChangeFlags(material2)
        self.assertEqual(Material.CHANGE_FLAG_ADD, result)
        recordChange.clearLastEvent()

        # destroy by removing last reference
        del material
        result = recordChange.getLastEvent().getSummaryMaterialChangeFlags()
        self.assertEqual(Material.CHANGE_FLAG_REMOVE, result)
        recordChange.clearLastEvent()

        self.assertEqual(status.OK, materialmodulenotifier.clearCallback())


def suite():
    tests = unittest.TestSuite()
    tests.addTests(unittest.TestLoader().loadTestsFromTestCase(MaterialTestCase))
    return tests


if __name__ == '__main__':
    unittest.TextTestRunner().run(suite())

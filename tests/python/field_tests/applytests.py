"""
PyZinc Unit Tests

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""

'''
Created on Sep 29, 2021

@author: rchristie
'''
import unittest

from opencmiss.zinc.context import Context
from opencmiss.zinc import status


class ApplyFieldTestCase(unittest.TestCase):

    def setUp(self):
        self.context = Context("applytest")
        root_region = self.context.getDefaultRegion()
        self.field_module = root_region.getFieldmodule()

    def tearDown(self):
        del self.field_module
        del self.context

    def testApplyFieldEvaluate(self):
        arg1 = self.field_module.createFieldArgumentReal(2);
        arg2 = self.field_module.createFieldArgumentReal(2);
        sum = self.field_module.createFieldAdd(arg1, arg2)
        self.assertTrue(sum.isValid())
        f1 = self.field_module.createFieldConstant([1, 4])
        f2 = self.field_module.createFieldConstant([9, 16])
        applySum = self.field_module.createFieldApply(sum)
        self.assertEqual(status.OK, applySum.setBindArgumentSourceField(arg1, f1))
        self.assertEqual(status.OK, applySum.setBindArgumentSourceField(arg2, f2))
        self.assertEqual(2, applySum.getNumberOfBindings())
        self.assertEqual(arg1, applySum.getBindArgumentField(1))
        self.assertEqual(arg2, applySum.getBindArgumentField(2))
        self.assertEqual(f1, applySum.getBindArgumentSourceField(arg1))
        self.assertEqual(f2, applySum.getBindArgumentSourceField(arg2))
        fieldcache = self.field_module.createFieldcache()
        result, values = applySum.evaluateReal(fieldcache, 2)
        self.assertEqual(status.OK, result)
        self.assertAlmostEqual(values[0], 10.0, delta=1.0E-10);
        self.assertAlmostEqual(values[1], 20.0, delta=1.0E-10);


def suite():
    #import ImportTestCase
    tests = unittest.TestSuite()
    tests.addTests(unittest.TestLoader().loadTestsFromTestCase(ApplyFieldTestCase))
    return tests


if __name__ == '__main__':
    unittest.TextTestRunner().run(suite())

"""
PyZinc Unit tests

This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.
"""
'''
Created on May 22, 2013

@author: hsorby, rchristie
'''
import unittest
from opencmiss.zinc.context import Context
from opencmiss.zinc.field import Field
from opencmiss.zinc.result import RESULT_OK, RESULT_ERROR_NOT_FOUND


class RegionTestCase(unittest.TestCase):

    def setUp(self):
        self.c = Context("region")
        
    def tearDown(self):
        del self.c
        
    def findRegion(self, r, path):
        r.findSubregionAtPath(path)
        self.assertTrue(r.isValid())
        
    def testRegion(self):
        rr = self.c.getDefaultRegion()
        self.assertTrue(rr.isValid())
        sr = rr.createSubregion("bob/rick/mark")
        self.assertTrue(sr.isValid())
        tr = rr.findSubregionAtPath("/bob/rick/mark")
        self.assertTrue(tr.isValid())
        self.findRegion(rr, '/bob/rick/mark')

    def testGetContext(self):
        rr = self.c.getDefaultRegion()
        context = rr.getContext()
        self.assertTrue(context.isValid())
        self.assertEqual(context, self.c)

    def testWriteFieldNames(self):
        """
        This also tests SWIG typemaps for passing strings and lists of string
        """
        rr = self.c.getDefaultRegion()
        self.assertTrue(rr.isValid())
        fm = rr.getFieldmodule()
        self.assertTrue(fm.isValid())
        bob = fm.createFieldFiniteElement(1)
        self.assertTrue(bob.isValid())
        # following calls test SWIG wrappers for setting/getting single strings
        self.assertEqual(RESULT_OK, bob.setName("bob"))
        self.assertEqual("bob", bob.getName())
        fred = fm.createFieldFiniteElement(1)
        self.assertTrue(fred.isValid())
        self.assertEqual(RESULT_OK, fred.setName("fred"))
        joe = fm.createFieldFiniteElement(1)
        self.assertTrue(joe.isValid())
        self.assertEqual(RESULT_OK, joe.setName("joe"))
        nodes = fm.findNodesetByFieldDomainType(Field.DOMAIN_TYPE_NODES)
        nt = nodes.createNodetemplate()
        self.assertEqual(RESULT_OK, nt.defineField(bob))
        self.assertEqual(RESULT_OK, nt.defineField(fred))
        self.assertEqual(RESULT_OK, nt.defineField(joe))
        node = nodes.createNode(1, nt)
        self.assertTrue(node.isValid())

        sir = rr.createStreaminformationRegion()
        self.assertTrue(sir.isValid())
        mr = sir.createStreamresourceMemory()
        try:
            sir.setResourceFieldNames(mr, 5)
            self.fail("setResourceFieldNames with integer argument did not raise exception")
        except TypeError:
            pass
        try:
            sir.setResourceFieldNames(mr, [5, "joe"])
            self.fail("setResourceFieldNames with integer list member did not raise exception")
        except TypeError:
            pass
        sir.setResourceFieldNames(mr, ["bob", "joe"])
        result = rr.write(sir)
        self.assertEqual(RESULT_OK, result)
        result, output = mr.getBuffer()
        self.assertEqual(RESULT_OK, result)
        self.assertTrue(b"bob" in output)
        self.assertFalse(b"fred" in output)
        self.assertTrue(b"joe" in output)

    def testTimeRange(self):
        """
        This also tests SWIG typemaps for passing strings and lists of string
        """
        rr = self.c.getDefaultRegion()
        cr = rr.createChild("child")
        self.assertTrue(cr.isValid())
        result, _, _ = rr.getTimeRange()
        self.assertEqual(RESULT_ERROR_NOT_FOUND, result)
        result, _, _ = cr.getTimeRange()
        self.assertEqual(RESULT_ERROR_NOT_FOUND, result)
        result, _, _ = rr.getHierarchicalTimeRange()
        self.assertEqual(RESULT_ERROR_NOT_FOUND, result)

        TOL = 1.0E-10
        times = [1.5, 3.1]
        fm = rr.getFieldmodule()
        timesequence = fm.getMatchingTimesequence(times)
        self.assertTrue(timesequence.isValid())

        result, minimumTime, maximumTime = rr.getTimeRange()
        self.assertEqual(RESULT_OK, result)
        self.assertAlmostEqual(times[0], minimumTime, delta=TOL)
        self.assertAlmostEqual(times[1], maximumTime, delta=TOL)
        result, _, _ = cr.getTimeRange()
        self.assertEqual(RESULT_ERROR_NOT_FOUND, result)
        result, minimumTime, maximumTime = rr.getHierarchicalTimeRange()
        self.assertEqual(RESULT_OK, result)
        self.assertAlmostEqual(times[0], minimumTime, delta=TOL)
        self.assertAlmostEqual(times[1], maximumTime, delta=TOL)

        cfm = cr.getFieldmodule()
        ctimes = [1.1, 2.2, 3.3]
        ctimesequence = cfm.getMatchingTimesequence(ctimes)
        self.assertTrue(ctimesequence.isValid())

        result, minimumTime, maximumTime = rr.getTimeRange()
        self.assertEqual(RESULT_OK, result)
        self.assertAlmostEqual(times[0], minimumTime, delta=TOL)
        self.assertAlmostEqual(times[1], maximumTime, delta=TOL)
        result, minimumTime, maximumTime = cr.getTimeRange()
        self.assertEqual(RESULT_OK, result)
        self.assertAlmostEqual(ctimes[0], minimumTime, delta=TOL)
        self.assertAlmostEqual(ctimes[2], maximumTime, delta=TOL)
        result, minimumTime, maximumTime = rr.getHierarchicalTimeRange()
        self.assertEqual(RESULT_OK, result)
        self.assertAlmostEqual(ctimes[0], minimumTime, delta=TOL)
        self.assertAlmostEqual(ctimes[2], maximumTime, delta=TOL)


def suite():
    tests = unittest.TestSuite()
    tests.addTests(unittest.TestLoader().loadTestsFromTestCase(RegionTestCase))
    return tests


if __name__ == '__main__':
    unittest.TextTestRunner().run(suite())

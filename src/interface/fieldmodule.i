/**
 * fieldmodule.i
 *
 * Swig interface file for wrapping api functions in api/fieldmodule.hpp
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") fieldmodule
%include "pyzincstringhandling.i"
%typemap(in) (const char *fieldName) = (const char *name);
%typemap(in) (const char *nodeset_name) = (const char *name);
%typemap(in) (const char *meshName) = (const char *name);
%typemap(in) (const char *stringConstant) = (const char *name);

%extend CMLibs::Zinc::Fieldmodulenotifier {

    int setCallback(PyObject *callbackObject)
    {
        PyObject *my_callback = NULL;
        if (!PyCallable_Check(callbackObject))
        {
            PyErr_SetString(PyExc_TypeError, "callbackObject must be callable");
            return 0;
        }
        Py_XINCREF(callbackObject);         /* Add a reference to new callback */     /* Remember new callback */
        return cmzn_fieldmodulenotifier_set_callback(($self)->getId(), fieldmoduleCallbackToPython, (void *)callbackObject);
    }

    int clearCallback()
    {
      	void *user_data = cmzn_fieldmodulenotifier_get_callback_user_data(($self)->getId());
	    PyObject *callbackObject = static_cast<PyObject *>(user_data);
	    Py_XDECREF(callbackObject);         /* Decrease a reference count */
        return cmzn_fieldmodulenotifier_clear_callback(($self)->getId());
    }
}

%ignore CMLibs::Zinc::Fieldmodulenotifier::clearCallback();
// ignore following as array overload works the same
%ignore CMLibs::Zinc::Fieldmodule::createFieldComponent(const Field& sourceField, int sourceComponentIndex);

%include "doublevaluesarraytypemap.i"
%include "integervaluesarraytypemap.i"
%include "fieldarraytypemap.i"
%include "pyzincstringhandling.i"

%import "scenecoordinatesystem.i"
%import "timesequence.i"
%import "optimisation.i"
%import "field.i"
%import "fieldcache.i"
%import "fieldsmoothing.i"

%{
#include "cmlibs/zinc/fieldalias.hpp"
#include "cmlibs/zinc/fieldapply.hpp"
#include "cmlibs/zinc/fieldarithmeticoperators.hpp"
#include "cmlibs/zinc/fieldcache.hpp"
#include "cmlibs/zinc/fieldcomposite.hpp"
#include "cmlibs/zinc/fieldconditional.hpp"
#include "cmlibs/zinc/fieldconstant.hpp"
#include "cmlibs/zinc/fieldcoordinatetransformation.hpp"
#include "cmlibs/zinc/fieldderivatives.hpp"
#include "cmlibs/zinc/fieldfibres.hpp"
#include "cmlibs/zinc/fieldfiniteelement.hpp"
#include "cmlibs/zinc/fieldsubobjectgroup.hpp"
#include "cmlibs/zinc/fieldgroup.hpp"
#include "cmlibs/zinc/fieldimage.hpp"
#include "cmlibs/zinc/fieldimageprocessing.hpp"
#include "cmlibs/zinc/fieldlogicaloperators.hpp"
#include "cmlibs/zinc/fieldmatrixoperators.hpp"
#include "cmlibs/zinc/fieldmeshoperators.hpp"
#include "cmlibs/zinc/fieldnodesetoperators.hpp"
#include "cmlibs/zinc/fieldsceneviewerprojection.hpp"
#include "cmlibs/zinc/fieldtime.hpp"
#include "cmlibs/zinc/fieldtrigonometry.hpp"
#include "cmlibs/zinc/fieldvectoroperators.hpp"
#include "cmlibs/zinc/fieldmodule.hpp"
#include "cmlibs/zinc/fieldsmoothing.hpp"
#include "cmlibs/zinc/optimisation.hpp"

static void fieldmoduleCallbackToPython(cmzn_fieldmoduleevent_id fieldmoduleevent, void *user_data)
{
    PyObject *arglist = NULL;
    PyObject *result = NULL;
    PyObject *my_callback = (PyObject *)user_data;
    /* convert fieldmoduleevent to python object */
    PyObject *obj = NULL;
    CMLibs::Zinc::Fieldmoduleevent *fieldmoduleEvent = new CMLibs::Zinc::Fieldmoduleevent(cmzn_fieldmoduleevent_access(fieldmoduleevent));
    obj = SWIG_NewPointerObj(SWIG_as_voidptr(fieldmoduleEvent), SWIGTYPE_p_OpenCMISS__Zinc__Fieldmoduleevent, SWIG_POINTER_OWN |  0);
    /* Time to call the callback */
    arglist = Py_BuildValue("(N)", obj);
    result = PyObject_CallObject(my_callback, arglist);
    Py_DECREF(arglist);
    if (result)
    {
        Py_DECREF(result);
    }
}
%}

%include "cmlibs/zinc/fieldmodule.hpp"


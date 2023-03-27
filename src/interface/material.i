/**
 * material.i
 *
 * Swig interface file for Zinc material.
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") material

%include "doublevaluesarraytypemap.i"
%include "pyzincstringhandling.i"

%import "context.i"
%import "field.i"

%extend OpenCMISS::Zinc::Materialmodulenotifier {
	int setCallback(PyObject *callbackObject)
	{
		PyObject *my_callback = NULL;
		if (!PyCallable_Check(callbackObject))
		{
			PyErr_SetString(PyExc_TypeError, "callbackObject must be callable");
			return 0;
		}
		Py_XINCREF(callbackObject);         /* Add a reference to new callback */     /* Remember new callback */
		return cmzn_materialmodulenotifier_set_callback(($self)->getId(), materialmoduleCallbackToPython, (void *)callbackObject);
	}

	int clearCallback()
	{
		void *user_data = cmzn_materialmodulenotifier_get_callback_user_data(($self)->getId());
		PyObject *callbackObject = static_cast<PyObject *>(user_data);
		Py_XDECREF(callbackObject);         /* Decrease a reference count */
		return cmzn_materialmodulenotifier_clear_callback(($self)->getId());
	}
}

%ignore OpenCMISS::Zinc::Materialmodulenotifier::clearCallback();

%extend OpenCMISS::Zinc::Material {
	bool operator==(const OpenCMISS::Zinc::Material& other) const
	{
		return *($self) == other;
	}
}

%{
#include "opencmiss/zinc/material.hpp"
#include "opencmiss/zinc/fieldconditional.hpp"

static void materialmoduleCallbackToPython(cmzn_materialmoduleevent_id materialmoduleevent, 
	void *user_data)
{
	PyObject *arglist = NULL;
	PyObject *result = NULL;
	PyObject *my_callback = (PyObject *)user_data;
	/* convert materialmoduleevent to python object */
	PyObject *obj = NULL;
	OpenCMISS::Zinc::Materialmoduleevent *materialmoduleEvent = 
		new OpenCMISS::Zinc::Materialmoduleevent(cmzn_materialmoduleevent_access(materialmoduleevent));
	obj = SWIG_NewPointerObj(SWIG_as_voidptr(materialmoduleEvent), SWIGTYPE_p_OpenCMISS__Zinc__Materialmoduleevent, 1);
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

%include "opencmiss/zinc/material.hpp"

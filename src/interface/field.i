/**
 * field.i
 *
 * Swig interface file for wrapping api functions in api/field.hpp
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") field

%include "fieldarraytypemap.i"
%include "doublevaluesarraytypemap.i"
%include "fieldoperators.i"
%include "pyzincstringhandling.i"
%typemap(in) (const char *stringValue) = (const char *name);
%typemap(in) (const char *stringConstant) = (const char *name);
%typemap(in) (const char *fileName) = (const char *name);
%typemap(in) (const char *property) = (const char *name);

%import "differentialoperator.i"
%import "element.i"
%import "fieldassignment.i"
%import "fieldcache.i"
%import "fieldmodule.i"
%import "fieldparameters.i"
%import "fieldrange.i"
%import "fieldsmoothing.i"
%import "region.i"
%import "streamimage.i"

%{
#include "cmlibs/zinc/core.h"
#include "cmlibs/zinc/fieldalias.hpp"
#include "cmlibs/zinc/fieldapply.hpp"
#include "cmlibs/zinc/fieldarithmeticoperators.hpp"
#include "cmlibs/zinc/fieldcomposite.hpp"
#include "cmlibs/zinc/fieldconditional.hpp"
#include "cmlibs/zinc/fieldconstant.hpp"
#include "cmlibs/zinc/fieldcoordinatetransformation.hpp"
#include "cmlibs/zinc/fieldderivatives.hpp"
#include "cmlibs/zinc/fieldfibres.hpp"
#include "cmlibs/zinc/fieldfiniteelement.hpp"
#include "cmlibs/zinc/fieldgroup.hpp"
#include "cmlibs/zinc/fieldimage.hpp"
#include "cmlibs/zinc/fieldimageprocessing.hpp"
#include "cmlibs/zinc/fieldlogicaloperators.hpp"
#include "cmlibs/zinc/fieldmatrixoperators.hpp"
#include "cmlibs/zinc/fieldmeshoperators.hpp"
#include "cmlibs/zinc/fieldnodesetoperators.hpp"
#include "cmlibs/zinc/fieldsceneviewerprojection.hpp"
#include "cmlibs/zinc/fieldvectoroperators.hpp"
#include "cmlibs/zinc/fieldtime.hpp"
#include "cmlibs/zinc/fieldtrigonometry.hpp"
#include "cmlibs/zinc/field.hpp"
#include "cmlibs/zinc/fieldassignment.hpp"
#include "cmlibs/zinc/fieldcache.hpp"
#include "cmlibs/zinc/fieldparameters.hpp"
#include "cmlibs/zinc/fieldrange.hpp"
#include "cmlibs/zinc/fieldsmoothing.hpp"
#include "cmlibs/zinc/streamimage.hpp"
%}

%include "cmlibs/zinc/field.hpp"
%include "cmlibs/zinc/fieldapply.hpp"
%include "cmlibs/zinc/fieldcomposite.hpp"
%include "cmlibs/zinc/fieldconditional.hpp"
%include "cmlibs/zinc/fieldconstant.hpp"
%include "cmlibs/zinc/fieldcoordinatetransformation.hpp"
%include "cmlibs/zinc/fieldderivatives.hpp"
%include "cmlibs/zinc/fieldfibres.hpp"
%include "cmlibs/zinc/fieldfiniteelement.hpp"
%include "cmlibs/zinc/fieldgroup.hpp"
%include "cmlibs/zinc/fieldimage.hpp"
%include "cmlibs/zinc/fieldimageprocessing.hpp"
%include "cmlibs/zinc/fieldlogicaloperators.hpp"
%include "cmlibs/zinc/fieldmatrixoperators.hpp"
%include "cmlibs/zinc/fieldmeshoperators.hpp"
%include "cmlibs/zinc/fieldnodesetoperators.hpp"
%include "cmlibs/zinc/fieldsceneviewerprojection.hpp"
%include "cmlibs/zinc/fieldvectoroperators.hpp"
%include "cmlibs/zinc/fieldtime.hpp"
%include "cmlibs/zinc/fieldtrigonometry.hpp"
%include "cmlibs/zinc/fieldarithmeticoperators.hpp"
%include "cmlibs/zinc/fieldalias.hpp"

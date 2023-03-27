/**
 * fieldcache.i
 * 
 * Swig interface file for wrapping api functions in api/fieldcache.hpp
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") fieldcache
%include "doublevaluesarraytypemap.i"
%include "pyzincstringhandling.i"
%typemap(in) (const char *stringValue) = (const char *name);

%import "element.i"
%import "field.i"
%import "node.i"

%{
#include "opencmiss/zinc/fieldcache.hpp"
#include "opencmiss/zinc/fieldrange.hpp"
%}

%include "opencmiss/zinc/fieldcache.hpp"


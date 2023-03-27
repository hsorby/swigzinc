/**
 * element.i
 * 
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") element

%include "doublevaluesarraytypemap.i"
%include "integervaluesarraytypemap.i"
%include "pyzincstringhandling.i"

%import "field.i"
%import "node.i"

%extend CMLibs::Zinc::Element {
	bool operator==(const CMLibs::Zinc::Element& other) const
	{
		return *($self) == other;
	}
}

%extend CMLibs::Zinc::Mesh {
	bool operator==(const CMLibs::Zinc::Mesh& other) const
	{
		return *($self) == other;
	}
}

%{
#include "cmlibs/zinc/fieldimage.hpp"
#include "cmlibs/zinc/element.hpp"
#include "cmlibs/zinc/elementbasis.hpp"
#include "cmlibs/zinc/elementfieldtemplate.hpp"
#include "cmlibs/zinc/elementtemplate.hpp"
#include "cmlibs/zinc/mesh.hpp"
%}

%include "cmlibs/zinc/elementbasis.hpp"
%include "cmlibs/zinc/elementfieldtemplate.hpp"
%include "cmlibs/zinc/elementtemplate.hpp"
%include "cmlibs/zinc/element.hpp"
%include "cmlibs/zinc/mesh.hpp"


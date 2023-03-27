/**
 * light.i
 *
 * Swig interface file for Zinc light.
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") light
%include "pyzincstringhandling.i"

%include "doublevaluesarraytypemap.i"
%include "pyzincstringhandling.i"

%extend CMLibs::Zinc::Light {
	bool operator==(const CMLibs::Zinc::Light& other) const
	{
		return *($self) == other;
	}
}

%{
#include "cmlibs/zinc/light.hpp"
%}

%include "cmlibs/zinc/light.hpp"

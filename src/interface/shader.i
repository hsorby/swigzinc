/**
 * shader.i
 *
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") shader

%include "doublevaluesarraytypemap.i"
%include "integervaluesarraytypemap.i"
%include "pyzincstringhandling.i"

%extend CMLibs::Zinc::Shaderprogram {
	bool operator==(const CMLibs::Zinc::Shaderprogram& other) const
	{
		return *($self) == other;
	}
}

%extend CMLibs::Zinc::Shaderuniforms {
	bool operator==(const CMLibs::Zinc::Shaderuniforms& other) const
	{
		return *($self) == other;
	}
}

%{
#include "cmlibs/zinc/shader.hpp"
%}

%include "cmlibs/zinc/shader.hpp"

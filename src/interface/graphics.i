/**
 * graphics.i
 *
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") graphics
%include "doublevaluesarraytypemap.i"
%include "integervaluesarraytypemap.i"
%include "pyzincstringhandling.i"
%typemap(in) (const char *labelText) = (const char *name);

%import "field.i"
%import "font.i"
%import "glyph.i"
%import "material.i"
%import "scenecoordinatesystem.i"
%import "spectrum.i"
%import "tessellation.i"

%extend CMLibs::Zinc::Graphics {
	bool operator==(const CMLibs::Zinc::Graphics& other) const
	{
		return *($self) == other;
	}
}

%{
#include "cmlibs/zinc/core.h"
#include "cmlibs/zinc/fieldmodule.hpp"
#include "cmlibs/zinc/graphics.hpp"
#include "cmlibs/zinc/scene.hpp"
%}

%include "cmlibs/zinc/graphics.hpp"


/**
 * context.i
 *
 * Swig interface file for zinc context.
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") context

%include "pyzincstringhandling.i"

%typemap(in) (const char *contextName) = (const char *name);

%import "font.i"
%import "glyph.i"
%import "light.i"
%import "logger.i"
%import "material.i"
%import "region.i"
%import "scenefilter.i"
%import "sceneviewer.i"
%import "shader.i"
%import "spectrum.i"
%import "tessellation.i"
%import "timekeeper.i"
%include "integervaluesarraytypemap.i"

%extend CMLibs::Zinc::Context {
	bool operator==(const CMLibs::Zinc::Context& other) const
	{
		return *($self) == other;
	}
}

%{
#include "cmlibs/zinc/context.hpp"
#include "cmlibs/zinc/font.hpp"
#include "cmlibs/zinc/light.hpp"
#include "cmlibs/zinc/logger.hpp"
#include "cmlibs/zinc/glyph.hpp"
#include "cmlibs/zinc/material.hpp"
#include "cmlibs/zinc/region.hpp"
#include "cmlibs/zinc/scenefilter.hpp"
#include "cmlibs/zinc/sceneviewer.hpp"
#include "cmlibs/zinc/shader.hpp"
#include "cmlibs/zinc/spectrum.hpp"
#include "cmlibs/zinc/tessellation.hpp"
#include "cmlibs/zinc/timekeeper.hpp"
%}

%include "cmlibs/zinc/context.hpp"


/**
 * scene.i
 *
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") scene
%include "pyzincstringhandling.i"

%import "graphics.i"
%import "scenefilter.i"
%import "selection.i"
%import "timekeeper.i"
%import "scenepicker.i"
%import "shader.i"
%import "spectrum.i"
%import "streamscene.i"

%extend CMLibs::Zinc::Scene {
	bool operator==(const CMLibs::Zinc::Scene& other) const
	{
		return *($self) == other;
	}
}

%{
#include "cmlibs/zinc/scene.hpp"
#include "cmlibs/zinc/scenepicker.hpp"
#include "cmlibs/zinc/shader.hpp"
#include "cmlibs/zinc/spectrum.hpp"
#include "cmlibs/zinc/streamscene.hpp"
#include "cmlibs/zinc/sceneviewer.hpp"
%}

%include "cmlibs/zinc/scene.hpp"


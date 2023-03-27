/**
 * font.i
 *
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") font

%include "pyzincstringhandling.i"

%import "graphics.i"

%extend CMLibs::Zinc::Font {
	bool operator==(const CMLibs::Zinc::Font& other) const
	{
		return *($self) == other;
	}
}

%{
#include "cmlibs/zinc/font.hpp"
#include "cmlibs/zinc/fieldconditional.hpp"
%}

%include "cmlibs/zinc/font.hpp"


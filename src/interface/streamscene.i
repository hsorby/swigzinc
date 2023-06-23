/**
 * scene.i
 *
 * Swig interface file for Zinc scene stream API.
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") streamscene

%include "pyzincstringhandling.i"

%import "scene.i"
%import "stream.i"

%{
#include "cmlibs/zinc/streamscene.hpp"
%}

%include "cmlibs/zinc/streamscene.hpp"

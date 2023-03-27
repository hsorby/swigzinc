/**
 * fieldrange.i
 * 
 * Swig interface file for wrapping api functions in zinc/fieldrange.hpp
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") fieldrange

%import "element.i"

%{
#include "cmlibs/zinc/fieldrange.hpp"
%}

%include "cmlibs/zinc/fieldrange.hpp"

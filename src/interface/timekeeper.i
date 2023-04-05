/**
 * timekeeper.i
 * 
 */
/*
 * Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

%module(package="cmlibs.zinc") timekeeper
%include "pyzincstringhandling.i"

%import "timenotifier.i"

%{
#include "cmlibs/zinc/timekeeper.hpp"
#include "cmlibs/zinc/timenotifier.hpp"
%}

%include "cmlibs/zinc/timekeeper.hpp"


/**
 * fieldoperators.i
 * 
 * Swig interface file for wrapping overloading operators of fields
 */
/*
 * OpenCMISS-Zinc Library
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
 
%extend CMLibs::Zinc::Field
{
	CMLibs::Zinc::FieldAdd operator+(CMLibs::Zinc::Field& operand)
	{
		return ($self)->getFieldmodule().createFieldAdd(*($self), operand);
	}
	
	CMLibs::Zinc::FieldSubtract operator-(CMLibs::Zinc::Field& operand)
	{
		return ($self)->getFieldmodule().createFieldSubtract(*($self), operand);
	}
	
	CMLibs::Zinc::FieldMultiply operator*(CMLibs::Zinc::Field& operand)
	{
		return ($self)->getFieldmodule().createFieldMultiply(*($self), operand);
	}
	
	CMLibs::Zinc::FieldDivide operator/(CMLibs::Zinc::Field& operand)
	{
		return ($self)->getFieldmodule().createFieldDivide(*($self), operand);
	}

	CMLibs::Zinc::FieldGreaterThan operator>(CMLibs::Zinc::Field& operand)
	{
		return ($self)->getFieldmodule().createFieldGreaterThan(*($self), operand);
	}

	CMLibs::Zinc::FieldLessThan operator<(CMLibs::Zinc::Field& operand)
	{
		return ($self)->getFieldmodule().createFieldLessThan(*($self), operand);
	}

	bool operator==(const CMLibs::Zinc::Field& other) const
	{
		return *($self) == other;
	}
};

/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Written (W) Fernando José Iglesias García
 * Copyright (C) Fernando José Iglesias García
 */

/* Loss renames */
%rename(LossFunction) CLossFunction;
%rename(HingeLoss) CHingeLoss;
%rename(LogLoss) CLogLoss;
%rename(LogLossMargin) CLogLossMargin;
%rename(SmoothHingeLoss) CSmoothHingeLoss;
%rename(SquearedHingeLoss) CSquaredHingeLoss;
%rename(SquaredLoss) CSquaredLoss;

/* Loss includes */
%include <loss/LossFunction.h>
%include <loss/HingeLoss.h>
%include <loss/LogLoss.h>
%include <loss/LogLossMargin.h>
%include <loss/SmoothHingeLoss.h>
%include <loss/SquaredHingeLoss.h>
%include <loss/SquaredLoss.h>

/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2018 HPCC Systems®.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */


IMPORT Std;
IMPORT common AS Certification;

STRING10 lnamein_value := 'BRYANT';

raw := Certification.DataFile;
i := Certification.IndexFile;

TYPEOF(raw) xt(raw l, i r) := TRANSFORM
  SELF.__filepos := r.__filepos;
  SELF := l;
EN

o := FETCH(raw, i(lname = Std.Str.ToUpperCase(lnamein_value)), RIGHT.__filepos, xt(LEFT, RIGHT));
OUTPUT(CHOOSEN(o,100));

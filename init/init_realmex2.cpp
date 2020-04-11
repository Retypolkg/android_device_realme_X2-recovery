/*
   Copyright (C) 2017-2018 The Android Open Source Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <unistd.h>
#include <fcntl.h>
#include <android-base/logging.h>
#include <android-base/properties.h>

#include "property_service.h"
#include "log.h"
#include <string>
#include <fstream>

using namespace std;

namespace android {
namespace init {

static bool file_exist (const std::string& name) {
    return ( access( name.c_str(), F_OK ) == 0 );
}

void load_CN() {
    property_set("ro.product.device", "RMX1991CN");
    property_set("ro.product.name", "RMX1991");
    property_set("ro.build.product", "RMX1991");
    property_set("ro.separate.soft", "19771");
}

void load_EU() {
    property_set("ro.product.device", "RMX1993");
    property_set("ro.product.name", "RMX1993");
    property_set("ro.build.product", "RMX1993");
    property_set("ro.separate.soft", "19672");
}

void load_IN() {
    property_set("ro.product.device", "RMX1992");
    property_set("ro.product.name", "RMX1992");
    property_set("ro.build.product", "RMX1992");
    property_set("ro.separate.soft", "19671");
}

void vendor_load_properties() {
    const char* path = "/proc/partitions";
	std::ifstream infile(path);
	std::string line;
	while (std::getline(infile, line))
	{
		if (line.find("sda7") != string::npos)
		{
			if (line.substr(17, 7) == "4218880") {
				load_CN();
				break;
			}
			else if (line.substr(17, 7) == "5557452") {
                const char* pathnfc = "/proc/touchpanel/NFC_CHECK";
                if (file_exist(pathnfc)){
                    std::ifstream infilenfc(pathnfc);
                    std::string linenfc;
                    std::getline(infilenfc, linenfc);
                    if(linenfc.compare("SUPPORTED") == 0){
                        load_EU();
                        break;
                    } else {
                        load_IN();
                        break;
                    }

                } else {
				    load_EU();
				    break;
                }
			}
			else
			{
				load_CN();
				break;
			}
		}
	}
}

}  // namespace init
}  // namespace android

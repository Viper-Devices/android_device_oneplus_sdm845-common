#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter enchilada,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))

NXP_LIB := libnxpnfc_nci_jni.so
NXP_SYMLINKS := $(addprefix $(TARGET_OUT_APPS)/NxpNfcNci/lib/arm64/,$(notdir $(NXP_LIB)))
$(NXP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "NXP lib link: $@"
	@mkdir -p $(dir $@)
	rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(NXP_SYMLINKS)

endif

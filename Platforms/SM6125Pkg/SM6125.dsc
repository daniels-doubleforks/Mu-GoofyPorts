## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018 - 2019, Bingxing Wang. All rights reserved.
#  Copyright (c) 2022, Xilin Wu. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = SM6125
  PLATFORM_GUID                  = b6325ac2-9f3f-4b1d-b129-ac7b35ddde60
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/SM6125Pkg
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = SM6125Pkg/SM6125.fdf
  USE_DISPLAYDXE                 = FALSE
  SWITCHSLOT_SUPPORT             = FALSE
  MASS_STORAGE_SUPPORT           = FALSE

[BuildOptions.common]
  *_*_*_CC_FLAGS = -D DISABLE_NEW_DEPRECATED_INTERFACES -D HAS_MEMCPY_INTRINSICS

!include SM6125Pkg/Devices/$(TARGET_DEVICE)/$(TARGET_DEVICE).dsc.inc
!include QcomPkg/Qcom.dsc.inc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|19200000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|17
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|18
  gArmTokenSpaceGuid.PcdGicDistributorBase|0xf200000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0xf300000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00006125
  gEmbeddedTokenSpaceGuid.PcdInterruptBaseAddress|0xf300000
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|44

  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

[LibraryClasses.common]
  PlatformMemoryMapLib|SM6125Pkg/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf
  PlatformPeiLib|SM6125Pkg/Library/PlatformPei/PlatformPeiLib.inf
  PlatformPrePiLib|SM6125Pkg/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  MsPlatformDevicesLib|SM6125Pkg/Library/MsPlatformDevicesLib/MsPlatformDevicesLib.inf
  SOCSmbiosInfoLib|SM6125Pkg/Library/SOCSmbiosInfoLib/SOCSmbiosInfoLib.inf
  RFSProtectionLib|SM6125Pkg/Library/RFSProtectionLib/RFSProtectionLib.inf

[Components.AARCH64]
  DfciPkg/AuthManagerNull/AuthManagerNull.inf

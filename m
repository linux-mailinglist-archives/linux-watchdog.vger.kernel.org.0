Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0106AC77B
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Mar 2023 17:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbjCFQRF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Mar 2023 11:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjCFQQw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Mar 2023 11:16:52 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627D237F21;
        Mon,  6 Mar 2023 08:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678119195; x=1709655195;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fihONYvhf+Br0Spl2vVJqQu/mOH+QB2P1jfwqMQrPoA=;
  b=kPheXnfnEoJGCPzI5H3v4T5Z5WDDDKKxSYYKw7d//NGqMSF/xmXMgfi1
   QSLwlRHudkfQHkAoZt5UIGvwlCWuTZbtCYHfG7AbCInmTnnVCiu4prUHW
   bn/1mSNeiVVp2PNobOe9/R0Wwg/q5hpL0zXo8J9MROhK12TPwmEUlfHEB
   YfniLHVfJ/V4dtLNmzOcoEJefhoxoLpVn99BoGQu6cnCb2CVILEZTrdvb
   Yd8pCVWyj/4bgYkDhGGqzQz1QHEaB0nMO9kYTaG7VBc97duwYeU1RXggP
   b862sqoY9Q3BBECDLTwZVzz7tf4HcQufNQ6Y3GBqQYOEisrtwO9VGnx75
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315991472"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="315991472"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 08:11:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819356245"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="819356245"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2023 08:11:26 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZDQs-0000SR-0Q;
        Mon, 06 Mar 2023 16:11:26 +0000
Date:   Tue, 07 Mar 2023 00:10:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD REGRESSION
 dc837c1a5137a8cf2e9432c1891392b6a66f4d8d
Message-ID: <6406108c.tkhYD9h0eResA99V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: dc837c1a5137a8cf2e9432c1891392b6a66f4d8d  Add linux-next specific files for 20230306

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202302100744.d1zZxXFn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302111601.jtY4lKrA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302201555.OI4N54jb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302242257.4W4myB9z-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303061725.Wv3p5RDB-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

FAILED: load BTF from vmlinux: No data available
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1600:5: warning: no previous prototype for function 'vangogh_set_apu_thermal_limit' [-Wmissing-prototypes]
drivers/soc/renesas/pwc-rzv2m.c:124:34: warning: unused variable 'rzv2m_pwc_of_match' [-Wunused-const-variable]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/platform/x86/mlx-platform.c:6013 mlxplat_mlxcpld_verify_bus_topology() error: uninitialized symbol 'shift'.
drivers/usb/gadget/composite.c:2082:33: sparse: sparse: restricted __le16 degrades to integer
drivers/watchdog/imx2_wdt.c:442:22: sparse: sparse: symbol 'imx_wdt' was not declared. Should it be static?
drivers/watchdog/imx2_wdt.c:446:22: sparse: sparse: symbol 'imx_wdt_legacy' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|-- csky-randconfig-s031-20230305
|   |-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt-was-not-declared.-Should-it-be-static
|   `-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt_legacy-was-not-declared.-Should-it-be-static
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|-- openrisc-randconfig-r024-20230306
|   `-- FAILED:load-BTF-from-vmlinux:No-data-available
|-- sparc-randconfig-s032-20230305
|   |-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt-was-not-declared.-Should-it-be-static
|   `-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt_legacy-was-not-declared.-Should-it-be-static
|-- sparc64-randconfig-s051-20230305
|   |-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt-was-not-declared.-Should-it-be-static
|   `-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt_legacy-was-not-declared.-Should-it-be-static
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|-- x86_64-randconfig-m001-20230306
|   `-- drivers-platform-x86-mlx-platform.c-mlxplat_mlxcpld_verify_bus_topology()-error:uninitialized-symbol-shift-.
`-- x86_64-randconfig-s021
    `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
clang_recent_errors
|-- hexagon-randconfig-r045-20230306
|   `-- drivers-soc-renesas-pwc-rzv2m.c:warning:unused-variable-rzv2m_pwc_of_match
|-- mips-randconfig-r035-20230306
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu11-vangogh_ppt.c:warning:no-previous-prototype-for-function-vangogh_set_apu_thermal_limit
|-- powerpc-xes_mpc85xx_defconfig
|   `-- error:unknown-target-CPU
`-- riscv-randconfig-r042-20230306
    `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu11-vangogh_ppt.c:warning:no-previous-prototype-for-function-vangogh_set_apu_thermal_limit

elapsed time: 850m

configs tested: 151
configs skipped: 8

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r004-20230305   gcc  
alpha                randconfig-r005-20230306   gcc  
alpha                randconfig-r025-20230306   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230306   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r002-20230306   gcc  
arc                  randconfig-r022-20230305   gcc  
arc                  randconfig-r022-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230305   clang
arm64        buildonly-randconfig-r006-20230305   clang
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r014-20230306   gcc  
csky                 randconfig-r024-20230305   gcc  
csky                 randconfig-r031-20230306   gcc  
hexagon      buildonly-randconfig-r003-20230305   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
i386                          randconfig-c001   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230305   gcc  
ia64                 randconfig-r036-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230305   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230305   gcc  
loongarch            randconfig-r015-20230305   gcc  
loongarch            randconfig-r021-20230306   gcc  
m68k                             allmodconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r034-20230306   gcc  
microblaze   buildonly-randconfig-r004-20230305   gcc  
microblaze           randconfig-r013-20230305   gcc  
microblaze           randconfig-r032-20230306   gcc  
microblaze           randconfig-r033-20230305   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson2k_defconfig   clang
mips                 randconfig-r025-20230305   clang
mips                         rt305x_defconfig   gcc  
mips                   sb1250_swarm_defconfig   clang
mips                        vocore2_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230306   gcc  
nios2                randconfig-r035-20230305   gcc  
openrisc     buildonly-randconfig-r002-20230306   gcc  
openrisc             randconfig-r001-20230305   gcc  
openrisc             randconfig-r005-20230305   gcc  
openrisc             randconfig-r013-20230306   gcc  
openrisc             randconfig-r014-20230305   gcc  
openrisc             randconfig-r016-20230306   gcc  
openrisc             randconfig-r024-20230306   gcc  
openrisc             randconfig-r033-20230306   gcc  
openrisc             randconfig-r036-20230306   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230306   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r031-20230305   clang
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230305   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230305   clang
s390                 randconfig-r004-20230306   gcc  
s390                 randconfig-r023-20230305   gcc  
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230306   gcc  
sh                   randconfig-r012-20230306   gcc  
sh                   randconfig-r026-20230306   gcc  
sh                           se7724_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230306   gcc  
sparc                randconfig-r021-20230305   gcc  
sparc                randconfig-r026-20230305   gcc  
sparc64              randconfig-r034-20230305   gcc  
sparc64              randconfig-r035-20230306   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230306   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64               randconfig-r015-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230306   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r003-20230305   gcc  
xtensa               randconfig-r011-20230305   gcc  
xtensa               randconfig-r023-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

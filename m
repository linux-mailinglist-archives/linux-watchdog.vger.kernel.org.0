Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870DB6B0D00
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Mar 2023 16:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbjCHPjJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Mar 2023 10:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbjCHPiv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Mar 2023 10:38:51 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32A096C1F;
        Wed,  8 Mar 2023 07:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678289899; x=1709825899;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Oi3lNQaVAFKyZUn3mVauGWFNxI0A2vEeaMf+G8WoBDk=;
  b=ElS9RszdcOl5pNn5ZBzENkpYQiAnrh2ym6tGrj4920DEDwibqW2XVMf3
   xnqgWz772GgopEAWlBSQdR1GT6f1rFggmBVL2oVbQonduz3AUbIbZRqS5
   qus8oRLsZh91I9Yj1f6t/qR3vtulvWeLRi4kSrX0lnlEHUkWTLPGOGlEX
   EGl+mgcAlqmBNx+CXZz0UY8rKx3vbnX0v0kuRhcloDyIdFVBfmECNFIZn
   GMCjLuNh6Eva1K2Azh4fceqxQ6qrYuzP9BYb4m9KlcNcEwVZwR6j/4NVa
   CA1dchB05tAwEZ3oZ3JvRS37U9R9uOvCFN1OfoSRbynyLI/Yol/2OL5aF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336201687"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="336201687"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 07:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800797338"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="800797338"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 07:37:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZvrQ-0002EB-1r;
        Wed, 08 Mar 2023 15:37:48 +0000
Date:   Wed, 08 Mar 2023 23:37:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 fc31900c948610e7b5c2f15fb7795832c8325327
Message-ID: <6408abb4.d/PEd5OkKkiw2OLw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: fc31900c948610e7b5c2f15fb7795832c8325327  Add linux-next specific files for 20230308

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202302100744.d1zZxXFn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302111601.jtY4lKrA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303081345.OAmwqAh7-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303081432.D9JWIDY9-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303081657.6Ble80UY-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303081807.lBLWKmpX-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303082135.NjdX1Bij-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303082325.YWFMFBAj-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1214:31: warning: variable 'res_pool' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:2182: warning: expecting prototype for Check if there is a native DP or passive DP(). Prototype was for dp_is_sink_present() instead
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:2184: warning: expecting prototype for Check if there is a native DP or passive DP(). Prototype was for dp_is_sink_present() instead
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_dpia_bw.c:297:13: warning: variable 'available' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: warning: variable 'hotspotlimit' is uninitialized when used here [-Wuninitialized]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24: warning: variable 'memlimit' is uninitialized when used here [-Wuninitialized]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34: warning: variable 'software_shutdown_temp' is uninitialized when used here [-Wuninitialized]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:315:17: sparse:    int
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:315:17: sparse:    void
drivers/soc/renesas/pwc-rzv2m.c:124:34: warning: unused variable 'rzv2m_pwc_of_match' [-Wunused-const-variable]
security/security.c:3647: warning: expecting prototype for security_socket_create(). Prototype was for security_socket_post_create() instead
security/security.c:4110: warning: expecting prototype for security_socket_create(). Prototype was for security_socket_post_create() instead

Unverified Warning (likely false positive, please contact us if interested):

drivers/usb/gadget/composite.c:2082:33: sparse: sparse: restricted __le16 degrades to integer
drivers/watchdog/imx2_wdt.c:442:22: sparse: sparse: symbol 'imx_wdt' was not declared. Should it be static?
drivers/watchdog/imx2_wdt.c:446:22: sparse: sparse: symbol 'imx_wdt_legacy' was not declared. Should it be static?

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-s033-20230305
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_dpia_bw.c:warning:variable-available-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:sparse:int
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:sparse:sparse:incompatible-types-in-conditional-expression-(different-base-types):
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:sparse:void
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|-- csky-randconfig-s031-20230305
|   |-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt-was-not-declared.-Should-it-be-static
|   `-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt_legacy-was-not-declared.-Should-it-be-static
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|-- i386-buildonly-randconfig-r006-20230306
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|-- microblaze-randconfig-c033-20230305
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_dpia_bw.c:warning:variable-available-set-but-not-used
|-- openrisc-randconfig-s052-20230305
|   `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_dpia_bw.c:warning:variable-available-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm_mst_types.c:warning:variable-res_pool-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:expecting-prototype-for-Check-if-there-is-a-native-DP-or-passive-DP().-Prototype-was-for-dp_is_sink_present()-inste
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_dpia_bw.c:warning:variable-available-set-but-not-used
|-- sparc-randconfig-s032-20230305
|   |-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt-was-not-declared.-Should-it-be-static
|   `-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt_legacy-was-not-declared.-Should-it-be-static
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_dpia_bw.c:warning:variable-available-set-but-not-used
`-- x86_64-randconfig-s021
    `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
clang_recent_errors
|-- hexagon-randconfig-r023-20230306
|   `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead
|-- hexagon-randconfig-r045-20230305
|   `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead
|-- hexagon-randconfig-r045-20230306
|   `-- drivers-soc-renesas-pwc-rzv2m.c:warning:unused-variable-rzv2m_pwc_of_match
|-- riscv-randconfig-r034-20230305
|   `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead
|-- riscv-randconfig-r042-20230306
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:variable-hotspotlimit-is-uninitialized-when-used-here
|   |-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:variable-memlimit-is-uninitialized-when-used-here
|   `-- drivers-gpu-drm-amd-amdgpu-..-pm-swsmu-smu13-smu_v13_0_6_ppt.c:warning:variable-software_shutdown_temp-is-uninitialized-when-used-here
|-- s390-randconfig-r035-20230305
|   `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead
|-- x86_64-randconfig-a011-20230306
|   `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead
|-- x86_64-randconfig-a014-20230306
|   `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead
|-- x86_64-randconfig-a015-20230306
|   `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead
`-- x86_64-randconfig-a016-20230306
    `-- security-security.c:warning:expecting-prototype-for-security_socket_create().-Prototype-was-for-security_socket_post_create()-instead

elapsed time: 727m

configs tested: 143
configs skipped: 10

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230305   gcc  
alpha        buildonly-randconfig-r004-20230306   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230305   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          moxart_defconfig   clang
arm                        neponset_defconfig   clang
arm                  randconfig-r006-20230305   gcc  
arm                  randconfig-r021-20230306   gcc  
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm                       spear13xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230306   gcc  
arm64                randconfig-r004-20230305   clang
arm64                randconfig-r024-20230305   gcc  
csky         buildonly-randconfig-r001-20230306   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r032-20230305   gcc  
hexagon              randconfig-r011-20230306   clang
hexagon              randconfig-r022-20230306   clang
hexagon              randconfig-r023-20230306   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230306   gcc  
i386         buildonly-randconfig-r006-20230306   gcc  
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
i386                 randconfig-r034-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230305   gcc  
ia64                 randconfig-r005-20230306   gcc  
ia64                 randconfig-r012-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230305   gcc  
loongarch            randconfig-r021-20230305   gcc  
loongarch            randconfig-r036-20230305   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r013-20230305   gcc  
microblaze           randconfig-r013-20230306   gcc  
microblaze           randconfig-r031-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                 randconfig-r015-20230305   clang
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230306   gcc  
openrisc             randconfig-r014-20230306   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230305   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r005-20230305   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r023-20230305   gcc  
powerpc              randconfig-r031-20230305   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230305   gcc  
riscv        buildonly-randconfig-r005-20230306   clang
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230305   clang
riscv                randconfig-r024-20230306   clang
riscv                randconfig-r025-20230306   clang
riscv                randconfig-r034-20230305   clang
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230306   gcc  
s390                 randconfig-r016-20230306   clang
s390                 randconfig-r035-20230305   clang
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230305   gcc  
sh                   randconfig-r006-20230306   gcc  
sh                   randconfig-r012-20230306   gcc  
sh                   randconfig-r015-20230306   gcc  
sh                   randconfig-r026-20230305   gcc  
sh                   randconfig-r033-20230305   gcc  
sh                           sh2007_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230306   gcc  
sparc64              randconfig-r022-20230305   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230305   gcc  
xtensa               randconfig-r002-20230305   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

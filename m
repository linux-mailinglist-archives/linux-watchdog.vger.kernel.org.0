Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9A97C9300
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Oct 2023 08:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbjJNGhR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 Oct 2023 02:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbjJNGhQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 Oct 2023 02:37:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4D1BF;
        Fri, 13 Oct 2023 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697265435; x=1728801435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qTONI1fWdA+lqNPUY29CNOZIdwmpNPm69ZTN+9zKPhg=;
  b=Xdk+oiBtd+sK/BpXMO2CKVGTMZawDhEnWAX6DfX8NRCW10XvwRVmSIOF
   2CiEF2/hwVb8iSn1+9AoyPsPRpCAm9K30sP3yKxvkxUF4wtd+5ln5tqmF
   H0XCnuYgYE2hEUX9kckKqnYRPcMW+nhr0fokSi+rmJFFipWypFAl8UfCu
   TlyXK1r3iDVEO56KzPwFQ/f7HPbMbqxI9/XI+jiV8n1Cl51i3Daz/JjnA
   m0SA1lB9HrTcWSf+i5iAwqqemTFfRNIDkqbTVBFwqqikqKXp07eQdgI8I
   C4bJEYZPwvXgC0TmrJbTSJknNZx0r/GLTfmsrd4u7AeUpboaUpS1vAOaD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375658886"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375658886"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 23:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="790108731"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="790108731"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 23:37:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qrYGm-0005mp-1d;
        Sat, 14 Oct 2023 06:37:04 +0000
Date:   Sat, 14 Oct 2023 14:37:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 13/21] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
Message-ID: <202310141437.xBrLtPIH-lkp@intel.com>
References: <20231005155618.700312-14-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-14-peter.griffin@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on robh/for-next linus/master pinctrl-samsung/for-next v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-interrupt-controller-Add-gs101-interrupt-controller/20231005-235922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20231005155618.700312-14-peter.griffin%40linaro.org
patch subject: [PATCH 13/21] clk: samsung: clk-gs101: Add cmu_top registers, plls, mux and gates
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141437.xBrLtPIH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141437.xBrLtPIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141437.xBrLtPIH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/samsung/clk-gs101.c:809:7: warning: unused variable 'mout_cmu_pdp_vra_p' [-Wunused-const-variable]
     809 | PNAME(mout_cmu_pdp_vra_p)       = { "fout_shared2_pll", "dout_shared0_div3",
         |       ^
>> drivers/clk/samsung/clk-gs101.c:888:7: warning: unused variable 'mout_cmu_boost_p' [-Wunused-const-variable]
     888 | PNAME(mout_cmu_boost_p)         = { "dout_shared0_div4", "dout_shared1_div4",
         |       ^
>> drivers/clk/samsung/clk-gs101.c:935:7: warning: unused variable 'mout_cmu_g2d_p' [-Wunused-const-variable]
     935 | PNAME(mout_cmu_g2d_p)           = { "dout_shared0_div3", "fout_shared3_pll",
         |       ^
   3 warnings generated.


vim +/mout_cmu_pdp_vra_p +809 drivers/clk/samsung/clk-gs101.c

   790	
   791	PNAME(mout_cmu_hsi2_ufs_embd_p)	= { "oscclk", "dout_shared0_div4",
   792					    "dout_shared2_div2", "fout_spare_pll" };
   793	
   794	PNAME(mout_cmu_hsi2_mmc_card_p)	= { "fout_shared2_pll", "fout_shared3_pll",
   795					    "dout_shared0_div4", "fout_spare_pll" };
   796	
   797	/* List of parent clocks for Muxes in CMU_TOP: for CMU_CSIS */
   798	PNAME(mout_cmu_csis_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   799					    "dout_shared1_div3", "dout_shared0_div4",
   800					    "dout_shared1_div4", "dout_shared2_div2",
   801					    "fout_spare_pll" };
   802	
   803	/* List of parent clocks for Muxes in CMU_TOP: for CMU_PDP */
   804	PNAME(mout_cmu_pdp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   805					    "dout_shared1_div3", "dout_shared0_div4",
   806					    "dout_shared1_div4", "dout_shared2_div2",
   807					    "fout_spare_pll" };
   808	
 > 809	PNAME(mout_cmu_pdp_vra_p)	= { "fout_shared2_pll", "dout_shared0_div3",
   810					    "fout_shared3_pll", "dout_shared1_div3",
   811					    "dout_shared0_div4", "dout_shared1_div4",
   812					    "fout_spare_pll" };
   813	
   814	/* List of parent clocks for Muxes in CMU_TOP: for CMU_IPP */
   815	PNAME(mout_cmu_ipp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   816					    "dout_shared1_div3", "dout_shared0_div4",
   817					    "dout_shared1_div4", "dout_shared2_div2",
   818					    "fout_spare_pll" };
   819	
   820	/* List of parent clocks for Muxes in CMU_TOP: for CMU_G3AA */
   821	PNAME(mout_cmu_g3aa_p)		= { "dout_shared0_div3", "fout_shared3_pll",
   822					    "dout_shared1_div3", "dout_shared0_div4",
   823					    "dout_shared1_div4", "dout_shared2_div2",
   824					    "fout_spare_pll" };
   825	
   826	/* List of parent clocks for Muxes in CMU_TOP: for CMU_ITP */
   827	PNAME(mout_cmu_itp_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   828					    "dout_shared1_div3", "dout_shared0_div4",
   829					    "dout_shared1_div4", "dout_shared2_div2",
   830					    "fout_spare_pll" };
   831	
   832	/* List of parent clocks for Muxes in CMU_TOP: for CMU_DNS */
   833	PNAME(mout_cmu_dns_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   834					    "dout_shared1_div3", "dout_shared0_div4",
   835					    "dout_shared1_div4", "dout_shared2_div2",
   836					    "fout_spare_pll" };
   837	
   838	/* List of parent clocks for Muxes in CMU_TOP: for CMU_TNR */
   839	PNAME(mout_cmu_tnr_bus_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   840					    "dout_shared1_div3", "dout_shared0_div4",
   841					    "dout_shared1_div4", "dout_shared2_div2",
   842					    "fout_spare_pll" };
   843	
   844	/* List of parent clocks for Muxes in CMU_TOP: for CMU_MCSC */
   845	PNAME(mout_cmu_mcsc_itsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   846					    "dout_shared1_div3", "dout_shared0_div4",
   847					    "dout_shared1_div4", "dout_shared2_div2",
   848					    "fout_spare_pll" };
   849	
   850	PNAME(mout_cmu_mcsc_mcsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   851					    "dout_shared1_div3", "dout_shared0_div4",
   852					    "dout_shared1_div4", "dout_shared2_div2",
   853					    "fout_spare_pll" };
   854	
   855	/* List of parent clocks for Muxes in CMU_TOP: for CMU_GDC */
   856	PNAME(mout_cmu_gdc_scsc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   857					    "dout_shared1_div3", "dout_shared0_div4",
   858					    "dout_shared1_div4", "dout_shared2_div2",
   859					    "fout_spare_pll" };
   860	
   861	PNAME(mout_cmu_gdc_gdc0_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   862					    "dout_shared1_div3", "dout_shared0_div4",
   863					    "dout_shared1_div4", "dout_shared2_div2",
   864					    "fout_spare_pll" };
   865	
   866	PNAME(mout_cmu_gdc_gdc1_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   867					    "dout_shared1_div3", "dout_shared0_div4",
   868					    "dout_shared1_div4", "dout_shared2_div2",
   869					    "fout_spare_pll" };
   870	
   871	/* List of parent clocks for Muxes in CMU_TOP: for CMU_MFC */
   872	PNAME(mout_cmu_mfc_mfc_p)	= { "dout_shared0_div3", "fout_shared3_pll",
   873					    "dout_shared1_div3", "dout_shared0_div4",
   874					    "dout_shared1_div4", "dout_shared2_div2",
   875					    "fout_spare_pll" };
   876	
   877	/* List of parent clocks for Muxes in CMU_TOP: for DDRPHY0/1/2/3 */
   878	
   879	PNAME(mout_cmu_mif_switch_p)	= { "fout_shared0_pll", "fout_shared1_pll",
   880					    "dout_shared0_div2", "dout_shared1_div2",
   881					    "fout_shared2_pll", "dout_shared0_div3",
   882					    "fout_shared3_pll", "fout_spare_pll" };
   883	
   884	/* List of parent clocks for Muxes in CMU_TOP: for CMU_MIF0/1/2/3 */
   885	PNAME(mout_cmu_mif_busp_p)	= { "dout_shared0_div4", "dout_shared1_div4",
   886					    "dout_shared0_div5", "fout_spare_pll" };
   887	
 > 888	PNAME(mout_cmu_boost_p)		= { "dout_shared0_div4", "dout_shared1_div4",
   889					    "dout_shared2_div2", "dout_shared3_div2" };
   890	
   891	/* List of parent clocks for Muxes in CMU_TOP: for CMU_MISC */
   892	PNAME(mout_cmu_misc_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
   893					    "dout_shared3_div2", "fout_spare_pll" };
   894	PNAME(mout_cmu_misc_sss_p)	= { "dout_shared0_div4", "dout_shared2_div2",
   895					    "dout_shared3_div2", "fout_spare_pll" };
   896	
   897	/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC0 */
   898	PNAME(mout_cmu_peric0_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
   899					    "dout_shared3_div2", "fout_spare_pll" };
   900	PNAME(mout_cmu_peric0_ip_p)	= { "dout_shared0_div4", "dout_shared2_div2",
   901					    "dout_shared3_div2", "fout_spare_pll" };
   902	
   903	/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC1 */
   904	PNAME(mout_cmu_peric1_bus_p)	= { "dout_shared0_div4", "dout_shared2_div2",
   905					    "dout_shared3_div2", "fout_spare_pll" };
   906	PNAME(mout_cmu_peric1_ip_p)	= { "dout_shared0_div4", "dout_shared2_div2",
   907					    "dout_shared3_div2", "fout_spare_pll" };
   908	
   909	/* List of parent clocks for Muxes in CMU_TOP: for CMU_TPU */
   910	PNAME(mout_cmu_tpu_tpu_p)	= { "dout_shared0_div2", "dout_shared1_div2",
   911					    "fout_shared2_pll", "fout_shared3_pll",
   912					    "dout_shared0_div3", "dout_shared1_div3",
   913					    "dout_shared0_div4", "fout_spare_pll" };
   914	
   915	PNAME(mout_cmu_tpu_tpuctl_p)	= { "dout_shared0_div2", "dout_shared1_div2",
   916					    "fout_shared2_pll", "fout_shared3_pll",
   917					    "dout_shared0_div3", "dout_shared1_div3",
   918					    "dout_shared0_div4", "fout_spare_pll" };
   919	
   920	PNAME(mout_cmu_tpu_bus_p)	= { "dout_shared0_div2", "dout_shared1_div2",
   921					    "fout_shared2_pll", "fout_shared3_pll",
   922					    "dout_shared0_div3", "dout_shared1_div3",
   923					    "dout_shared0_div4", "fout_spare_pll" };
   924	
   925	PNAME(mout_cmu_tpu_uart_p)	= { "dout_shared0_div4", "dout_shared2_div2",
   926					    "dout_shared3_div2", "fout_spare_pll" };
   927	
   928	/* List of parent clocks for Muxes in CMU_TOP: for CMU_BO */
   929	PNAME(mout_cmu_bo_bus_p)	= { "fout_shared2_pll", "dout_shared0_div3",
   930					    "fout_shared3_pll", "dout_shared1_div3",
   931					    "dout_shared0_div4", "dout_shared1_div4",
   932					    "fout_spare_pll" };
   933	
   934	/* List of parent clocks for Muxes in CMU_TOP: for CMU_G2D */
 > 935	PNAME(mout_cmu_g2d_p)		= { "dout_shared0_div3", "fout_shared3_pll",
   936					    "dout_shared1_div3", "dout_shared0_div4",
   937					    "dout_shared1_div4", "dout_shared2_div2",
   938					    "fout_spare_pll" };
   939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

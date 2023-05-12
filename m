Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4136FFFBF
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 May 2023 06:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239875AbjELEwF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 May 2023 00:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239720AbjELEwE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 May 2023 00:52:04 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C31B2;
        Thu, 11 May 2023 21:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683867105; x=1715403105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NyIB/CXyxsn/NtOavJ2qH7mGRgxIAWm4RWZld4YUq1g=;
  b=ZOEQMHammbndTT5jSZzdix6gtgJLUIarzN4h7cS3qjpu55k6fKL5FDCM
   QI548v66ndbigQ3ruPBOi6+X1+MMUB5Yp2VXMNKgTjvykfAnd47V/qa+n
   RXPTb5q+QFgtF8e4Sbk7ssnz6qQNEIVvRNOn1dL9Haam7B6NiX3C0KQI+
   AarUMkEGXsxqedRYW/KVO0Yw6UvJJb1zv1V61HB8vhJ2HNyh9mmM/gxly
   Dy3NMLmayhlXtE5G6Oy1UOJOXtXiEabVb8Ql/MK4o8T48vT7ylw94CFKz
   yflKYiYh5jNnFP7d3DmE55byKj0CJKnO85fO+nfnaMWTQOx0aJlpaCWGC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416330128"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="416330128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 21:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677521648"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="677521648"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 May 2023 21:51:37 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxKki-0004XQ-1i;
        Fri, 12 May 2023 04:51:36 +0000
Date:   Fri, 12 May 2023 12:50:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Networking <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Staging Drivers <linux-staging@lists.linux.dev>,
        Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
        Linux Kernel Actions <linux-actions@lists.infradead.org>
Cc:     oe-kbuild-all@lists.linux.dev,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Tom Rix <trix@redhat.com>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Eric Dumazet <edumazet@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        "David A . Hinds" <dahinds@users.sourceforge.net>,
        Maxime Bizon <mbizon@freebox.fr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        Dan Carpenter <error27@gmail.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Simon Horman <simon.horman@corigine.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 06/10] pcmcia: Add SPDX identifier
Message-ID: <202305121243.1SzqYNEp-lkp@intel.com>
References: <20230511133406.78155-7-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511133406.78155-7-bagasdotme@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Bagas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac9a78681b921877518763ba0e89202254349d1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Bagas-Sanjaya/agp-amd64-Remove-GPL-distribution-notice/20230511-214307
base:   ac9a78681b921877518763ba0e89202254349d1b
patch link:    https://lore.kernel.org/r/20230511133406.78155-7-bagasdotme%40gmail.com
patch subject: [PATCH 06/10] pcmcia: Add SPDX identifier
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121243.1SzqYNEp-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> drivers/pcmcia/cirrus.h: 1:44 Invalid License ID: MPL
>> drivers/pcmcia/pd6729.c: 1:28 Invalid License ID: GPL-1.0-or-later
   include/net/bonding.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_audio.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_blowfish.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_cmx.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_core.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_dtmf.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/isdn/mISDN/dsp_tones.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/bonding/bond_main.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/bonding/bonding_priv.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/8390.h: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/apne.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/axnet_cs.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/hydra.c: 1:28 Invalid License ID: GPL-1.0-only
   drivers/net/ethernet/8390/lib8390.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/mac8390.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/ne.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/ne2k-pci.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/pcnet_cs.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/smc-ultra.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/8390/wd.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/i825xx/82596.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/i825xx/lasi_82596.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/net/ethernet/i825xx/lib82596.c: 1:28 Invalid License ID: GPL-1.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

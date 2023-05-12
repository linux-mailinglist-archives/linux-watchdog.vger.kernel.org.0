Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263B56FFFFF
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 May 2023 07:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239812AbjELFsr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 May 2023 01:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239720AbjELFsq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 May 2023 01:48:46 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804504202;
        Thu, 11 May 2023 22:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683870525; x=1715406525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/zR9C5mWoNpqSw0olILmob7az1hEmUXJdSo3156BTBk=;
  b=LmtYgB6o0Vx4HzxJgFkCe4OaLpPvfSuR0/agJeSkh3czJEcCxCsTHmPQ
   k+MC48ZVtp25GUhl1UrnVvhTJa3OT/yr9wm9WV5R6z9Vgc8liwgDoz3tT
   pcGmVgv4mp6aP6nOecp+Sm/R78EAj7bE3uYRt9YOKrTVN84IKcjwjogM/
   MlUF6srcxMoF5cplaYLQHzzlPhiwUQ+cuhXOsIv0vPatmZh08xWT79DX+
   Rn6XLkazo8yMpW0W8JWvlqE5xcHsdoxHhpRP70RoSYJtUAzeGDvgXFY3B
   B7E+CrPJljsEUeQUz4agw7NS6ySLpbZkrMTfHSYCFaZesb9dqQje23QP3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378844762"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="378844762"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 22:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789667557"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="789667557"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 22:48:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pxLdt-0004ZR-2Y;
        Fri, 12 May 2023 05:48:37 +0000
Date:   Fri, 12 May 2023 13:47:40 +0800
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
        Diederik de Haas <didi.debian@cknow.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        David Airlie <airlied@redhat.com>,
        Karsten Keil <isdn@linux-pingi.de>,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Sam Creasey <sammy@sammy.net>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Jan Kara <jack@suse.com>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Tom Rix <trix@redhat.com>,
        Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH 09/10] udf: Replace license notice with SPDX identifier
Message-ID: <202305121334.gIY8h2Oe-lkp@intel.com>
References: <20230511133406.78155-10-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511133406.78155-10-bagasdotme@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
patch link:    https://lore.kernel.org/r/20230511133406.78155-10-bagasdotme%40gmail.com
patch subject: [PATCH 09/10] udf: Replace license notice with SPDX identifier
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121334.gIY8h2Oe-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
   drivers/pcmcia/cirrus.h: 1:44 Invalid License ID: MPL
   drivers/pcmcia/pd6729.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/watchdog/ibmasr.c: 1:28 Invalid License ID: GPL-1.0-or-later
   drivers/watchdog/sb_wdog.c: 1:28 Invalid License ID: GPL-1.0
>> fs/udf/ecma_167.h: 1:44 Invalid License ID: GPL-1.0-only
>> fs/udf/osta_udf.h: 1:44 Invalid License ID: GPL-1.0-only
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

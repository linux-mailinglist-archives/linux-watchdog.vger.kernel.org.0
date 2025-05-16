Return-Path: <linux-watchdog+bounces-3510-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3669FAB9650
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 08:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3854E7C22
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 06:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC5922171F;
	Fri, 16 May 2025 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVStc5d+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0470282F1;
	Fri, 16 May 2025 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747378576; cv=none; b=Mdftu1y/RmIkTOXegsOAGeYhSynaihpRt6bikfmYohWBof5/CPLLK6/vJuEaYte5zVVIFz5n4N801YSaDA9Wl/2wOGF9wcwg98QtbaltH7KLZzmFp2LuIcVihODALqnK7Abuq/HdnBho9vlcgcRV8ypBlV2GsTDeKEb+HawmJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747378576; c=relaxed/simple;
	bh=6rfuUKsjOTxXxT8uLY3kxtdvK2WPbv9CQZT5mG0czjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjlcaE7ECiIv2nxocCpajNoGxhp3lshMeTkA4zWLfzsTPrb7osZFyya7PHS2HjqBMsi57VP+wKWHXib9CTxcFFdZhHhfSDFeRdvCLNpiMwgM30csNpJNfTd81u1sTzEj5DJG5WIBKcHLSplcD2aXwW7KJq9ziZt1BWisoYjReFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVStc5d+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747378575; x=1778914575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6rfuUKsjOTxXxT8uLY3kxtdvK2WPbv9CQZT5mG0czjU=;
  b=XVStc5d+Cez+rAX9YiRsil8c4f3b8g/lUcIsnOtzSCG54wNlxEXnhSIj
   I6E2eMKQ+oWvW/xC3icoHq7qMUxOPExiRusFE4gByj+FxbNKlb6BTTVkB
   Beu4uGjOkrIzv2CYoB9BSHltQegSv4zDWUGgVGv0idxP0cx7vcE4xDbV6
   UdIrHLi8Q7ChzXZCSgldExULNiuOmJTFgMPnRtQC7PxN7Ntg5T25jM/Hp
   fdmLvSidj9WM9MnKGIkxWhdfiVeN4LVTRYpXooTYwKWxO2GW1ROV10T22
   ACmR5MnvSQLoS9Q+f317vOz2GZGl36vnyCroqInMv9Wwk6WxBspfIVXdF
   g==;
X-CSE-ConnectionGUID: YlU8t5dBQWuxydaNzqKCDA==
X-CSE-MsgGUID: NO6i86uQTDCKUTu+1Oo8Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74738750"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="74738750"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:56:14 -0700
X-CSE-ConnectionGUID: O0/Va5nMQmqorCi9kxe9jw==
X-CSE-MsgGUID: 9O/mnJV4RoG4sk0/ylvhkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138345283"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 May 2025 23:56:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFozI-000J4N-1Z;
	Fri, 16 May 2025 06:56:08 +0000
Date: Fri, 16 May 2025 14:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
Message-ID: <202505161430.wdURc0TG-lkp@intel.com>
References: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-4-2197a1b062bd%40gmail.com
patch subject: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC watchdog functionality
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250516/202505161430.wdURc0TG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161430.wdURc0TG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161430.wdURc0TG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/vt8500-wdt.c: In function 'vt8500_wdt_probe':
>> drivers/watchdog/vt8500-wdt.c:98:44: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '6148914691236517' to '3287081637' [-Woverflow]
      98 |         drvdata->wdd.max_hw_heartbeat_ms = -1UL / (VT8500_TIMER_HZ / 1000);
         |                                            ^


vim +98 drivers/watchdog/vt8500-wdt.c

    75	
    76	static int vt8500_wdt_probe(struct platform_device *pdev)
    77	{
    78		struct device *dev = &pdev->dev;
    79		struct vt8500_wdt *drvdata;
    80	
    81		drvdata = devm_kzalloc(dev, sizeof(struct vt8500_wdt), GFP_KERNEL);
    82		if (!drvdata)
    83			return -ENOMEM;
    84	
    85		/*
    86		 * The register area where the timer and watchdog reside is disarranged.
    87		 * Hence mapping individual register blocks for the timer and watchdog
    88		 * is not recommended as they would have access to each others
    89		 * registers. The timer driver creates the watchdog as a child device.
    90		 * During the watchdogs creation, the timer driver passes the base
    91		 * address to the watchdog over the private interface.
    92		 */
    93	
    94		drvdata->regbase = (void __iomem *)dev->platform_data;
    95	
    96		drvdata->wdd.info = &vt8500_watchdog_info;
    97		drvdata->wdd.ops = &vt8500_watchdog_ops;
  > 98		drvdata->wdd.max_hw_heartbeat_ms = -1UL / (VT8500_TIMER_HZ / 1000);
    99		drvdata->wdd.parent = dev;
   100	
   101		watchdog_set_drvdata(&drvdata->wdd, drvdata);
   102	
   103		return devm_watchdog_register_device(dev, &drvdata->wdd);
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


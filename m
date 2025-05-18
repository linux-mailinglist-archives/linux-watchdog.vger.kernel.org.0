Return-Path: <linux-watchdog+bounces-3517-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D0ABACFE
	for <lists+linux-watchdog@lfdr.de>; Sun, 18 May 2025 03:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63128178EB0
	for <lists+linux-watchdog@lfdr.de>; Sun, 18 May 2025 01:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40241548EE;
	Sun, 18 May 2025 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2U7Me7j"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73306610B;
	Sun, 18 May 2025 01:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747531484; cv=none; b=jqqUX4Jg8slGBKeY/hZONBP+lonmCOxBmQdMAGvmYujNgS1HOh2KCenSHMuRVWzPh+8ZliOdQoDGtznktuT8kO2DIEJL5/rn+DnXV6zeqnGDFHs+E/vhN1b7tcA1XpCq/jLsaa/+pyXlcHcLgW2/SZQFxmu3hmDFvD50IWUr204=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747531484; c=relaxed/simple;
	bh=GVpEsHZVrrsjA7zswAKObb5JB0OgW/GOr4FoLaILUQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3Yg9LzhTPoQzJxnK3Zv1m4Wo5axbY4CltQCrRNC5EoHCOPV3ZtPVWdS2z1J6Oh3JPEmZ/KgioHBOE+f/y0mtxxJaA+HwNLgoFUjcOwwaUB45GsgbJd2Y/j841ZNd/CFNPmiIs9dx88XcdTyGELyUMa0yAAL74lF1ISxDgTSQ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2U7Me7j; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747531482; x=1779067482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GVpEsHZVrrsjA7zswAKObb5JB0OgW/GOr4FoLaILUQw=;
  b=n2U7Me7j87NBthuThDXNE7xNs4uKqauC4fGMzVic75YgyB41z1uRdBSi
   jWrdYqFe/Ufp09U0w3R8SjTBg23WBRKu/uYkEFP15lEywLD4tk3oX6fFy
   KY1fWd+i5NzBY+jS+xYlrvctB07I7BakEfs3tMxVpQIKpS8bmdaITRB9B
   JfeIAaj6Lrx7A4KOg7c3P8CuRbou7ox3bJwxsy3k5q/8DsNJTb+ld6dz8
   QI9No1Kwm+f3pR+zcGyB8S9CFf4TeshASjgUtMmwHOdIdh9hR6v6Rd73C
   ImGPya2xfwiARWlCst8l6cag9X8HYDDnndTjSx3JLcXzCHA5OdUjUNCk1
   A==;
X-CSE-ConnectionGUID: xCv+MwsiQZykyg7Gl0hX4A==
X-CSE-MsgGUID: Yqr4NbDRQXC1jUxcddfOKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49394038"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49394038"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 18:24:42 -0700
X-CSE-ConnectionGUID: klB+4pyaQUG+Go610CoLIg==
X-CSE-MsgGUID: y3cYQp3ySzyHYD2rhtEsHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139081337"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 May 2025 18:24:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGSlY-000KXP-2W;
	Sun, 18 May 2025 01:24:36 +0000
Date: Sun, 18 May 2025 09:23:37 +0800
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
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for
 watchdog functionality
Message-ID: <202505180911.hDevFA1N-lkp@intel.com>
References: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-vt8500-timer-updates-v3-3-2197a1b062bd@gmail.com>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-3-2197a1b062bd%40gmail.com
patch subject: [PATCH v3 3/4] clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
config: loongarch-randconfig-r123-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180911.hDevFA1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180911.hDevFA1N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-vt8500.c:201:51: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *platform_data @@     got void [noderef] __iomem *static [assigned] [toplevel] regbase @@
   drivers/clocksource/timer-vt8500.c:201:51: sparse:     expected void *platform_data
   drivers/clocksource/timer-vt8500.c:201:51: sparse:     got void [noderef] __iomem *static [assigned] [toplevel] regbase

vim +201 drivers/clocksource/timer-vt8500.c

   175	
   176	/*
   177	 * This probe gets called after the timer is already up and running. This will create
   178	 * the watchdog device as a child since the registers are shared.
   179	 */
   180	static int vt8500_timer_probe(struct platform_device *pdev)
   181	{
   182		struct platform_device *vt8500_watchdog_device;
   183		struct device *dev = &pdev->dev;
   184		int ret;
   185	
   186		if (!sys_timer_ch) {
   187			dev_info(dev, "Not enabling watchdog: only one irq was given");
   188			return 0;
   189		}
   190	
   191		if (!regbase)
   192			return dev_err_probe(dev, -ENOMEM,
   193				"Timer not initialized, cannot create watchdog");
   194	
   195		vt8500_watchdog_device = platform_device_alloc("vt8500-wdt", -1);
   196		if (!vt8500_watchdog_device)
   197			return dev_err_probe(dev, -ENOMEM,
   198				"Failed to allocate vt8500-wdt");
   199	
   200		/* Pass the base address as platform data and nothing else */
 > 201		vt8500_watchdog_device->dev.platform_data = regbase;
   202		vt8500_watchdog_device->dev.parent = dev;
   203	
   204		ret = platform_device_add(vt8500_watchdog_device);
   205		if (ret)
   206			platform_device_put(vt8500_watchdog_device);
   207	
   208		return ret;
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


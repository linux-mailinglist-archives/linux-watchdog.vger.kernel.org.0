Return-Path: <linux-watchdog+bounces-2000-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AFD97DE10
	for <lists+linux-watchdog@lfdr.de>; Sat, 21 Sep 2024 19:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E241F21ADD
	for <lists+linux-watchdog@lfdr.de>; Sat, 21 Sep 2024 17:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335F1714DF;
	Sat, 21 Sep 2024 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7yNQUiz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734A20DF4;
	Sat, 21 Sep 2024 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726939083; cv=none; b=AIHrJJoHQoBHKJlbPHY4pyQj/X33qCqP3MnQmgOU46Bjudv0wLd41YxMrSuCeTDXcwwSY4j0bGMZ+n6fBn+I4TnKD6pAfbQVifkBseeP/DMH3a0BBLHJ5llJTzivKYSWTVW6qBMTafLfBlueQLuwK5xn2smxUQxKqHBsHkmt2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726939083; c=relaxed/simple;
	bh=egntPcUQkxhpz2Mm5Ta3LzMVdOxhXR02wTNKe+j+3Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFTOaRPAwRK5RBcAjqkKkbLNeOx6AiaZgw444cWC6OLxA8iQaLXzZ57J155m8/JE1ge3pWIHIX9C7pM6EbO2qWMXtjh9Bn33pXiwI0PrRWCEis1934cHvTy0NvZ/UMRYjqFfWLMgsu/Me4ugs9pO73WIzZZqu8WXnaqpjS8zocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7yNQUiz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726939081; x=1758475081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=egntPcUQkxhpz2Mm5Ta3LzMVdOxhXR02wTNKe+j+3Pk=;
  b=Z7yNQUiz0ci77reqHBv+/B0rMTUUIFwgPOwpBiXK30CDFWmTACzTPZUf
   42hwtAOheEfyY41+r0kcjrzKhIEF8uSU41qeXMYpmjkAw0pwPqlkinGga
   mtMgzy+OxBUvoFZ80qEfj+c2owjJPPiXFB3UFzWVofy4Lz+8RsjCUANg5
   HkYjTH3n0nX+/I1NtqMWW5ZnI4uRy5MlTYTshxbRn0W+9C/ow1sRxY9Tc
   8P3C56cPMiXjukT8F5EfckBOQ3FCBnp+0d69Flhu5Pcsy0WDIz14Q52ki
   4CwlKqNTa5c5A0KZjj8YeLDMlz52Frnu6ReQPxANpOnygulqDreJSqvEe
   w==;
X-CSE-ConnectionGUID: jq3EsPwzS0usMgE94Y4ZGQ==
X-CSE-MsgGUID: z+cY9JPVSEK+uAJil6c53g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26081919"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="26081919"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 10:18:01 -0700
X-CSE-ConnectionGUID: pZThl9+nQMyCV+UtQhlR5Q==
X-CSE-MsgGUID: +T6toXkWRc+dYtfuVxz/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70219986"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Sep 2024 10:17:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss3k3-000Fd9-2E;
	Sat, 21 Sep 2024 17:17:55 +0000
Date: Sun, 22 Sep 2024 01:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>, upstream@airoha.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] watchdog: Add support for Airoha EN7851 watchdog
Message-ID: <202409220008.Y6HbRYac-lkp@intel.com>
References: <20240919122759.10456-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919122759.10456-2-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on groeck-staging/hwmon-next linus/master v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/watchdog-Add-support-for-Airoha-EN7851-watchdog/20240919-203006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240919122759.10456-2-ansuelsmth%40gmail.com
patch subject: [PATCH 2/2] watchdog: Add support for Airoha EN7851 watchdog
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240922/202409220008.Y6HbRYac-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220008.Y6HbRYac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220008.Y6HbRYac-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/airoha_wdt.c: In function 'airoha_wdt_probe':
>> drivers/watchdog/airoha_wdt.c:155:33: error: implicit declaration of function 'FIELD_MAX' [-Wimplicit-function-declaration]
     155 |         wdog_dev->max_timeout = FIELD_MAX(WDT_TIMER_VAL) / airoha_wdt->wdt_freq;
         |                                 ^~~~~~~~~


vim +/FIELD_MAX +155 drivers/watchdog/airoha_wdt.c

   125	
   126	static int airoha_wdt_probe(struct platform_device *pdev)
   127	{
   128		struct device *dev = &pdev->dev;
   129		struct watchdog_device *wdog_dev;
   130		struct airoha_wdt_desc *airoha_wdt;
   131		int ret;
   132	
   133		airoha_wdt = devm_kzalloc(dev, sizeof(*airoha_wdt), GFP_KERNEL);
   134		if (!airoha_wdt)
   135			return -ENOMEM;
   136	
   137		airoha_wdt->base = devm_platform_ioremap_resource(pdev, 0);
   138		if (IS_ERR(airoha_wdt->base))
   139			return PTR_ERR(airoha_wdt->base);
   140	
   141		ret = device_property_read_u32(dev, "clock-frequency",
   142					       &airoha_wdt->wdt_freq);
   143		if (ret)
   144			return -EINVAL;
   145	
   146		/* Watchdog ticks at half the bus rate */
   147		airoha_wdt->wdt_freq /= 2;
   148	
   149		/* Initialize struct watchdog device */
   150		wdog_dev = &airoha_wdt->wdog_dev;
   151		wdog_dev->timeout = heartbeat;
   152		wdog_dev->info = &airoha_wdt_info;
   153		wdog_dev->ops = &airoha_wdt_ops;
   154		/* Bus 300MHz, watchdog 150MHz, 28 seconds */
 > 155		wdog_dev->max_timeout = FIELD_MAX(WDT_TIMER_VAL) / airoha_wdt->wdt_freq;
   156		wdog_dev->parent = dev;
   157	
   158		watchdog_set_drvdata(wdog_dev, airoha_wdt);
   159		watchdog_set_nowayout(wdog_dev, nowayout);
   160		watchdog_stop_on_unregister(wdog_dev);
   161	
   162		ret = devm_watchdog_register_device(dev, wdog_dev);
   163		if (ret)
   164			return ret;
   165	
   166		platform_set_drvdata(pdev, airoha_wdt);
   167		return 0;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


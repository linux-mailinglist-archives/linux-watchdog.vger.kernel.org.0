Return-Path: <linux-watchdog+bounces-2733-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEF8A15B53
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 04:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D72D2168F0F
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 03:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8763913D52E;
	Sat, 18 Jan 2025 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2UDjwnI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197381732;
	Sat, 18 Jan 2025 03:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737172280; cv=none; b=JoPDlhgg/aj392kgU0plfOU2ZgQEEgb6bQF8xl5OpZ70VpzFSEkaCCdpN4sawNV49rCucbzgia/R4+LGKZlqGRvhdq6Wdh2wx/EfPdqUbwDI95SX+LqAYOeZXcjnB9rN696t6J+gNRzL+1LZWAMJ939VudKCQEnpt8+v3APhl0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737172280; c=relaxed/simple;
	bh=NsLPs1LY+ZkZo6Cp2r5IAxQJ6eB/k/p/DA9Lgy3d1P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjoMMpTlMEqIXYG691NpW37RsNjabRhlyTeD/MDmf6iCA0G4popYga82dqBXqLQ3npzKFpg5YHrO05wkD2MK4jUOZgQXXyUjXJPxOLkGB7Wk7WRMGVY74Ng5ExRw8g28lyJIeiMGZd4Jdqau4dCVBZjT9H6hEu04CEP6X/4j+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2UDjwnI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737172279; x=1768708279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NsLPs1LY+ZkZo6Cp2r5IAxQJ6eB/k/p/DA9Lgy3d1P8=;
  b=h2UDjwnI89EpPdqjPI671AlX++ca+gRqJetl0nXHs8OxOZoekde23YEN
   1+dCEoJBdLZAkyZOUvM750UVHQnyU1xyWjXkTfijpS+/Us0fhG27G8xZZ
   rz0HbZS+VRy++8Y5X48BoxOJCv6Jk+gEEckcB0HWbLpGuGe1hRbt6z+st
   5OeQ9VzPwRV7vMCduzxE6qeAqkMgRm/jus0RObz1g0zIygkfhJ3O8AMuW
   PUO1ifhyMHYC1vJao3Abby40+nDVwVzgeJ20mUxhen1KVYz4Fh4iWlWl5
   a/5iVAQO7y9n6v7fUOo2PiMpzi9cFtPOWoYgubjKyL7TeFIh0q7E3idYw
   A==;
X-CSE-ConnectionGUID: hVnC6RhGQqO4hC/3h4b2ew==
X-CSE-MsgGUID: Za6BofmHSFqxqsU6MlXP5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37770585"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="37770585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 19:51:18 -0800
X-CSE-ConnectionGUID: ZKC+u8psRtegxT5L7eLHnA==
X-CSE-MsgGUID: 0KIS7bmkSJSrBPM+vI794w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="110972798"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 19:51:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYzre-000U3x-01;
	Sat, 18 Jan 2025 03:51:14 +0000
Date: Sat, 18 Jan 2025 11:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: oe-kbuild-all@lists.linux.dev, wim@linux-watchdog.org,
	linux@roeck-us.net, dober@lenovo.com,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo
 SE30 platform
Message-ID: <202501181145.cTfnETL4-lkp@intel.com>
References: <20250115140510.2017-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115140510.2017-1-mpearson-lenovo@squebb.ca>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/watchdog-lenovo_se30_wdt-Watchdog-driver-for-Lenovo-SE30-platform/20250115-220703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250115140510.2017-1-mpearson-lenovo%40squebb.ca
patch subject: [PATCH] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501181145.cTfnETL4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181145.cTfnETL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181145.cTfnETL4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/lenovo_se30_wdt.c: In function 'lenovo_se30_wdt_probe':
>> drivers/watchdog/lenovo_se30_wdt.c:314:31: error: implicit declaration of function 'ioremap_cache'; did you mean 'ioremap_uc'? [-Wimplicit-function-declaration]
     314 |         priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
         |                               ^~~~~~~~~~~~~
         |                               ioremap_uc
>> drivers/watchdog/lenovo_se30_wdt.c:314:29: error: assignment to 'unsigned char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     314 |         priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
         |                             ^


vim +314 drivers/watchdog/lenovo_se30_wdt.c

   276	
   277	static int lenovo_se30_wdt_probe(struct platform_device *pdev)
   278	{
   279		struct device *dev = &pdev->dev;
   280		struct lenovo_se30_wdt *priv;
   281		unsigned long base_phys;
   282		unsigned short val;
   283		int err;
   284	
   285		err = superio_enter(UNLOCK_KEY, SIO_REG, LNV_SE30_NAME);
   286		if (err)
   287			return err;
   288	
   289		val = superio_inb(SIO_REG, CHIPID_REG) << 8;
   290		val |= superio_inb(SIO_REG, CHIPID_REG + 1);
   291	
   292		if ((val & CHIPID_MASK) != LNV_SE30_ID) {
   293			superio_exit(LOCK_KEY, SIO_REG);
   294			return -ENODEV;
   295		}
   296	
   297		superio_outb(SIO_REG, LDN_REG, LD_NUM_SHM);
   298		base_phys = (superio_inb(SIO_REG, LD_BASE_ADDR) |
   299				 (superio_inb(SIO_REG, LD_BASE_ADDR + 1) << 8) |
   300				 (superio_inb(SIO_REG, LD_BASE_ADDR + 2) << 16) |
   301				 (superio_inb(SIO_REG, LD_BASE_ADDR + 3) << 24)) &
   302				0xFFFFFFFF;
   303	
   304		superio_exit(LOCK_KEY, SIO_REG);
   305		if (base_phys == 0xFFFFFFFF || base_phys == 0)
   306			return -ENODEV;
   307	
   308		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   309		if (!priv)
   310			return -ENOMEM;
   311	
   312		priv->sio.base_phys = base_phys;
   313		priv->shm.base_phys = base_phys;
 > 314		priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
   315	
   316		priv->wdt_cfg.mod = WDT_MODULE;
   317		priv->wdt_cfg.idx = WDT_CFG_INDEX;
   318		priv->wdt_cnt.mod = WDT_MODULE;
   319		priv->wdt_cnt.idx = WDT_CNT_INDEX;
   320	
   321		priv->wdt.ops = &lenovo_se30_wdt_ops;
   322		priv->wdt.info = &lenovo_se30_wdt_info;
   323		priv->wdt.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
   324		priv->wdt.min_timeout = MIN_TIMEOUT;
   325		priv->wdt.max_timeout = MAX_TIMEOUT;
   326		priv->wdt.parent = dev;
   327	
   328		watchdog_init_timeout(&priv->wdt, timeout, dev);
   329		watchdog_set_drvdata(&priv->wdt, priv);
   330		watchdog_set_nowayout(&priv->wdt, nowayout);
   331		watchdog_stop_on_reboot(&priv->wdt);
   332		watchdog_stop_on_unregister(&priv->wdt);
   333	
   334		return devm_watchdog_register_device(dev, &priv->wdt);
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Return-Path: <linux-watchdog+bounces-2732-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB10A15AD8
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 02:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543A4167F47
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 01:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6F615E8B;
	Sat, 18 Jan 2025 01:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELo7Gq0R"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624CD1C6BE;
	Sat, 18 Jan 2025 01:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737163678; cv=none; b=sFyDVNjYu98wAiUPZyxJAFmM43V6+OYJJtl8j7EBdYFKBx3ptFAyrCV/aesnssxEWWcTEXAJEWdF4ASbkbBuhvkJeQDPJ2I9O3hN3WuCU12clNX+jNXfehqPqcLPixNpDxjNcBat4nBNrza3VjmrNkHtEWrxL7lUVzyzwtKN+/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737163678; c=relaxed/simple;
	bh=rZay4Jsccg/xTNYp5ZcWkjQ/9kALxAhYawwmQcEOZu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdBkUeahrlIDmSL6B32jLzmJ3gvdaqw35yWUJcWuDcJs5MOfy35XSZbFHlE5qpBcuvQMLUN566yixCXN1AY44yPjmQEDAALqCijah8HXW/YmHraYjo7i+sMyE5EXvhRAdAoziFTHXym0Y5LGKEZTPhO0VJxRFIQ8jdiBdzwVITc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELo7Gq0R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737163677; x=1768699677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rZay4Jsccg/xTNYp5ZcWkjQ/9kALxAhYawwmQcEOZu0=;
  b=ELo7Gq0Rhd9eSOEKUgVlH3Gt2Sh2ISV3WIcjtaYItiqcsVwwLMZyUHgH
   2GCgpYvTWx5RvpgESzDvFdwMgMSIefAT2EXJEkKY/DqDfoZmbrr+q5D6x
   bNDJA8w5ee05WpsvHlxmXxv3KUnaJW5/UufyNBy7YstU7PgTVENloOB7I
   ymOyAgr7V1iYBBfWcsSdj672hjDKkP5k8JYZzg1R6dGiou4d0XKNFEzKI
   4y52tbyF7UiFCnY7VIrGE2n3AXP84C1e10FnNxw4atJTtzt6fbdOYNedc
   kdgGS1XwDUEK2mlCljPAZWuyPWAnDtDFaNqHQvH7fZFdK/7N+fSqIMFRH
   A==;
X-CSE-ConnectionGUID: 3muLyC60RD+TsKd599Cvew==
X-CSE-MsgGUID: 1fLeBjE9TAOtiI8dcXtKvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48109035"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48109035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 17:26:04 -0800
X-CSE-ConnectionGUID: YF6ihR7NRbiiP+WXuKS8Hg==
X-CSE-MsgGUID: nOEoJEz+RFawfS70s10erA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106426027"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 17:26:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYxb4-000Tv5-2H;
	Sat, 18 Jan 2025 01:25:58 +0000
Date: Sat, 18 Jan 2025 09:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	wim@linux-watchdog.org, linux@roeck-us.net, dober@lenovo.com,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo
 SE30 platform
Message-ID: <202501180914.vD2HyOZ2-lkp@intel.com>
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
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501180914.vD2HyOZ2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180914.vD2HyOZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180914.vD2HyOZ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/watchdog/lenovo_se30_wdt.c:11:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/watchdog/lenovo_se30_wdt.c:314:24: error: call to undeclared function 'ioremap_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     314 |         priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
         |                               ^
   drivers/watchdog/lenovo_se30_wdt.c:314:24: note: did you mean 'ioremap_uc'?
   include/asm-generic/io.h:1145:29: note: 'ioremap_uc' declared here
    1145 | static inline void __iomem *ioremap_uc(phys_addr_t offset, size_t size)
         |                             ^
   include/asm-generic/io.h:1144:20: note: expanded from macro 'ioremap_uc'
    1144 | #define ioremap_uc ioremap_uc
         |                    ^
>> drivers/watchdog/lenovo_se30_wdt.c:314:22: error: incompatible integer to pointer conversion assigning to 'unsigned char *' from 'int' [-Wint-conversion]
     314 |         priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
         |                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.


vim +/ioremap_cache +314 drivers/watchdog/lenovo_se30_wdt.c

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


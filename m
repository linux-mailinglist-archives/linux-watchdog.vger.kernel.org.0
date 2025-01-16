Return-Path: <linux-watchdog+bounces-2727-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B33A13EC8
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 17:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16A831684E1
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 16:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5108122BADA;
	Thu, 16 Jan 2025 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTprhpmB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76A22BAC9;
	Thu, 16 Jan 2025 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043648; cv=none; b=Uwk7OEUrbHmzWEoAUL6MRdusn1Og+okU/lAWjK0Je6LwA3vqFvmp9AIbmktypI0+CnafCeyP1aFquiWpQRIvg+GN+dvJqWru+ZW9Vu1cdK4g42V86RjqXaPInqoR5rSYcUk6sP+6Lu7SMYlNT6csqC43WmeFeqTuLu1HtCARTBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043648; c=relaxed/simple;
	bh=WpgGgfXm3efQ7xGbxj/c2xieYurixeIifC3uLpYpdMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esHld3neHCe0v3hC6wjvG7DxSfDPHnilus+zPBNHo4no4AVRNGHya37qzNvQ1E7PelNkVU2bX1Z2vlxDjKdft5y2BbD0Y+fesqPYTjGZJwQz4CkW3tQVLlCfMqhHYbHAMtx2PBbJXgzd/LxfZbB4GaB7dPWjjWvjfB1CZXfpuN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTprhpmB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737043646; x=1768579646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WpgGgfXm3efQ7xGbxj/c2xieYurixeIifC3uLpYpdMI=;
  b=TTprhpmB5/LRv41I7WxvIzjgq0tWqOCe+yqRBOxREdo/CdcsOOHE4DhR
   y3487Uo9xTxs+XslK2vrWxooVGRgATIzi80broAepmrvi9va58oYG6hoI
   gNp6y+AT1ZxcEROOcGni9dkliP9xtLBYbpvX9UaxHoVdD4HipOFelGNN5
   Z66SNjVlk0TsXLz9TfFjUafXIZ/WGrFosDQV+oxi4td5ippCKp019DP3d
   EG2EdgdxRtoB/Bwo7NwVBZSY9y1umKmiJlAE3aw4A2V1DcoQxOJG5nYdW
   V3mmcB5F0hdwglSGagRNsVEPY7fUMK7/tRp4IqCLlJVhiY5QVorpriXV4
   w==;
X-CSE-ConnectionGUID: 34gCsqFBRtaBtTp2C9jlzg==
X-CSE-MsgGUID: evkecwFYSwu1KIW8w8PedA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48102519"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="48102519"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 08:07:26 -0800
X-CSE-ConnectionGUID: LERfybiqQyGb9C59OGLCtw==
X-CSE-MsgGUID: ijevmV4fQUiOVYWXAEWjFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="105585192"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jan 2025 08:07:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYSOv-000S7P-2D;
	Thu, 16 Jan 2025 16:07:21 +0000
Date: Fri, 17 Jan 2025 00:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: oe-kbuild-all@lists.linux.dev, wim@linux-watchdog.org,
	linux@roeck-us.net, dober@lenovo.com,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo
 SE30 platform
Message-ID: <202501162358.vgAIFntg-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc7 next-20250116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/watchdog-lenovo_se30_wdt-Watchdog-driver-for-Lenovo-SE30-platform/20250115-220703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250115140510.2017-1-mpearson-lenovo%40squebb.ca
patch subject: [PATCH] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250116/202501162358.vgAIFntg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501162358.vgAIFntg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501162358.vgAIFntg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/lenovo_se30_wdt.c: In function 'lenovo_se30_wdt_probe':
   drivers/watchdog/lenovo_se30_wdt.c:314:31: error: implicit declaration of function 'ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=implicit-function-declaration]
     314 |         priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
         |                               ^~~~~~~~~~~~~
         |                               ioremap_uc
>> drivers/watchdog/lenovo_se30_wdt.c:314:29: warning: assignment to 'unsigned char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     314 |         priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
         |                             ^
   cc1: some warnings being treated as errors


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


Return-Path: <linux-watchdog+bounces-2001-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3497E042
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 08:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D01AC1C20987
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 06:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525DC175D35;
	Sun, 22 Sep 2024 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS0c3Wda"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC037156F23;
	Sun, 22 Sep 2024 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726985784; cv=none; b=YG25yWa2AgH6CgH6hEhrp/Cunj+IBpjI0Doht1bap3eNyDL8M+KWbVUB7PhkOudwhRvbcmskEj/X1/fVzOgEpLly6Ou3Tuth6VkknLfz9/NXuYyWs+ZXoSdmD8Pe7vZYKFXgHF6BL/s+0TVFv6LQm/MeH1NLR53ohrsubCo902k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726985784; c=relaxed/simple;
	bh=jLQBBH7PkiFVYfQSNKJyJOqxcJmkYuHF6kgWcROQ/ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qu0lP0ItGETZFQ5SNu8XZ+RAHcpfFKbZqPUCdlaFU1wi4RsMxvUf5+1ogoor4cL/aU9ap6ebTwf+8A3XveV4eKdfdhz0ct3DKA8VSs30QGaXJVba67pQlMng/gLY9dxFtX5gnzrQYdI/oIKpejjd5ohqY6kPfXn4v+vbR+oBWiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SS0c3Wda; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726985782; x=1758521782;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jLQBBH7PkiFVYfQSNKJyJOqxcJmkYuHF6kgWcROQ/ug=;
  b=SS0c3WdaFj++3iu6Kvyk5dM01OLFpf8lu5FtggJqPf1rHW1ocOOkjCsI
   8XL/Qe6Nbg6CoFo8V/n+nLUNjaZNGSwEvKwUORWpOmGFl/GkoblwTZCgX
   IWQppUe50N7Az65+t7m3fOm+G4qHfIvCDju8hetU2b1YYWb+5+a71JWfQ
   wIBqaUt2Nrh/Xk14khCnnqQ8NkpzyhtZL69Z9pK2c4eA6uQ+9bl71Bm+3
   s5pWif0X+4KlvH1VR9F5F8zybHyP7mZGngqS9nyG5c7wu7MzJ6B4TDg8v
   Vch5gu18ddbE5bxjd5Gu/NBVYIX4ymB444Jt9w8aUNgRAyACp+ElInnqO
   g==;
X-CSE-ConnectionGUID: 3VLYj2XBSF2JCE88kZP7UQ==
X-CSE-MsgGUID: NOBgIg9hS4GdcrKaaP9QYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25774848"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25774848"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 23:16:21 -0700
X-CSE-ConnectionGUID: bfyp8GGcT8qNJwbNe9Xe3Q==
X-CSE-MsgGUID: j8L92sxcQNCqzwD8e3wgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="71045957"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Sep 2024 23:16:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssFtH-000G4s-0m;
	Sun, 22 Sep 2024 06:16:15 +0000
Date: Sun, 22 Sep 2024 14:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>, upstream@airoha.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] watchdog: Add support for Airoha EN7851 watchdog
Message-ID: <202409221503.OVlRRuM7-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240922/202409221503.OVlRRuM7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221503.OVlRRuM7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221503.OVlRRuM7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/watchdog/airoha_wdt.c:17:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/watchdog/airoha_wdt.c:17:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/watchdog/airoha_wdt.c:17:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/watchdog/airoha_wdt.c:155:26: error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     155 |         wdog_dev->max_timeout = FIELD_MAX(WDT_TIMER_VAL) / airoha_wdt->wdt_freq;
         |                                 ^
   6 warnings and 1 error generated.


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


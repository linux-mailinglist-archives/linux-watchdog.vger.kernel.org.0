Return-Path: <linux-watchdog+bounces-3010-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80BA44E9A
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 22:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B5AD1899EFE
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 21:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD0520E31E;
	Tue, 25 Feb 2025 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ry2BuTOd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E37D1A9B46;
	Tue, 25 Feb 2025 21:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518124; cv=none; b=Apr/vRGhEfFmAeG4p/GAAMsmd1TDWDnR3nxjNwnHAjgzr/yEykbctaGYbeaKMTiOLE6G5y5MJFB8SXHX+7VbJuPt9+D1yMcNo6ppcKHIdSdCEEPxHLoGNIojB/570GybKyjnunmlxrjn3mmOod1LJOUTwniofvEGAS1rwFIJPCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518124; c=relaxed/simple;
	bh=lQJAQbZ4oPUDgplqxFG+FyGE3lJA+KrNuHVzwt4QK/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp7RFKT81kHryxpDsFPKV1A1jFXCSk3e8/WTgzqA0683ovxFzObEl/PJD3uc8PQj4Td8bUBNpCpXG9OCDBqEVYAlVEc+c1bLBhPrdwTOGzC+zc9vBJ6uLnjsJrL7BmRy80UYXO8ODBxz5+b4aFHB5VrZA3ffZ6B55NJS39FpCNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ry2BuTOd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740518121; x=1772054121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lQJAQbZ4oPUDgplqxFG+FyGE3lJA+KrNuHVzwt4QK/M=;
  b=Ry2BuTOdagmTj/H+tz8Fsd0BPpFOo1LjdlJgO/n18Seyw7/vHh1rcM8w
   bIEGtWb1WlMLcn10MiQdjMAKCurKMSDOaxPIEX466B+wxax0gdc/3Y5aK
   SgMGn8v69MO3OsaIznDb/0K4xFdBAEuoFTKagMddno6mzXC3MaPmNnDEy
   Y0H5qgVXX5D/HrE7dreBGHSXZvUf5fGrYTvUmCDPV7lHgPXaR3fTFUk46
   dmiPBp7cAwG8we/Zzyhp8vD4PTfAjVv0w1ydcXHPXxTu16YWeR+9zOQNQ
   YtnnKShSGtTg692hkX0z+vAfVaikZsYJZx9qVHhanSGlBi2JJI+OWR74s
   Q==;
X-CSE-ConnectionGUID: U1lFmua4To+UYMLITozHVg==
X-CSE-MsgGUID: MCel8il/ShitD+6LCjKXNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58768958"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="58768958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 13:15:20 -0800
X-CSE-ConnectionGUID: qRzw28haSNq80Ckope3R6Q==
X-CSE-MsgGUID: +LE8dPfEQiCVv6itHhBgbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="121122947"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2025 13:15:18 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn2Gp-000Amd-26;
	Tue, 25 Feb 2025 21:15:15 +0000
Date: Wed, 26 Feb 2025 05:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v1 1/1] watchdog: nic7018_wdt: tidy up ACPI ID table
Message-ID: <202502260415.PSbWYkXd-lkp@intel.com>
References: <20250225095804.360899-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225095804.360899-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.14-rc4 next-20250225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/watchdog-nic7018_wdt-tidy-up-ACPI-ID-table/20250225-180908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250225095804.360899-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] watchdog: nic7018_wdt: tidy up ACPI ID table
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250226/202502260415.PSbWYkXd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502260415.PSbWYkXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502260415.PSbWYkXd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/io.h:95,
                    from include/linux/io.h:14,
                    from drivers/watchdog/nic7018_wdt.c:8:
   drivers/watchdog/nic7018_wdt.c: In function 'nic7018_remove':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:229:9: note: in expansion of macro 'outb'
     229 |         outb(LOCK, wdt->io_base + WDT_REG_LOCK);
         |         ^~~~
   drivers/watchdog/nic7018_wdt.c: In function 'nic7018_set_timeout':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:96:9: note: in expansion of macro 'outb'
      96 |         outb(counter << 4 | config->divider,
         |         ^~~~
   drivers/watchdog/nic7018_wdt.c: In function 'nic7018_ping':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:138:9: note: in expansion of macro 'outb'
     138 |         outb(1, wdt->io_base + WDT_RELOAD_PORT);
         |         ^~~~
   drivers/watchdog/nic7018_wdt.c: In function 'nic7018_stop':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:127:9: note: in expansion of macro 'outb'
     127 |         outb(0, wdt->io_base + WDT_CTRL);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:128:9: note: in expansion of macro 'outb'
     128 |         outb(0, wdt->io_base + WDT_RELOAD_CTRL);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:129:9: note: in expansion of macro 'outb'
     129 |         outb(0xF0, wdt->io_base + WDT_PRESET_PRESCALE);
         |         ^~~~
   drivers/watchdog/nic7018_wdt.c: In function 'nic7018_get_timeleft':
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/watchdog/nic7018_wdt.c:148:17: note: in expansion of macro 'inb'
     148 |         count = inb(wdt->io_base + WDT_COUNT) & 0xF;
         |                 ^~~
   drivers/watchdog/nic7018_wdt.c: In function 'nic7018_start':
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/watchdog/nic7018_wdt.c:112:19: note: in expansion of macro 'inb'
     112 |         control = inb(wdt->io_base + WDT_RELOAD_CTRL);
         |                   ^~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:113:9: note: in expansion of macro 'outb'
     113 |         outb(control | WDT_RELOAD_PORT_EN, wdt->io_base + WDT_RELOAD_CTRL);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:115:9: note: in expansion of macro 'outb'
     115 |         outb(1, wdt->io_base + WDT_RELOAD_PORT);
         |         ^~~~
>> include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/watchdog/nic7018_wdt.c:117:19: note: in expansion of macro 'inb'
     117 |         control = inb(wdt->io_base + WDT_CTRL);
         |                   ^~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:118:9: note: in expansion of macro 'outb'
     118 |         outb(control | WDT_CTRL_RESET_EN, wdt->io_base + WDT_CTRL);
         |         ^~~~
   drivers/watchdog/nic7018_wdt.c: In function 'nic7018_probe':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:209:9: note: in expansion of macro 'outb'
     209 |         outb(UNLOCK, wdt->io_base + WDT_REG_LOCK);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/watchdog/nic7018_wdt.c:213:17: note: in expansion of macro 'outb'
     213 |                 outb(LOCK, wdt->io_base + WDT_REG_LOCK);
         |                 ^~~~


vim +/_outb +596 include/asm-generic/io.h

3f7e212df82ca0 Arnd Bergmann   2009-05-13  534  
9216efafc52ff9 Thierry Reding  2014-10-01  535  /*
9216efafc52ff9 Thierry Reding  2014-10-01  536   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff9 Thierry Reding  2014-10-01  537   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff9 Thierry Reding  2014-10-01  538   * take effect.
9216efafc52ff9 Thierry Reding  2014-10-01  539   */
9216efafc52ff9 Thierry Reding  2014-10-01  540  
f009c89df79abe John Garry      2020-03-28  541  #if !defined(inb) && !defined(_inb)
f009c89df79abe John Garry      2020-03-28 @542  #define _inb _inb
6f043e75744596 Niklas Schnelle 2024-10-24  543  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  544  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  545  {
87fe2d543f8173 Sinan Kaya      2018-04-05  546  	u8 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  547  
87fe2d543f8173 Sinan Kaya      2018-04-05  548  	__io_pbr();
87fe2d543f8173 Sinan Kaya      2018-04-05  549  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon     2019-02-22  550  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  551  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  552  }
6f043e75744596 Niklas Schnelle 2024-10-24  553  #else
6f043e75744596 Niklas Schnelle 2024-10-24  554  u8 _inb(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  555  	__compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  556  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  557  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  558  
f009c89df79abe John Garry      2020-03-28  559  #if !defined(inw) && !defined(_inw)
f009c89df79abe John Garry      2020-03-28  560  #define _inw _inw
6f043e75744596 Niklas Schnelle 2024-10-24  561  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  562  static inline u16 _inw(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  563  {
87fe2d543f8173 Sinan Kaya      2018-04-05  564  	u16 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  565  
87fe2d543f8173 Sinan Kaya      2018-04-05  566  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  567  	val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  568  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  569  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  570  }
6f043e75744596 Niklas Schnelle 2024-10-24  571  #else
6f043e75744596 Niklas Schnelle 2024-10-24  572  u16 _inw(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  573  	__compiletime_error("inw() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  574  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  575  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  576  
f009c89df79abe John Garry      2020-03-28  577  #if !defined(inl) && !defined(_inl)
f009c89df79abe John Garry      2020-03-28  578  #define _inl _inl
6f043e75744596 Niklas Schnelle 2024-10-24  579  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  580  static inline u32 _inl(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  581  {
87fe2d543f8173 Sinan Kaya      2018-04-05  582  	u32 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  583  
87fe2d543f8173 Sinan Kaya      2018-04-05  584  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  585  	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  586  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  587  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  588  }
6f043e75744596 Niklas Schnelle 2024-10-24  589  #else
6f043e75744596 Niklas Schnelle 2024-10-24  590  u32 _inl(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  591  	__compiletime_error("inl() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  592  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  593  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  594  
f009c89df79abe John Garry      2020-03-28  595  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28 @596  #define _outb _outb
6f043e75744596 Niklas Schnelle 2024-10-24  597  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  598  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  599  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  602  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  603  }
6f043e75744596 Niklas Schnelle 2024-10-24  604  #else
6f043e75744596 Niklas Schnelle 2024-10-24  605  void _outb(u8 value, unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  606  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  609  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


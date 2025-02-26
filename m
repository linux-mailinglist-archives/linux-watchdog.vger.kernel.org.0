Return-Path: <linux-watchdog+bounces-3012-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A2A451BC
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 01:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8024E189A2F0
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 00:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D6B15278E;
	Wed, 26 Feb 2025 00:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKOj+m0r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D371494C9;
	Wed, 26 Feb 2025 00:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740531002; cv=none; b=T10dGKb3G17Cki2cpTV+qX90Y/Ue0/Cmri3aY774iaY46NTqSmw9Bo99vaclbczSu9tR72FUzDKKh9VFnXWajyAeEY+kYLVIqDKm10o3I49AAN/PVD72SPcBfbtQk0uF7Bv3FdBD7i+qXJl5LuWH41mESvRjTD1RFjkKbm/jDRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740531002; c=relaxed/simple;
	bh=skkKd73cXLLRxcXwPAzNIOOjqaomSO+3N7ybm/u5Kkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saY6THP+9fHohpFissLD/lhoWyms7p5JisjpYtEOyFT21Px7Uc+/BLE0+/U+pNSwBAycUOc+Re7FY72e6C29dUZfHkAKpiqJjhn82NX+5escK0Ol33loTTSGxOXAhhL0JK15KExsH9Mxe0CBF4Zgj/m5CRBZHxGC1phZVaogmHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKOj+m0r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740531001; x=1772067001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=skkKd73cXLLRxcXwPAzNIOOjqaomSO+3N7ybm/u5Kkw=;
  b=nKOj+m0rfZq4ax6VpuPMX9oqGwbVwa9YVIWg8flc483HDAXWpUzq2thW
   USMuAihVmHSbNUjvnP+oqAGbox+BVlX8wKHp3lIvJ9DRqGhwxYJlsyuo3
   JHmT9POEa2j86i7iiAFf1ClV46LO41aWbqXHxw5p/Msk+ocXEM61Ktv+j
   eFHUHFLO3jKATrHGZKV7b02sQ/zZjGZI8xgUOfUOvuVOp51fUKwEVMGDI
   Pfh3Ts75PSlz/ck86WMKBsEC2JrO0yTDsX/+NC43q3rxCQz4zJqgKTfFd
   4nWuKgLKw5HBSolW0wl2XNe9Zk6D5Suf2tU/kIjBWraQihM8zrYlANCzh
   w==;
X-CSE-ConnectionGUID: aRB5iKtMQECNkob9B3sfZA==
X-CSE-MsgGUID: WhTE4aOMRKOD4VruGgYcGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52760452"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52760452"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 16:50:00 -0800
X-CSE-ConnectionGUID: RoHyEH7ETDGrYANjeA8Pog==
X-CSE-MsgGUID: WH0QefF3TPWVDVxU0kXDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116331979"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2025 16:49:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn5cZ-000AyR-0P;
	Wed, 26 Feb 2025 00:49:55 +0000
Date: Wed, 26 Feb 2025 08:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v1 1/1] watchdog: nic7018_wdt: tidy up ACPI ID table
Message-ID: <202502260805.jPVNYTZ0-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250226/202502260805.jPVNYTZ0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502260805.jPVNYTZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502260805.jPVNYTZ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/watchdog/nic7018_wdt.c:7:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/watchdog/nic7018_wdt.c:209:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     209 |         outb(UNLOCK, wdt->io_base + WDT_REG_LOCK);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:213:3: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     213 |                 outb(LOCK, wdt->io_base + WDT_REG_LOCK);
         |                 ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:229:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     229 |         outb(LOCK, wdt->io_base + WDT_REG_LOCK);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:96:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      96 |         outb(counter << 4 | config->divider,
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
>> drivers/watchdog/nic7018_wdt.c:112:12: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     112 |         control = inb(wdt->io_base + WDT_RELOAD_CTRL);
         |                   ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/watchdog/nic7018_wdt.c:113:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     113 |         outb(control | WDT_RELOAD_PORT_EN, wdt->io_base + WDT_RELOAD_CTRL);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:115:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     115 |         outb(1, wdt->io_base + WDT_RELOAD_PORT);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:117:12: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     117 |         control = inb(wdt->io_base + WDT_CTRL);
         |                   ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   drivers/watchdog/nic7018_wdt.c:118:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     118 |         outb(control | WDT_CTRL_RESET_EN, wdt->io_base + WDT_CTRL);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:127:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     127 |         outb(0, wdt->io_base + WDT_CTRL);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:128:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     128 |         outb(0, wdt->io_base + WDT_RELOAD_CTRL);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:129:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     129 |         outb(0xF0, wdt->io_base + WDT_PRESET_PRESCALE);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:138:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     138 |         outb(1, wdt->io_base + WDT_RELOAD_PORT);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:96:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
      96 |         outb(counter << 4 | config->divider,
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/nic7018_wdt.c:148:10: error: call to '_inb' declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
     148 |         count = inb(wdt->io_base + WDT_COUNT) & 0xF;
         |                 ^
   include/asm-generic/io.h:643:13: note: expanded from macro 'inb'
     643 | #define inb _inb
         |             ^
   include/asm-generic/io.h:542:14: note: expanded from macro '_inb'
     542 | #define _inb _inb
         |              ^
   3 warnings and 15 errors generated.


vim +209 drivers/watchdog/nic7018_wdt.c

98078ca34a0a71 Hui Chun Ong 2016-12-28  104  
98078ca34a0a71 Hui Chun Ong 2016-12-28  105  static int nic7018_start(struct watchdog_device *wdd)
98078ca34a0a71 Hui Chun Ong 2016-12-28  106  {
98078ca34a0a71 Hui Chun Ong 2016-12-28  107  	struct nic7018_wdt *wdt = watchdog_get_drvdata(wdd);
98078ca34a0a71 Hui Chun Ong 2016-12-28  108  	u8 control;
98078ca34a0a71 Hui Chun Ong 2016-12-28  109  
98078ca34a0a71 Hui Chun Ong 2016-12-28  110  	nic7018_set_timeout(wdd, wdd->timeout);
98078ca34a0a71 Hui Chun Ong 2016-12-28  111  
98078ca34a0a71 Hui Chun Ong 2016-12-28 @112  	control = inb(wdt->io_base + WDT_RELOAD_CTRL);
98078ca34a0a71 Hui Chun Ong 2016-12-28  113  	outb(control | WDT_RELOAD_PORT_EN, wdt->io_base + WDT_RELOAD_CTRL);
98078ca34a0a71 Hui Chun Ong 2016-12-28  114  
98078ca34a0a71 Hui Chun Ong 2016-12-28  115  	outb(1, wdt->io_base + WDT_RELOAD_PORT);
98078ca34a0a71 Hui Chun Ong 2016-12-28  116  
98078ca34a0a71 Hui Chun Ong 2016-12-28  117  	control = inb(wdt->io_base + WDT_CTRL);
98078ca34a0a71 Hui Chun Ong 2016-12-28  118  	outb(control | WDT_CTRL_RESET_EN, wdt->io_base + WDT_CTRL);
98078ca34a0a71 Hui Chun Ong 2016-12-28  119  
98078ca34a0a71 Hui Chun Ong 2016-12-28  120  	return 0;
98078ca34a0a71 Hui Chun Ong 2016-12-28  121  }
98078ca34a0a71 Hui Chun Ong 2016-12-28  122  
98078ca34a0a71 Hui Chun Ong 2016-12-28  123  static int nic7018_stop(struct watchdog_device *wdd)
98078ca34a0a71 Hui Chun Ong 2016-12-28  124  {
98078ca34a0a71 Hui Chun Ong 2016-12-28  125  	struct nic7018_wdt *wdt = watchdog_get_drvdata(wdd);
98078ca34a0a71 Hui Chun Ong 2016-12-28  126  
98078ca34a0a71 Hui Chun Ong 2016-12-28  127  	outb(0, wdt->io_base + WDT_CTRL);
98078ca34a0a71 Hui Chun Ong 2016-12-28  128  	outb(0, wdt->io_base + WDT_RELOAD_CTRL);
98078ca34a0a71 Hui Chun Ong 2016-12-28  129  	outb(0xF0, wdt->io_base + WDT_PRESET_PRESCALE);
98078ca34a0a71 Hui Chun Ong 2016-12-28  130  
98078ca34a0a71 Hui Chun Ong 2016-12-28  131  	return 0;
98078ca34a0a71 Hui Chun Ong 2016-12-28  132  }
98078ca34a0a71 Hui Chun Ong 2016-12-28  133  
98078ca34a0a71 Hui Chun Ong 2016-12-28  134  static int nic7018_ping(struct watchdog_device *wdd)
98078ca34a0a71 Hui Chun Ong 2016-12-28  135  {
98078ca34a0a71 Hui Chun Ong 2016-12-28  136  	struct nic7018_wdt *wdt = watchdog_get_drvdata(wdd);
98078ca34a0a71 Hui Chun Ong 2016-12-28  137  
98078ca34a0a71 Hui Chun Ong 2016-12-28  138  	outb(1, wdt->io_base + WDT_RELOAD_PORT);
98078ca34a0a71 Hui Chun Ong 2016-12-28  139  
98078ca34a0a71 Hui Chun Ong 2016-12-28  140  	return 0;
98078ca34a0a71 Hui Chun Ong 2016-12-28  141  }
98078ca34a0a71 Hui Chun Ong 2016-12-28  142  
98078ca34a0a71 Hui Chun Ong 2016-12-28  143  static unsigned int nic7018_get_timeleft(struct watchdog_device *wdd)
98078ca34a0a71 Hui Chun Ong 2016-12-28  144  {
98078ca34a0a71 Hui Chun Ong 2016-12-28  145  	struct nic7018_wdt *wdt = watchdog_get_drvdata(wdd);
98078ca34a0a71 Hui Chun Ong 2016-12-28  146  	u8 count;
98078ca34a0a71 Hui Chun Ong 2016-12-28  147  
98078ca34a0a71 Hui Chun Ong 2016-12-28  148  	count = inb(wdt->io_base + WDT_COUNT) & 0xF;
98078ca34a0a71 Hui Chun Ong 2016-12-28  149  	if (!count)
98078ca34a0a71 Hui Chun Ong 2016-12-28  150  		return 0;
98078ca34a0a71 Hui Chun Ong 2016-12-28  151  
98078ca34a0a71 Hui Chun Ong 2016-12-28  152  	return nic7018_timeout(wdt->period, count);
98078ca34a0a71 Hui Chun Ong 2016-12-28  153  }
98078ca34a0a71 Hui Chun Ong 2016-12-28  154  
98078ca34a0a71 Hui Chun Ong 2016-12-28  155  static const struct watchdog_info nic7018_wdd_info = {
98078ca34a0a71 Hui Chun Ong 2016-12-28  156  	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
98078ca34a0a71 Hui Chun Ong 2016-12-28  157  	.identity = "NIC7018 Watchdog",
98078ca34a0a71 Hui Chun Ong 2016-12-28  158  };
98078ca34a0a71 Hui Chun Ong 2016-12-28  159  
98078ca34a0a71 Hui Chun Ong 2016-12-28  160  static const struct watchdog_ops nic7018_wdd_ops = {
98078ca34a0a71 Hui Chun Ong 2016-12-28  161  	.owner = THIS_MODULE,
98078ca34a0a71 Hui Chun Ong 2016-12-28  162  	.start = nic7018_start,
98078ca34a0a71 Hui Chun Ong 2016-12-28  163  	.stop = nic7018_stop,
98078ca34a0a71 Hui Chun Ong 2016-12-28  164  	.ping = nic7018_ping,
98078ca34a0a71 Hui Chun Ong 2016-12-28  165  	.set_timeout = nic7018_set_timeout,
98078ca34a0a71 Hui Chun Ong 2016-12-28  166  	.get_timeleft = nic7018_get_timeleft,
98078ca34a0a71 Hui Chun Ong 2016-12-28  167  };
98078ca34a0a71 Hui Chun Ong 2016-12-28  168  
98078ca34a0a71 Hui Chun Ong 2016-12-28  169  static int nic7018_probe(struct platform_device *pdev)
98078ca34a0a71 Hui Chun Ong 2016-12-28  170  {
98078ca34a0a71 Hui Chun Ong 2016-12-28  171  	struct device *dev = &pdev->dev;
98078ca34a0a71 Hui Chun Ong 2016-12-28  172  	struct watchdog_device *wdd;
98078ca34a0a71 Hui Chun Ong 2016-12-28  173  	struct nic7018_wdt *wdt;
98078ca34a0a71 Hui Chun Ong 2016-12-28  174  	struct resource *io_rc;
98078ca34a0a71 Hui Chun Ong 2016-12-28  175  	int ret;
98078ca34a0a71 Hui Chun Ong 2016-12-28  176  
98078ca34a0a71 Hui Chun Ong 2016-12-28  177  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
98078ca34a0a71 Hui Chun Ong 2016-12-28  178  	if (!wdt)
98078ca34a0a71 Hui Chun Ong 2016-12-28  179  		return -ENOMEM;
98078ca34a0a71 Hui Chun Ong 2016-12-28  180  
98078ca34a0a71 Hui Chun Ong 2016-12-28  181  	platform_set_drvdata(pdev, wdt);
98078ca34a0a71 Hui Chun Ong 2016-12-28  182  
98078ca34a0a71 Hui Chun Ong 2016-12-28  183  	io_rc = platform_get_resource(pdev, IORESOURCE_IO, 0);
98078ca34a0a71 Hui Chun Ong 2016-12-28  184  	if (!io_rc) {
98078ca34a0a71 Hui Chun Ong 2016-12-28  185  		dev_err(dev, "missing IO resources\n");
98078ca34a0a71 Hui Chun Ong 2016-12-28  186  		return -EINVAL;
98078ca34a0a71 Hui Chun Ong 2016-12-28  187  	}
98078ca34a0a71 Hui Chun Ong 2016-12-28  188  
98078ca34a0a71 Hui Chun Ong 2016-12-28  189  	if (!devm_request_region(dev, io_rc->start, resource_size(io_rc),
98078ca34a0a71 Hui Chun Ong 2016-12-28  190  				 KBUILD_MODNAME)) {
98078ca34a0a71 Hui Chun Ong 2016-12-28  191  		dev_err(dev, "failed to get IO region\n");
98078ca34a0a71 Hui Chun Ong 2016-12-28  192  		return -EBUSY;
98078ca34a0a71 Hui Chun Ong 2016-12-28  193  	}
98078ca34a0a71 Hui Chun Ong 2016-12-28  194  
98078ca34a0a71 Hui Chun Ong 2016-12-28  195  	wdt->io_base = io_rc->start;
98078ca34a0a71 Hui Chun Ong 2016-12-28  196  	wdd = &wdt->wdd;
98078ca34a0a71 Hui Chun Ong 2016-12-28  197  	wdd->info = &nic7018_wdd_info;
98078ca34a0a71 Hui Chun Ong 2016-12-28  198  	wdd->ops = &nic7018_wdd_ops;
98078ca34a0a71 Hui Chun Ong 2016-12-28  199  	wdd->min_timeout = WDT_MIN_TIMEOUT;
98078ca34a0a71 Hui Chun Ong 2016-12-28  200  	wdd->max_timeout = WDT_MAX_TIMEOUT;
98078ca34a0a71 Hui Chun Ong 2016-12-28  201  	wdd->timeout = WDT_DEFAULT_TIMEOUT;
98078ca34a0a71 Hui Chun Ong 2016-12-28  202  	wdd->parent = dev;
98078ca34a0a71 Hui Chun Ong 2016-12-28  203  
98078ca34a0a71 Hui Chun Ong 2016-12-28  204  	watchdog_set_drvdata(wdd, wdt);
98078ca34a0a71 Hui Chun Ong 2016-12-28  205  	watchdog_set_nowayout(wdd, nowayout);
14fad5d98d9043 Wolfram Sang 2019-04-19  206  	watchdog_init_timeout(wdd, timeout, dev);
98078ca34a0a71 Hui Chun Ong 2016-12-28  207  
98078ca34a0a71 Hui Chun Ong 2016-12-28  208  	/* Unlock WDT register */
98078ca34a0a71 Hui Chun Ong 2016-12-28 @209  	outb(UNLOCK, wdt->io_base + WDT_REG_LOCK);
98078ca34a0a71 Hui Chun Ong 2016-12-28  210  
98078ca34a0a71 Hui Chun Ong 2016-12-28  211  	ret = watchdog_register_device(wdd);
98078ca34a0a71 Hui Chun Ong 2016-12-28  212  	if (ret) {
98078ca34a0a71 Hui Chun Ong 2016-12-28  213  		outb(LOCK, wdt->io_base + WDT_REG_LOCK);
98078ca34a0a71 Hui Chun Ong 2016-12-28  214  		return ret;
98078ca34a0a71 Hui Chun Ong 2016-12-28  215  	}
98078ca34a0a71 Hui Chun Ong 2016-12-28  216  
98078ca34a0a71 Hui Chun Ong 2016-12-28  217  	dev_dbg(dev, "io_base=0x%04X, timeout=%d, nowayout=%d\n",
98078ca34a0a71 Hui Chun Ong 2016-12-28  218  		wdt->io_base, timeout, nowayout);
98078ca34a0a71 Hui Chun Ong 2016-12-28  219  	return 0;
98078ca34a0a71 Hui Chun Ong 2016-12-28  220  }
98078ca34a0a71 Hui Chun Ong 2016-12-28  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


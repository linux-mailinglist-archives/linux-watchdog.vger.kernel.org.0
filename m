Return-Path: <linux-watchdog+bounces-1881-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DDE97785A
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 07:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18D99B266DB
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 05:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36C91A0BF6;
	Fri, 13 Sep 2024 05:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMRPyops"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BD818452A;
	Fri, 13 Sep 2024 05:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726205380; cv=none; b=I3l3q0+WtrlfWZAT6NeT1WtDrDac1w51OqIw/9F9fqN4TyjEGsU3H93RHkyiYGy5y+GO3F648W6BG02vb2PnpXWWfVXHbCPDEUtS6y/mXxACUPNUCRnPlb6RBHoUM5NU7ep0guQv6aMQm9Sg6p5fcxcZgibIuJuX3qGrcwYxOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726205380; c=relaxed/simple;
	bh=ER0LWJygxWB2+lQ+IjY4R07xESuKKsPQJxyG9bbi7d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8fQplm9B4KAz1GFgERxXhPk1T+KKP6k7DbKsZJngz+P6ht0kw+A58vSsOKUG/nyQWqQm016cxaNeCc6C7SPUhn8Bd7t49tv12gT9kR1/XiH4IoFrr6dGelhaZPtzZJ9AJe2JgzcCPleT/J00K7qfEqKxrSJWZFAwlecovI30Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMRPyops; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726205379; x=1757741379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ER0LWJygxWB2+lQ+IjY4R07xESuKKsPQJxyG9bbi7d0=;
  b=gMRPyopseWxS1FbICYvd0uN3qYxYG/Myhhh2MwzroWLR/gx8gA+e3R8l
   Nrmh3VxY0eK1wBFJE4UfmpDekIf9UN+l0b7hhaMdXKeLk/LdqvnFiHUMB
   1pr607q/9XlkPjAsWwkYkNso85pR1F7jdYEJ765y/0fwFyAID5McwTHuL
   CaiUBA4SYRk9eHVf3EQYVSZ3uuYDos0etl69belP3nMuCFT15T4io4ui8
   U7KnlDuNBcdNCUpqFJP4M3PqHrplHOW6Z6mUxN9RAECJc0pFXrLsEX/nR
   5s2rc7eZRsxt15kK0a+ddBldjUNOQysfe7eq0W+W8cj698llrKbU2lLhq
   A==;
X-CSE-ConnectionGUID: bNWxKZ5pRRWntYm1rcbdRw==
X-CSE-MsgGUID: mwM4Qo7AQfGKg67CrXQ3eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25190259"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25190259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 22:29:38 -0700
X-CSE-ConnectionGUID: fAWYf9XTQ5yp9oDmMO1T8Q==
X-CSE-MsgGUID: 7sMQdq5HRwi9jM5zAMbWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72047684"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 22:29:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soys8-00062k-2b;
	Fri, 13 Sep 2024 05:29:32 +0000
Date: Fri, 13 Sep 2024 13:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>, linux@roeck-us.net
Cc: oe-kbuild-all@lists.linux.dev, jdelvare@suse.de,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	mika.westerberg@linux.intel.com, oocheret@cisco.com,
	wim@linux-watchdog.org, wsa@kernel.org, xe-linux-external@cisco.com
Subject: Re: [PATCH v2] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit()
 call
Message-ID: <202409131302.oGABipcM-lkp@intel.com>
References: <20240912141931.2447826-1-oocheret@cisco.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912141931.2447826-1-oocheret@cisco.com>

Hi Oleksandr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.11-rc7 next-20240912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksandr-Ocheretnyi/iTCO_wdt-mask-NMI_NOW-bit-for-update_no_reboot_bit-call/20240912-222231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20240912141931.2447826-1-oocheret%40cisco.com
patch subject: [PATCH v2] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
config: i386-buildonly-randconfig-003-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131302.oGABipcM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131302.oGABipcM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131302.oGABipcM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/iTCO_wdt.c: In function 'update_no_reboot_bit_cnt':
>> drivers/watchdog/iTCO_wdt.c:226:33: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '4294967039' to '65279' [-Woverflow]
     226 |         u16 val, newval, mask = (~NMI_NOW);
         |                                 ^


vim +226 drivers/watchdog/iTCO_wdt.c

   222	
   223	static int update_no_reboot_bit_cnt(void *priv, bool set)
   224	{
   225		struct iTCO_wdt_private *p = priv;
 > 226		u16 val, newval, mask = (~NMI_NOW);
   227	
   228		/* writing back 1b1 to NMI_NOW of TCO1_CNT register
   229		 * causes NMI_NOW bit inversion what consequently does
   230		 * not allow to perform the register's value comparison
   231		 * properly.
   232		 *
   233		 * NMI_NOW bit masking for TCO1_CNT register values
   234		 * helps to avoid possible NMI_NOW bit inversions on
   235		 * following write operation.
   236		 */
   237		val = inw(TCO1_CNT(p)) & mask;
   238		if (set)
   239			val |= BIT(0);
   240		else
   241			val &= ~BIT(0);
   242		outw(val, TCO1_CNT(p));
   243		newval = inw(TCO1_CNT(p)) & mask;
   244	
   245		/* make sure the update is successful */
   246		return val != newval ? -EIO : 0;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


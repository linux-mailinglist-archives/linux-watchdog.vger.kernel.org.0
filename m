Return-Path: <linux-watchdog+bounces-1882-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54031977A5D
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 09:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C681F22F7E
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 07:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7946818DF8B;
	Fri, 13 Sep 2024 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5dhuyMI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AD529A2;
	Fri, 13 Sep 2024 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214326; cv=none; b=SYgwTxrghAxXlACFowOXy4NCz3oZB44hpTrxLACqgyFDjlR+90Qv7Q/VMzG6T7wDIT9CJYpuTo0vDaIwg3pes1OF+DY35cbayvbfFJNE+2AnG72qUkjCU+OSnPjRl3ihxOilSCgE882SV/CkpQhx76o1NlQpPSm1WHwy/1905Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214326; c=relaxed/simple;
	bh=R33KJXgCF2UVAD88HFe1cquUZLb+TaowomRrLGpX8+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1KBHR20aUpUTwd2XdB1Gv/bIAkyXK5PJP6h09fbe/X2zl/5Pbj23mUQY+snNGRYFSdN6mxduZiBFfFh8XZVYUKo6ZTjXddqKM0nAi6g9/duC09E3tw6x2BswlT9tEZPMs9E3k2rxDrcJLiatac7iA1GMr+YVYgmXN/n/PMElmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5dhuyMI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726214325; x=1757750325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R33KJXgCF2UVAD88HFe1cquUZLb+TaowomRrLGpX8+8=;
  b=Q5dhuyMIek3j2CTiTPXPnHJAVYrpC3c6T2pSov/ZUgIkGZJ96OZJOfk4
   ak5gAZr4VgV9tEkmsIwvrAVNvqQDyISJc8pLRtnKUD8pQTDpGYJdlRGvs
   9H99oGMjWS2/D5W2+dtLLbNL4Xk+TnV8rDtsVfIz3Ezue+8m+4jz9LSZU
   lbCnQSX/cpf4Xd8ijTcqW6/H0pia+wyHmaYOLSkwKhygqFKbZd8vafvDO
   JHGvgwt56+NCBvP3uNFMmUQkFCio1b8+JquXHFAJnJfTl0l1HPnnfwTmT
   mrJeA10oAMAwuj/4dPtcTPF7lMo7DnsDqODYp1DdqRejMAhD+YyIliMPc
   Q==;
X-CSE-ConnectionGUID: 3VQTyTw0SSmRm7Vn/kPWJQ==
X-CSE-MsgGUID: 96T4oGnjTjqR/iGNH2phtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24593452"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24593452"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 00:58:44 -0700
X-CSE-ConnectionGUID: ZLUg+ob8QfS9n+mUZ0HTsQ==
X-CSE-MsgGUID: cuWYqsxqTsyYRAw3nA34gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68748716"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2024 00:58:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp1CQ-0006A7-2E;
	Fri, 13 Sep 2024 07:58:38 +0000
Date: Fri, 13 Sep 2024 15:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>, linux@roeck-us.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jdelvare@suse.de,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	mika.westerberg@linux.intel.com, oocheret@cisco.com,
	wim@linux-watchdog.org, wsa@kernel.org, xe-linux-external@cisco.com
Subject: Re: [PATCH v2] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit()
 call
Message-ID: <202409131548.X0MGdN1r-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131548.X0MGdN1r-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131548.X0MGdN1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131548.X0MGdN1r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/iTCO_wdt.c:226:27: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 4294967039 to 65279 [-Wconstant-conversion]
     226 |         u16 val, newval, mask = (~NMI_NOW);
         |                          ~~~~    ^~~~~~~~
   1 warning generated.


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


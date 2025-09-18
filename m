Return-Path: <linux-watchdog+bounces-4262-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E25FAB853CF
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Sep 2025 16:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F4943B5D09
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Sep 2025 14:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092F51714B7;
	Thu, 18 Sep 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dssPPmx/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230211E47CC;
	Thu, 18 Sep 2025 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758205337; cv=none; b=hsf9tmM6H/tfN6JRL4zg90tKVdXWOHFO9UrjKjBIZJEzXUu9y9nV0wuB6EnUuCs150hejhbGkA98EMdOcEsbH6PShNuJDf4jkz09x9ZcVXoFYGe7HXXAF8c+6rPwZgfZxj9pswFS5j4hN1Gd1WSt5vJEyI1W2vvMZmGuRzfKqiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758205337; c=relaxed/simple;
	bh=yZvz1h0s9U3A3F3/HZVjib5XMzOzlsPLlFAz+LvWxYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aN32O5TxHFyNesDbz4hvMZItyJlhJiGjaeM8ActR9xworrnYDmK1/KicGvLWjlGarG0Em+4YzlOaiaMGW7hwOKPoEIRpGN9FX70wSg2URtbR0K8ojPE8c1S/QziHokrp++u7BArU1PAEdMD5/APnDXTiX2KQX6zFc7RaoOCYhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dssPPmx/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758205336; x=1789741336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZvz1h0s9U3A3F3/HZVjib5XMzOzlsPLlFAz+LvWxYw=;
  b=dssPPmx/qZ3MXHFh1nF+2z9hJFUF7tY612FffED+YsPqrN1Paiq7Z4Te
   1f/CcokR/JZd21XkBLSvEGqjGHkn/e+8ebFgFAq6gGEvs2JDOo+WM9IaK
   846P3CEgM4esa+vSH0KoGWnqg4ssrhqvgpwvsuUhEIHhN33/iRmUsuO3H
   3bUyhyhTMgVmQesh5ktfBckEcQHclFJ/QBRUVFVaP/Ei+p9QaMNwCU7W5
   UzP+gWjbblCcgFBpXgHQPuxVF5FGfvq/22xE93Vf18I3OgAgXeoP4mznc
   QAyYF+Vl0PTF5SSXpNoM78PND9gvu7IBmX9lrZMtOf6ZCVBHgzruUhLh7
   w==;
X-CSE-ConnectionGUID: 5qpyjtYmRLyGMUAhhD/p6g==
X-CSE-MsgGUID: j63dNm18TPa/0AB7HlmKmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60227534"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="60227534"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 07:22:15 -0700
X-CSE-ConnectionGUID: kg+9jEsET4qmcKIT2g4KSw==
X-CSE-MsgGUID: i9M58SBmQcWLJi382p080A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="175480691"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2025 07:22:13 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzFWV-0003M7-1e;
	Thu, 18 Sep 2025 14:22:11 +0000
Date: Thu, 18 Sep 2025 22:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: renesas_wwdt: add driver
Message-ID: <202509182204.LwGhKzRi-lkp@intel.com>
References: <20250917185651.12428-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917185651.12428-3-wsa+renesas@sang-engineering.com>

Hi Wolfram,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on groeck-staging/hwmon-next linus/master v6.17-rc6 next-20250917]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/dt-bindings-watchdog-Add-Renesas-WWDT/20250918-070043
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250917185651.12428-3-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH 2/2] watchdog: renesas_wwdt: add driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250918/202509182204.LwGhKzRi-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509182204.LwGhKzRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509182204.LwGhKzRi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/renesas_wwdt.c: In function 'wwdt_probe':
>> drivers/watchdog/renesas_wwdt.c:20:25: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      20 | #define WDTA0OVF(x)     FIELD_GET(GENMASK(6, 4), x)
         |                         ^~~~~~~~~
   drivers/watchdog/renesas_wwdt.c:98:30: note: in expansion of macro 'WDTA0OVF'
      98 |         interval = 1 << (9 + WDTA0OVF(val));
         |                              ^~~~~~~~


vim +/FIELD_GET +20 drivers/watchdog/renesas_wwdt.c

    18	
    19	#define WDTA0MD		0x0c
  > 20	#define WDTA0OVF(x)	FIELD_GET(GENMASK(6, 4), x)
    21	#define WDTA0WIE	BIT(3)
    22	#define WDTA0ERM	BIT(2)
    23	#define WDTA0WS(x)	FIELD_GET(GENMASK(1, 0), x)
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


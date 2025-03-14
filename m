Return-Path: <linux-watchdog+bounces-3104-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0788A60A14
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 08:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30FBA3AFF44
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Mar 2025 07:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3C5170A2C;
	Fri, 14 Mar 2025 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHGmDiMi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1C1547FE;
	Fri, 14 Mar 2025 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741937578; cv=none; b=tkFcYTGYABO5ZvVOGsmcP85YJ8g57f+GRbwwc7yb2Y6Lhj6sfZUe60UbQ9AGzmLJHXQ/2+p+b1PTys8T8OMDJrpUzoun8VvN3CB8BnV9VetNZitjDcLWNDUbTB210Jr/WfNPBfscoNeBmkmlc0WaDA7ULGTbHwkFA7S2qQiFPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741937578; c=relaxed/simple;
	bh=p0W+aqpnbYoRkToo30fmXao0FrukZ2uA7bJv4ogZQjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQhHx/DUzl6x3EfM5qcu28ZGeVIk7Un4TcR8e1CgVLMx1K2sSmg9VsPYL6CmtliD3xEKNoFkt93WMxvpuI8NstF07fAE9RgZVXh7S28cEiefAUuKqRDnTMYhqtgvMuGdqxU54MS8gnWNIm4mPoFXaXrzj5Eq01U/GBxwJdmqm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHGmDiMi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741937577; x=1773473577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p0W+aqpnbYoRkToo30fmXao0FrukZ2uA7bJv4ogZQjk=;
  b=oHGmDiMi0uKSdRtftFvrSbkF67dIocOeix8W0dBKPjwluExf9GYTzPrl
   xwuZMZUtKYOFknEwBL9E6WPUDgHy2VRn6oHUbmiqHPfHYz13DZ/LyFEi6
   /XojwWtcZlWB0gTNNQWINFaW9UKVUiQT/Cbi8FqP9rnrXTdjmY9+xYhOe
   NK6N9IpwW9C70ilaBK0pFnIsqJXUQ+SG1ZoSZTdWDahFXUOzVA/fW7guP
   +BDnrS7IZF6yZvWim4cJ9ZvKK0bnAW4E2BmDuMoLWMqltXlwpuSBNn4RQ
   sGb90oyAeudk71XGnx0ucQsApnt5Yd0ylCcCUnlZ0N4e2nDuWPKe+9MY2
   Q==;
X-CSE-ConnectionGUID: qUJNufE8RH6tJvheF+vd6A==
X-CSE-MsgGUID: +b6n1q2NRP6XrhhUMOtPsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54077741"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54077741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 00:32:56 -0700
X-CSE-ConnectionGUID: Y4dtWpJeSyaxahfLqbdZLQ==
X-CSE-MsgGUID: s4I3alGBTHOobUs/wpfwHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="120911440"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Mar 2025 00:32:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tszXH-000ACO-2q;
	Fri, 14 Mar 2025 07:32:51 +0000
Date: Fri, 14 Mar 2025 15:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 3/4] watchdog: da9052_wdt: do not disable wdt during probe
Message-ID: <202503141558.tHcAG0Q5-lkp@intel.com>
References: <20250313-da9052-fixes-v1-3-379dc87af953@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-da9052-fixes-v1-3-379dc87af953@gmail.com>

Hi Marcus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0fed89a961ea851945d23cc35beb59d6e56c0964]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/watchdog-da9052_wdt-add-support-for-nowayout/20250313-202430
base:   0fed89a961ea851945d23cc35beb59d6e56c0964
patch link:    https://lore.kernel.org/r/20250313-da9052-fixes-v1-3-379dc87af953%40gmail.com
patch subject: [PATCH 3/4] watchdog: da9052_wdt: do not disable wdt during probe
config: riscv-randconfig-001-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141558.tHcAG0Q5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141558.tHcAG0Q5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141558.tHcAG0Q5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/da9052_wdt.c:173:6: warning: unused variable 'ret' [-Wunused-variable]
     173 |         int ret;
         |             ^~~
   1 warning generated.


vim +/ret +173 drivers/watchdog/da9052_wdt.c

664a0d7862a6b10 Ashish Jangam    2012-05-24  165  
664a0d7862a6b10 Ashish Jangam    2012-05-24  166  
2d991a164a61858 Bill Pemberton   2012-11-19  167  static int da9052_wdt_probe(struct platform_device *pdev)
664a0d7862a6b10 Ashish Jangam    2012-05-24  168  {
f7e29623e2678c5 Guenter Roeck    2019-04-08  169  	struct device *dev = &pdev->dev;
f7e29623e2678c5 Guenter Roeck    2019-04-08  170  	struct da9052 *da9052 = dev_get_drvdata(dev->parent);
664a0d7862a6b10 Ashish Jangam    2012-05-24  171  	struct da9052_wdt_data *driver_data;
664a0d7862a6b10 Ashish Jangam    2012-05-24  172  	struct watchdog_device *da9052_wdt;
664a0d7862a6b10 Ashish Jangam    2012-05-24 @173  	int ret;
664a0d7862a6b10 Ashish Jangam    2012-05-24  174  
f7e29623e2678c5 Guenter Roeck    2019-04-08  175  	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
189c049a01c2de6 Guenter Roeck    2017-01-10  176  	if (!driver_data)
189c049a01c2de6 Guenter Roeck    2017-01-10  177  		return -ENOMEM;
664a0d7862a6b10 Ashish Jangam    2012-05-24  178  	driver_data->da9052 = da9052;
664a0d7862a6b10 Ashish Jangam    2012-05-24  179  
664a0d7862a6b10 Ashish Jangam    2012-05-24  180  	da9052_wdt = &driver_data->wdt;
664a0d7862a6b10 Ashish Jangam    2012-05-24  181  
664a0d7862a6b10 Ashish Jangam    2012-05-24  182  	da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
664a0d7862a6b10 Ashish Jangam    2012-05-24  183  	da9052_wdt->info = &da9052_wdt_info;
664a0d7862a6b10 Ashish Jangam    2012-05-24  184  	da9052_wdt->ops = &da9052_wdt_ops;
f7e29623e2678c5 Guenter Roeck    2019-04-08  185  	da9052_wdt->parent = dev;
664a0d7862a6b10 Ashish Jangam    2012-05-24  186  	watchdog_set_drvdata(da9052_wdt, driver_data);
ebed370e19c893f Marcus Folkesson 2025-03-13  187  	watchdog_init_timeout(da9052_wdt, timeout, dev);
950a7a3375b3d8e Marcus Folkesson 2025-03-13  188  	watchdog_set_nowayout(da9052_wdt, nowayout);
664a0d7862a6b10 Ashish Jangam    2012-05-24  189  
651b5fde35d67a2 Marcus Folkesson 2024-12-10  190  	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
651b5fde35d67a2 Marcus Folkesson 2024-12-10  191  		da9052_wdt->bootstatus |= WDIOF_CARDRESET;
651b5fde35d67a2 Marcus Folkesson 2024-12-10  192  	if (da9052->fault_log & DA9052_FAULTLOG_TEMPOVER)
651b5fde35d67a2 Marcus Folkesson 2024-12-10  193  		da9052_wdt->bootstatus |= WDIOF_OVERHEAT;
651b5fde35d67a2 Marcus Folkesson 2024-12-10  194  	if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
651b5fde35d67a2 Marcus Folkesson 2024-12-10  195  		da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
651b5fde35d67a2 Marcus Folkesson 2024-12-10  196  
60415f701fce001 Wolfram Sang     2019-05-18  197  	return devm_watchdog_register_device(dev, &driver_data->wdt);
664a0d7862a6b10 Ashish Jangam    2012-05-24  198  }
664a0d7862a6b10 Ashish Jangam    2012-05-24  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


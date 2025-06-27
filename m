Return-Path: <linux-watchdog+bounces-3741-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA96AEABA0
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 02:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C35E3AA9F8
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 00:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3327EC2FB;
	Fri, 27 Jun 2025 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0qpAtRg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8DB881E;
	Fri, 27 Jun 2025 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750983317; cv=none; b=OpISUui+mF1vfYg/5jLTwQBkXGnjBeIwn1+Gsd/I3nt0vmDDAW+Z7hJpF73Zhm7vspENnR8KkcFVYAirvzNQ47zLwsMnT9xQJcHjEl102zDp7/WaqUG9vh/0wHxdfZC64kFHQT+vXPPlykT4JhmGmqKi85cXmqen1loD6CKMJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750983317; c=relaxed/simple;
	bh=gCyXOke57+BxAShs118VGPgYYRq7KdvEvh5GWrAhI/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJNI/qiItjicBS1i3pGupmK3Sc9xdd483Cg9+vozLwC569MQ9tRNZX191OK0fCHx66PBYsMegmHQZ3mkqF/IVhmsiugfeQc/2QTQcGlz5DRc0V9xjt1u20hhIexGye2uu5IwbEhjDKoZ+8xRo7cM970H3ERDrN0ipV2lXMLO5aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0qpAtRg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750983315; x=1782519315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gCyXOke57+BxAShs118VGPgYYRq7KdvEvh5GWrAhI/M=;
  b=E0qpAtRgQYrTT+AS7iRokLLILWJgfyd24YSb+mVFovfbNAb0seDw/quP
   NdQOFbsO7xV5rzFg9+qvpHtfSgzWV1bbC22MyB/EZDkB8k9kyKZUpCcSU
   50bdAyK4Cde6sDgTk8Tq5TakYWnWEqdr3jq2Up0utPYKjxinvOe+IM2dZ
   jJXAx0dtQbwRl3XqhJgVs5OzwA9Spxl9e+1ZQiXuGiAcoUca403biGYrf
   JexkD0AV6feavGtWD/CBR8oCSCIZMr+vBCh2I4prQ6z2ASRpo0i6ReG6W
   qcLE1iZTV4OHuIpt9MvIYQBePG0GJP5ipBPH+p976mIEieVNyUKavDHNa
   Q==;
X-CSE-ConnectionGUID: c1RelHlgQGGjRGtMPbPpiQ==
X-CSE-MsgGUID: WeMpluWJRUqpGUOLbil0GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63893994"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="63893994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 17:15:14 -0700
X-CSE-ConnectionGUID: soCn9GgnQ1uou8sDA9yEUQ==
X-CSE-MsgGUID: W+VubARHSsulYQMEq7olvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156695906"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2025 17:15:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUwkJ-000Vem-0J;
	Fri, 27 Jun 2025 00:15:11 +0000
Date: Fri, 27 Jun 2025 08:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 1/1] watchdog: Don't use "proxy" headers
Message-ID: <202506270716.ol1Llg7E-lkp@intel.com>
References: <20250626165145.327685-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626165145.327685-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/watchdog-Don-t-use-proxy-headers/20250627-005755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250626165145.327685-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] watchdog: Don't use "proxy" headers
config: arc-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506270716.ol1Llg7E-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270716.ol1Llg7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270716.ol1Llg7E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/watchdog/watchdog_pretimeout.c:12:
>> drivers/watchdog/watchdog_core.h:41:16: error: field 'dev' has incomplete type
     struct device dev;
                   ^~~
   drivers/watchdog/watchdog_core.h:42:14: error: field 'cdev' has incomplete type
     struct cdev cdev;
                 ^~~~
   drivers/watchdog/watchdog_pretimeout.c: In function 'watchdog_pretimeout_available_governors_get':
>> drivers/watchdog/watchdog_pretimeout.c:59:12: error: implicit declaration of function 'sysfs_emit_at'; did you mean 'sysfs_streq'? [-Werror=implicit-function-declaration]
      count += sysfs_emit_at(buf, count, "%s\n", priv->gov->name);
               ^~~~~~~~~~~~~
               sysfs_streq
   drivers/watchdog/watchdog_pretimeout.c: In function 'watchdog_pretimeout_governor_get':
>> drivers/watchdog/watchdog_pretimeout.c:72:11: error: implicit declaration of function 'sysfs_emit'; did you mean 'sysfs_streq'? [-Werror=implicit-function-declaration]
      count = sysfs_emit(buf, "%s\n", wdd->gov->name);
              ^~~~~~~~~~
              sysfs_streq
   cc1: some warnings being treated as errors


vim +/dev +41 drivers/watchdog/watchdog_core.h

45f5fed30a6460e Alan Cox     2012-05-10  31  
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  32  /*
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  33   * struct watchdog_core_data - watchdog core internal data
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  34   * @dev:	The watchdog's internal device
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  35   * @cdev:	The watchdog's Character device.
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  36   * @wdd:	Pointer to watchdog device.
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  37   * @lock:	Lock for watchdog core.
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  38   * @status:	Watchdog core internal status bits.
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  39   */
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  40  struct watchdog_core_data {
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03 @41  	struct device dev;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  42  	struct cdev cdev;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  43  	struct watchdog_device *wdd;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  44  	struct mutex lock;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  45  	ktime_t last_keepalive;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  46  	ktime_t last_hw_keepalive;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  47  	ktime_t open_deadline;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  48  	struct hrtimer timer;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  49  	struct kthread_work work;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  50  #if IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  51  	struct hrtimer pretimeout_timer;
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  52  #endif
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  53  	unsigned long status;		/* Internal status bits */
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  54  #define _WDOG_DEV_OPEN		0	/* Opened ? */
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  55  #define _WDOG_ALLOW_RELEASE	1	/* Did we receive the magic char ? */
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  56  #define _WDOG_KEEPALIVE		2	/* Did we receive a keepalive ? */
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  57  };
7b7d2fdc8c3e3f9 Curtis Klein 2021-02-03  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


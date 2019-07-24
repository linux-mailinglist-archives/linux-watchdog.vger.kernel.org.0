Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5527334E
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2019 18:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfGXQGF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jul 2019 12:06:05 -0400
Received: from mga07.intel.com ([134.134.136.100]:32218 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbfGXQGF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jul 2019 12:06:05 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jul 2019 09:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,303,1559545200"; 
   d="scan'208";a="181148522"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga002.jf.intel.com with ESMTP; 24 Jul 2019 09:06:02 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hqJmD-0001x6-M8; Wed, 24 Jul 2019 19:06:01 +0300
Date:   Wed, 24 Jul 2019 19:06:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Vignesh Raman <vignesh.raman.in@gmail.com>,
        mika.westerberg@linux.intel.com
Cc:     linux-watchdog@vger.kernel.org, rajneesh.bhardwaj@linux.intel.com
Subject: Re: watchdog: iTCO_wdt: failed to load
Message-ID: <20190724160601.GA9224@smile.fi.intel.com>
References: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

+Cc: Mika, who is supporting watchdog driver(s).

On Wed, Jul 24, 2019 at 01:04:45PM +0530, Vignesh Raman wrote:
> Hi,
> 
> I'm seeing an issue where the iTCO_wdt module doesn't load with the below error,
> 
> [    3.827599] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    3.828440] iTCO_wdt iTCO_wdt: can't request region for resource
> [mem 0x00c5fffc-0x00c5ffff]
> [    3.828803] iTCO_wdt: probe of iTCO_wdt failed with error -16
> 
> CPU and logs:
> cpu: Intel(R) Core(TM) i3-8100 CPU @ 3.60GHz
> dmesg logs: http://paste.debian.net/1092702/
> lsmod output: https://paste.debian.net/1092703/
> root@localhost:~# uname -a
> Linux localhost.localdomain 4.14.103-rt55 #1 SMP PREEMPT RT Tue Jul 23
> 03:53:28 UTC 2019 x86_64 GNU/Linux
> 
> Please let me know if the error (can't request region for resource) is
> related to the patches below,
> https://patchwork.kernel.org/patch/9627085/
> https://lore.kernel.org/patchwork/patch/770990/
> 
> I tested with the patch
> https://lore.kernel.org/patchwork/patch/770990/ and it fixes the
> issue.
> root@localhost:/home/vignesh# dmesg | grep wdt
> [    5.766470] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    5.767104] iTCO_wdt: Found a Intel PCH TCO device (Version=4,
> TCOBASE=0x0400)
> [    5.767865] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
> 
> But the patch was not merged upstream.
> 
> When testing the hardware watchdog, it doesn't trigger a reset even
> after triggering a sysrq crash.
> The system freezes and there is no reboot.
> 
> I noticed the timeleft value is not getting updated.
> root@localhost:~# cat /sys/class/watchdog/watchdog0/timeleft
> 15
> root@localhost:~# cat /sys/class/watchdog/watchdog0/timeleft
> 15
> root@localhost:~# cat /sys/class/watchdog/watchdog0/timeleft
> 15
> 
> This issue has been discussed in below email thread,
> http://lkml.iu.edu/hypermail/linux/kernel/1609.1/01979.html
> https://lkml.org/lkml/2016/9/8/641
> 
> In another platform the hardware watchdog works.
> root@debian:~# dmesg | grep wdt
> [    3.901842] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    3.903415] iTCO_wdt: Found a Intel PCH TCO device (Version=4,
> TCOBASE=0x0400)
> [    3.937816] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
> 
> CPU and logs
> cpu: Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
> dmesg logs: http://paste.debian.net/1092845/
> lsmod output: http://paste.debian.net/1092846/
> root@debian:~# uname -a
> Linux debian 4.14.103-rt55 #1 SMP PREEMPT RT Tue Jul 23 03:53:28 UTC
> 2019 x86_64 GNU/Linux
> 
> Hardware watchdog triggers a reset and the watchdog timer counter is
> started and the value gets updated.
> root@debian:~# cat /sys/class/watchdog/watchdog0/timeleft
> 13
> root@debian:~# cat /sys/class/watchdog/watchdog0/timeleft
> 12
> root@debian:~# cat /sys/class/watchdog/watchdog0/timeleft
> 11
> root@debian:~#
> 
> My questions:
> 1. Please let me know if it is okay to take
> https://lore.kernel.org/patchwork/patch/770990/ patch or will there be
> an update to the original patch?
> 2. Could the hardware watchdog not triggering a reset (timeleft value
> not getting updated) could be a hardware problem?
> 
> Thanks.
> 
> Regards,
> Vignesh

-- 
With Best Regards,
Andy Shevchenko



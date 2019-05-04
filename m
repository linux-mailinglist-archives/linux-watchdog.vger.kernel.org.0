Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF2D13A9C
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 May 2019 16:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfEDOg2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 May 2019 10:36:28 -0400
Received: from icp-osb-irony-out7.external.iinet.net.au ([203.59.1.107]:44739
        "EHLO icp-osb-irony-out7.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726070AbfEDOg2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 May 2019 10:36:28 -0400
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 May 2019 10:36:26 EDT
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AJAACjoM1c/7akqnwNWBkBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEHAQEBAQEBgVQBAQEBAQELAYQlhBCTYAEBAQEBAQaBCC2DXoVukQG?=
 =?us-ascii?q?EfQKCKTcGDgEDAQEBBAEBAQEChl8BAQEBAgEjFUEQCw4KAgImAgJXBgEMBgI?=
 =?us-ascii?q?BAYMegXcFqjtxgS+FR4MegUWBCycBi2R4gQeBOIJrPodOglgEizeBboVolCU?=
 =?us-ascii?q?JgguSPwYblUiMG5Z2gXgzGggoCIMnkGNgkT8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2AJAACjoM1c/7akqnwNWBkBAQEBAQEBAQEBAQEHAQEBA?=
 =?us-ascii?q?QEBgVQBAQEBAQELAYQlhBCTYAEBAQEBAQaBCC2DXoVukQGEfQKCKTcGDgEDA?=
 =?us-ascii?q?QEBBAEBAQEChl8BAQEBAgEjFUEQCw4KAgImAgJXBgEMBgIBAYMegXcFqjtxg?=
 =?us-ascii?q?S+FR4MegUWBCycBi2R4gQeBOIJrPodOglgEizeBboVolCUJgguSPwYblUiMG?=
 =?us-ascii?q?5Z2gXgzGggoCIMnkGNgkT8BAQ?=
X-IronPort-AV: E=Sophos;i="5.60,430,1549900800"; 
   d="scan'208";a="173381743"
Received: from 124-170-164-182.dyn.iinet.net.au (HELO [192.168.0.106]) ([124.170.164.182])
  by icp-osb-irony-out7.iinet.net.au with ESMTP; 04 May 2019 22:27:06 +0800
Subject: Re: [PATCH 1/6] ARM: ks8695: watchdog: stop using mach/*.h
To:     Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
References: <20190415202501.941196-1-arnd@arndb.de>
 <2424c672-e3fb-4c32-4c24-fafc59d03a96@uclinux.org>
 <CACRpkdaJ+2bub_nDp9=5b4kyKjWDnOGKscWg3KsEVixDpk8rzA@mail.gmail.com>
 <20190503170613.GA1783@roeck-us.net>
From:   Greg Ungerer <gerg@kernel.org>
Message-ID: <d8d81aca-722d-8b5f-cd5f-30cc3e4e407b@kernel.org>
Date:   Sun, 5 May 2019 00:26:53 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503170613.GA1783@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 4/5/19 3:06 am, Guenter Roeck wrote:
> On Fri, May 03, 2019 at 08:16:05AM +0100, Linus Walleij wrote:
>> On Fri, May 3, 2019 at 8:02 AM Greg Ungerer <gerg@uclinux.org> wrote:
>>
>>> I dug out some old ks8695 based hardware to try this out.
>>> I had a lot of trouble getting anything modern working on it.
>>> In the end I still don't have a reliable test bed to test this properly.
>>
>> What is usually used by old ARMv4 systems is OpenWrt or
>> OpenEmbedded. Those is the only build systems that reliably
>> produce a userspace for these things now, and it is also the
>> appropriate size for this kind of systems.

No, I can produce a user space environment for the KS8695 as well
using the uClinux-dist build system. But that worked even less well
than the old root filesystem that I had (which was also built with
an older version of that build system).

But there is no reason that old root filesystem should not work.
And that is the thing that concerns me a bit here. I could mount
it ok (it was a CRAMFS), it would run up the shell to a shell prompt,
but when I try to run any commands from there they would oops.
I didn't debug any further than that.


>>> Ultimately though I am left wondering if the ks8695 support in the
>>> kernel is useful to anyone the way it is at the moment. With a minimal
>>> kernel configuration I can boot up to a shell - but the system is
>>> really unreliable if you try to interactively use it. I don't think
>>> it is the hardware - it seems to run reliably with the old code
>>> it has running from flash on it. I am only testing the new kernel,
>>> running with the existing user space root filesystem on it (which
>>> dates from 2004 :-)
>>
>> Personally I think it is a bad sign that this subarch and boards do
>> not have active OpenWrt support, they are routers after all (right?)
>> and any active use of networking equipment should use a recent
>> userspace as well, given all the security bugs that popped up over
>> the years.
>>
>> With IXP4xx, Gemini and EP93xx we have found active users and
>> companies selling the chips and reference designs and even
>> recommending it for new products (!) at times.  If this is not the
>> case with KS8695 and no hobbyists are willing to submit it
>> to OpenWrt and modernize it to use device tree I think it should be
>> deleted from the kernel.
>>
> 
> That may be the best approach if indeed no one is using it,
> much less maintaining it.

Well, I for one don't really use it any more. So I don't have a lot
of motivation to maintain it any longer.

Regards
Greg


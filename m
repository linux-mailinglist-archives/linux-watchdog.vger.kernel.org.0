Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED3A36A526
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Apr 2021 08:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhDYGmu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Apr 2021 02:42:50 -0400
Received: from jptosegrel01.sonyericsson.com ([124.215.201.71]:13464 "EHLO
        JPTOSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229480AbhDYGmt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Apr 2021 02:42:49 -0400
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, Shakeel Butt <shakeelb@google.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
 <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
 <844e3ecb-62c3-856a-7273-e22eee35e80f@i-love.sakura.ne.jp>
 <d2be282c-f39a-dc85-817b-94a40efeb232@sony.com>
 <d76447a5-4580-eb4e-e6d9-d675ca016462@i-love.sakura.ne.jp>
From:   peter enderborg <peter.enderborg@sony.com>
Message-ID: <1d4ef30a-69c5-c4dc-c3bd-8d7c0c99b3f3@sony.com>
Date:   Sun, 25 Apr 2021 08:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d76447a5-4580-eb4e-e6d9-d675ca016462@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Language: en-GB
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DLnxHBFb c=1 sm=1 tr=0 a=fZcToFWbXLKijqHhjJ02CA==:117 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=uherdBYGAAAA:8 a=VwQbUJbxAAAA:8 a=bVD-iCYiVT72kJ5F44QA:9 a=QEXdDO2ut3YA:10 a=Ef4yma5cpRUEJWN9UqBm:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/25/21 3:08 AM, Tetsuo Handa wrote:
> On 2021/04/25 1:19, peter enderborg wrote:
>>> I don't think this proposal is a watchdog. I think this proposal is
>>> a timer based process killer, based on an assumption that any slowdown
>>> which prevents the monitor process from pinging for more than 0.5 seconds
>>> (if HZ == 1000) is caused by memory pressure.
>> You missing the point. The oom killer is a example of a work that it can do.
>> it is one policy. The idea is that you should have a policy that fits your needs.
> Implementing policy which can run in kernel from timer interrupt context is
> quite limited, for it is not allowed to perform operations that might sleep. See
>
>   [RFC] memory reserve for userspace oom-killer
>   https://urldefense.com/v3/__https://lkml.kernel.org/r/CALvZod7vtDxJZtNhn81V=oE-EPOf=4KZB2Bv6Giz*u3bFFyOLg@mail.gmail.com__;Kw!!JmoZiZGBv3RvKRSx!tqBFKAdfydRJ5M0oP4xCRvSscrBwChj5MWuj1YUNAk05uORWkbcz-iodFCHYjKdOytmHoO4$ 
>
> for implementing possibly useful policy.

I you need to do a more complex approach you might need to
have a work queue.  For example a SIGTERM solution might
be like that. You send sigterm wait some time and then send a sigkill.


>> oom_score_adj is suitable for a android world. But it might be based on
>> uid's if your priority is some users over other.  Or a memcg. Or as
>> Christophe Leroy want the current. The policy is only a example that
>> fits a one area.
> Horrible idea. Imagine a kernel module that randomly sends SIGTERM/SIGKILL
> to "current" thread. How normal systems can survive? A normal system is not
> designed to survive random signals.

I think you need to see it in the context of a watchdog. It might be
problematic, but it has a good statistical change to hit a cpu hogger. 

And seeing as watchdog, the alternative is a system reset. You
take a chance.  Reboot should be the last resort.

I can imagine a kernel module that  randomly sends SIGTERM/SIGKILL,
we already have that. It is called oom-kill. This is *exactly* the problem.

>
>>                  You need to describe your prioritization, in android it is
>> oom_score_adj. For example I would very much have a policy that sends
>> sigterm instead of sigkill.
> That's because Android framework is designed to survive random signals
> (in order to survive memory pressure situation).
It using a lot to control the system. It use it differently than you would
with a shell or window-manager.
>
>>                             But the integration with oom is there because
>> it is needed. Maybe a bad choice for political reasons but I don't it a
>> good idea to hide the intention. Please don't focus on the oom part.
> I wonder what system other than Android framework can utilize this module.
I think it will be useful for embedded systems as well.
> By the way, there already is "Software Watchdog" ( drivers/watchdog/softdog.c )
> which some people might call it "soft watchdog". It is very confusing to name
> your module as "softwatchdog". Please find a different name.
>
It is mention in the patch-set. I had as an idea to add this function to that one,
but I decided that it was better to separate so point out the feature  that is to
be "Soft" rather than so hard.


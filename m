Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E86236A3D8
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Apr 2021 03:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhDYBJn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 21:09:43 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:59984 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhDYBJm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 21:09:42 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 13P18UUN019191;
        Sun, 25 Apr 2021 10:08:30 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Sun, 25 Apr 2021 10:08:30 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 13P18TZk019178
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 25 Apr 2021 10:08:30 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
To:     peter enderborg <peter.enderborg@sony.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
 <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
 <844e3ecb-62c3-856a-7273-e22eee35e80f@i-love.sakura.ne.jp>
 <d2be282c-f39a-dc85-817b-94a40efeb232@sony.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <d76447a5-4580-eb4e-e6d9-d675ca016462@i-love.sakura.ne.jp>
Date:   Sun, 25 Apr 2021 10:08:25 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d2be282c-f39a-dc85-817b-94a40efeb232@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2021/04/25 1:19, peter enderborg wrote:
>> I don't think this proposal is a watchdog. I think this proposal is
>> a timer based process killer, based on an assumption that any slowdown
>> which prevents the monitor process from pinging for more than 0.5 seconds
>> (if HZ == 1000) is caused by memory pressure.
> 
> You missing the point. The oom killer is a example of a work that it can do.
> it is one policy. The idea is that you should have a policy that fits your needs.

Implementing policy which can run in kernel from timer interrupt context is
quite limited, for it is not allowed to perform operations that might sleep. See

  [RFC] memory reserve for userspace oom-killer
  https://lkml.kernel.org/r/CALvZod7vtDxJZtNhn81V=oE-EPOf=4KZB2Bv6Giz+u3bFFyOLg@mail.gmail.com

for implementing possibly useful policy.

> 
> oom_score_adj is suitable for a android world. But it might be based on
> uid's if your priority is some users over other.  Or a memcg. Or as
> Christophe Leroy want the current. The policy is only a example that
> fits a one area.

Horrible idea. Imagine a kernel module that randomly sends SIGTERM/SIGKILL
to "current" thread. How normal systems can survive? A normal system is not
designed to survive random signals.

>                  You need to describe your prioritization, in android it is
> oom_score_adj. For example I would very much have a policy that sends
> sigterm instead of sigkill.

That's because Android framework is designed to survive random signals
(in order to survive memory pressure situation).

>                             But the integration with oom is there because
> it is needed. Maybe a bad choice for political reasons but I don't it a
> good idea to hide the intention. Please don't focus on the oom part.

I wonder what system other than Android framework can utilize this module.

By the way, there already is "Software Watchdog" ( drivers/watchdog/softdog.c )
which some people might call it "soft watchdog". It is very confusing to name
your module as "softwatchdog". Please find a different name.


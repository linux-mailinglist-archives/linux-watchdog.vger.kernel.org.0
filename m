Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88E036A209
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 18:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbhDXQUg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 12:20:36 -0400
Received: from jptosegrel01.sonyericsson.com ([124.215.201.71]:13009 "EHLO
        JPTOSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230010AbhDXQUf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 12:20:35 -0400
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
From:   peter enderborg <peter.enderborg@sony.com>
Message-ID: <d2be282c-f39a-dc85-817b-94a40efeb232@sony.com>
Date:   Sat, 24 Apr 2021 18:19:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <844e3ecb-62c3-856a-7273-e22eee35e80f@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Language: en-GB
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DLnxHBFb c=1 sm=1 tr=0 a=fZcToFWbXLKijqHhjJ02CA==:117 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=ZvUQ5lN1LNaykfZji70A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/24/21 5:23 PM, Tetsuo Handa wrote:
> On 2021/04/24 23:41, Guenter Roeck wrote:
>> On 4/24/21 3:25 AM, Peter Enderborg wrote:
>>> This is not a rebooting watchdog. It's function is to take other
>>> actions than a hard reboot. On many complex system there is some
>>> kind of manager that monitor and take action on slow systems.
>>> Android has it's lowmemorykiller (lmkd), desktops has earlyoom.
>>> This watchdog can be used to help monitor to preform some basic
>>> action to keep the monitor running.
>>>
>>> It can also be used standalone. This add a policy that is
>>> killing the process with highest oom_score_adj and using
>>> oom functions to it quickly. I think it is a good usecase
>>> for the patch. Memory siuations can be problematic for
>>> software that monitor system, but other prolicys can
>>> should also be possible. Like picking tasks from a memcg, or
>>> specific UID's or what ever is low priority.
>>> ---
>> NACK. Besides this not following the new watchdog API, the task
>> of a watchdog is to reset the system on failure. Its task is most
>> definitely not to re-implement the oom killer in any way, shape,
>> or form.
>>
> I don't think this proposal is a watchdog. I think this proposal is
> a timer based process killer, based on an assumption that any slowdown
> which prevents the monitor process from pinging for more than 0.5 seconds
> (if HZ == 1000) is caused by memory pressure.

You missing the point. The oom killer is a example of a work that it can do.
it is one policy. The idea is that you should have a policy that fits your needs.

oom_score_adj is suitable for a android world. But it might be based on
uid's if your priority is some users over other.  Or a memcg. Or as
Christophe Leroy want the current. The policy is only a example that
fits a one area. You need to describe your prioritization, in android it is
oom_score_adj. For example I would very much have a policy that sends
sigterm instead of sigkill. But the integration with oom is there because
it is needed. Maybe a bad choice for political reasons but I don't it a
good idea to hide the intention. Please don't focus on the oom part.


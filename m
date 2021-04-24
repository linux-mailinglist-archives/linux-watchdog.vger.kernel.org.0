Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEB336A1C3
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 17:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbhDXPYw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 11:24:52 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:52397 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbhDXPYv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 11:24:51 -0400
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 13OFNbNP083442;
        Sun, 25 Apr 2021 00:23:37 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Sun, 25 Apr 2021 00:23:37 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 13OFNbuq083438
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 25 Apr 2021 00:23:37 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
To:     Guenter Roeck <linux@roeck-us.net>,
        Peter Enderborg <peter.enderborg@sony.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
 <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <844e3ecb-62c3-856a-7273-e22eee35e80f@i-love.sakura.ne.jp>
Date:   Sun, 25 Apr 2021 00:23:32 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2021/04/24 23:41, Guenter Roeck wrote:
> On 4/24/21 3:25 AM, Peter Enderborg wrote:
>> This is not a rebooting watchdog. It's function is to take other
>> actions than a hard reboot. On many complex system there is some
>> kind of manager that monitor and take action on slow systems.
>> Android has it's lowmemorykiller (lmkd), desktops has earlyoom.
>> This watchdog can be used to help monitor to preform some basic
>> action to keep the monitor running.
>>
>> It can also be used standalone. This add a policy that is
>> killing the process with highest oom_score_adj and using
>> oom functions to it quickly. I think it is a good usecase
>> for the patch. Memory siuations can be problematic for
>> software that monitor system, but other prolicys can
>> should also be possible. Like picking tasks from a memcg, or
>> specific UID's or what ever is low priority.
>> ---
> 
> NACK. Besides this not following the new watchdog API, the task
> of a watchdog is to reset the system on failure. Its task is most
> definitely not to re-implement the oom killer in any way, shape,
> or form.
> 

I don't think this proposal is a watchdog. I think this proposal is
a timer based process killer, based on an assumption that any slowdown
which prevents the monitor process from pinging for more than 0.5 seconds
(if HZ == 1000) is caused by memory pressure.

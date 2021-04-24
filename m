Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C8936A11B
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 14:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhDXMV7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 08:21:59 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:47003 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231799AbhDXMV7 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 08:21:59 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FS9Hc68Zhz9tvrC;
        Sat, 24 Apr 2021 14:21:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id Ayt4oavMATdG; Sat, 24 Apr 2021 14:21:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FS9Hc4zLbz9tyxt;
        Sat, 24 Apr 2021 14:21:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 74E698B76E;
        Sat, 24 Apr 2021 14:21:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id el_4yr-dlpDL; Sat, 24 Apr 2021 14:21:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id E7CDE8B75F;
        Sat, 24 Apr 2021 14:21:17 +0200 (CEST)
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
To:     Peter Enderborg <peter.enderborg@sony.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Shakeel Butt <shakeelb@google.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ac949d08-72ff-edf6-6526-fdc9ad602631@csgroup.eu>
Date:   Sat, 24 Apr 2021 14:21:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210424102555.28203-2-peter.enderborg@sony.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



Le 24/04/2021 à 12:25, Peter Enderborg a écrit :
> This is not a rebooting watchdog. It's function is to take other
> actions than a hard reboot. On many complex system there is some
> kind of manager that monitor and take action on slow systems.
> Android has it's lowmemorykiller (lmkd), desktops has earlyoom.
> This watchdog can be used to help monitor to preform some basic
> action to keep the monitor running.
> 
> It can also be used standalone. This add a policy that is
> killing the process with highest oom_score_adj and using
> oom functions to it quickly. I think it is a good usecase
> for the patch. Memory siuations can be problematic for
> software that monitor system, but other prolicys can
> should also be possible. Like picking tasks from a memcg, or
> specific UID's or what ever is low priority.


I'm nore sure I understand the reasoning behind the choice of oom logic to decide which task to kill.

Usually a watchdog will detect if a task is using 100% of the CPU time. If such a task exists, it is 
the one running, not another one that has huge amount of memory allocated by spends like 1% of CPU time.

So if there is a task to kill by a watchdog, I would say it is the current task.


Another remark: you are using regular timers as far as I understand. I remember having problems with 
that in the past, it required the use of hrtimers. I can't remember the details exactly but you can 
look at commit https://github.com/linuxppc/linux/commit/1ff688209

Christophe

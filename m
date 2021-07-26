Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF423D56EF
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 11:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbhGZJSu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 05:18:50 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:46757 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232617AbhGZJSs (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 05:18:48 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 16Q9jWT3020987
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 11:45:32 +0200
Received: from [139.22.37.28] ([139.22.37.28])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16Q9jWec006797;
        Mon, 26 Jul 2021 11:45:32 +0200
Subject: Re: iTCO_wdt regression on Dell laptop
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
References: <CAPWNY8XhrutxYzRregOJYQYte87W-wbtf1OoPAfnMVRD1oKzNw@mail.gmail.com>
 <4f72e518-ef01-505d-2523-6d3b151e1719@siemens.com>
Message-ID: <1d07f96c-a8c9-06e5-69ec-2c099df7b1f3@siemens.com>
Date:   Mon, 26 Jul 2021 11:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4f72e518-ef01-505d-2523-6d3b151e1719@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26.07.21 11:40, Jan Kiszka wrote:
> On 26.07.21 11:19, Mantas Mikulėnas wrote:
>> Hello,
>>
>> I have a Dell Inspiron 15-5547 laptop, with systemd configured to set
>> the watchdog to a 2-minute expiry (due to reasons):
>>
>> # /etc/systemd/system.conf
>> [Manager]
>> RuntimeWatchdogSec=2min
>>
>> So far this setting has worked without problems (including kernels
>> 5.12.15 and 5.13.1); however, with kernel 5.13.4 the system inevitably
>> reboots after a few minutes of uptime.
>>
>> I have tracked the issue down to commit 5e65819a006e "watchdog:
>> iTCO_wdt: Account for rebooting on second timeout" in the 5.13.x
>> branch (commit cb011044e34c upstream). There are no unexpected reboots
>> when running 5.13.4 with this commit reverted.
>>
>> Indeed with the original 5.13.4 kernel, `wdctl` always reports
>> "Timeleft:" counting down from 60 seconds (sometimes very nearly
>> reaching 0), even though "Timeout" is still reported to be 120.
>>
>> (systemd pokes the watchdog as part of its main loop, trying to so
>> approximately "between 1/4 and 1/2" of the configured interval.
>> According to wdctl these pings usually happen every 35-50 seconds but
>> sometimes nearly at the 60-second mark, and thanks to the kernel now
>> also dividing the requested expiry by /2 which systemd is unaware of,
>> sometimes this ends up being a *very* close race to 0.)
>>
>> This is a Haswell-era machine (i7-4510U) and seems to have a "version
>> 0" watchdog:
>>
>> Jul 26 11:34:04 archlinux kernel: Linux version 5.13.4-arch2-1
>> (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1
>> SMP PREEMPT Thu, 22 Jul 2021 20:46:28 +0000
>> Jul 26 11:34:14 frost kernel: iTCO_vendor_support: vendor-support=0
>> Jul 26 11:34:14 frost kernel: iTCO_wdt iTCO_wdt.3.auto: Found a Lynx
>> Point_LP TCO device (Version=2, TCOBASE=0x1860)
>> Jul 26 11:34:14 frost systemd[1]: Using hardware watchdog 'iTCO_wdt',
>> version 0, device /dev/watchdog
>> Jul 26 11:34:14 frost systemd[1]: Set hardware watchdog to 2min.
>> Jul 26 11:34:14 frost kernel: iTCO_wdt iTCO_wdt.3.auto: initialized.
>> heartbeat=30 sec (nowayout=0)
>>
> 
> Could you printk SMI_EN(p) in iTCO_wdt_set_timeout()
> (drivers/watchdog/iTCO_wdt.c)? This is where we decide whether SMIs are
> working, thus the countdown will only run once. Apparently, something is
> wrong with the detection on this system.
> 

Wait, found it:

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index b3f604669e2c..643c6c2d0b72 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
 	 * Otherwise, the BIOS generally reboots when the SMI triggers.
 	 */
 	if (p->smi_res &&
-	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
+	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
 		tmrval /= 2;
 
 	/* from the specs: */

Hand me a brown paper bag...

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

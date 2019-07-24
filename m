Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3991C72FE9
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2019 15:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfGXN1H (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jul 2019 09:27:07 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43920 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGXN1G (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jul 2019 09:27:06 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so20966653pfg.10
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jul 2019 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YEQQZWioa33txIPdqClkWYdcnfq4wgpMLSf+4rJhcnE=;
        b=bGiSyfWofIWgY1CxliZvGsL20MT4ejEuNWUTJYth2Wxr4NW5cvcWoPIl+e6ZTjHKHg
         /Y/YueTKLEY7qvcOP7aSnGYQaX52IczEcpX0rvh7oTNihRDBq1ghvNUNwep2xM3F6fO3
         qiz07b6IpNtIGdG7GqxctY1veeylIgkh/sUk1jGDk0506P2jrL/1GZcES+FESc4vdkcR
         RQGsMurJWd+iFJtzaDECDfWnRCAHEoDYNuLiX2EuYOQZZ4kkGOCvI60/JXoN2MW+8YT0
         9O9L7+b7qLCkaaTR33NcY6PkTokxMp9DpKVDydu8Xa6iCG37SAf+qqBwFUJoqCdXh17j
         Regw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YEQQZWioa33txIPdqClkWYdcnfq4wgpMLSf+4rJhcnE=;
        b=pdjWukNdra7o/0LhVh7Kjzzb1HlWoufSsMPUQT5nop43ksQrw6uf6nTqBeJaZYu4sj
         APu8T5ZAs0npROmRp7bBvwvQWe8zluP3o6rHV2YSZDu49CPkt8+KWP6ag3CaslhCibDd
         H8zMPZvzB1HEt7cgeJPkukiFcIzbJeP6cwRnKRXMKOSJA3yFmBScIImf+PlvMxNpHkbG
         crfLuNlAaZShcRrHUItQCNBJh8lb1KEbCtvj8CGwDdt8oefp0MH/Fl5Pf8FPaZzRSAvH
         xNOJ0c64zCRqkBHPw34uV0cmVaNXqhsbdOz9G2acdrUc6lkS0q36gobDeydQ62lRG99O
         uZpQ==
X-Gm-Message-State: APjAAAVESGLW/bl8UizxISaXGPnde57Y8VJ5WesCTO6zMvLsgMrpo6NY
        YzMB0waoAooDivjhV5Kv6xU=
X-Google-Smtp-Source: APXvYqzW3LoFUBG/OZZZc0l5JIfFi58YkOwcHqkBqYeQDgOS/k/DBFTFp2nHdNBnFQNhWWOsp/2+pw==
X-Received: by 2002:a17:90a:7148:: with SMTP id g8mr20829907pjs.51.1563974826084;
        Wed, 24 Jul 2019 06:27:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 85sm47944322pfv.130.2019.07.24.06.27.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 06:27:04 -0700 (PDT)
Subject: Re: watchdog: iTCO_wdt: failed to load
To:     Vignesh Raman <vignesh.raman.in@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com,
        rajneesh.bhardwaj@linux.intel.com
References: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <97817286-92ae-cd13-4cc1-7a0355140414@roeck-us.net>
Date:   Wed, 24 Jul 2019 06:27:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/24/19 12:34 AM, Vignesh Raman wrote:
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

What is the output of /proc/iomem, what PCI devices does it have, and what are
the ACPI devices ? Reason for asking is that I don't immediately see the ACPI
or PCI devices associated with above patch in your dmesg. If not, the patch
might actually cause the watchdog in your system not to work.

Also, did this ever work in your system ? If it did work, did the failure
start after a kernel update or after a BIOS update ?

Thanks,
Guenter

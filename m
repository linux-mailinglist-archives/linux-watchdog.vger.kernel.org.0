Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21B8F72B7A
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2019 11:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfGXJeE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jul 2019 05:34:04 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44781 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfGXJeD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jul 2019 05:34:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so20630645pfe.11
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jul 2019 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yY/g4tA1POcCWeqgv9Y46/XZx6RQYBRVnHlCF8X37c8=;
        b=sepUPySUHUJVkMSCGGhnGh21N3XivRekn1e6RHeuJz3R1mD+vMXLX2kC2CHYs3nIQM
         9Yn8CAJQBk7w/QuAJcm33b3/mW9BvyBUtv3WXBk/JXJ6uBkpb4FnK7pL4fQTDjNP/AG8
         +Kedd4go34w9g1+KrKeAa2yVtMHwkbfBIPQkP6VNJE78VVhlyNd/Hkcf3n4TmBaJa2gE
         RXYQxicD9YouRXV2tvb9Vp+a3U/QP0iHusiBPpDYF88jPP0AelHnuccc0E3NqHr3dLEr
         p/F0OUTmRttysT2O6GV1j5vrSx/ncG3fVtlYy3I5icRCzLT3XSY7PfDNGsPRuWuS+j9i
         3tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yY/g4tA1POcCWeqgv9Y46/XZx6RQYBRVnHlCF8X37c8=;
        b=oyYxGQFvdIItkQ6Qx6WVbqoXEs/oKxKkkJVkCNoVVnKCksDzn4JQ4YxBurJR2zzYRd
         bZODHIdrkqEZNoQwhN5JUPZbD7H0hzR4AheikcoBisqaqYY1E9c5jDLM6aJFRP2xQaCG
         ucTDd54nsnzq1Hnk/I87dxKFHHwecXnjRBGezEy1KGIaeWR4mGix48q/W01DL7T26/FM
         WjkEa/hLVM3x6cGD4MYZeYPf70EInUDQAIZO9hB5R+7sgUb3FsiA7Nlayb1+EI2vgvx0
         jK/Hr+8AMTIHAnz+YEjLdWSI23lCbFi86kWneDXEt/k5IxS7GzL/sfxdEurGEoATfrMJ
         sQmg==
X-Gm-Message-State: APjAAAUjfwRa2TOUHv4aEw4mkf7rzp5Cr/1+C4iSACMDWc9k9J0Q8VMT
        N2j/KUH6dR585rJxoDdjHwK3liGv
X-Google-Smtp-Source: APXvYqwMs8X9D8B8+soMvh/6zmoriCGHD4HHBsYPNmL+12hbsSLVX4yUK4IaOTDkGJ0EYHLgnLc0Cw==
X-Received: by 2002:aa7:9f1c:: with SMTP id g28mr10249738pfr.81.1563960843243;
        Wed, 24 Jul 2019 02:34:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q8sm90012120pjq.20.2019.07.24.02.34.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 02:34:02 -0700 (PDT)
Subject: Re: watchdog: iTCO_wdt: failed to load
To:     Vignesh Raman <vignesh.raman.in@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com,
        rajneesh.bhardwaj@linux.intel.com
References: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <507d48b8-52a0-6189-bd14-33ddffa82e07@roeck-us.net>
Date:   Wed, 24 Jul 2019 02:34:01 -0700
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

Not into the upstream kernel. As outlined in the discussion, it would
cause failures on various platforms (if the driver is instantiated
from lpc_ipc.c).

> 2. Could the hardware watchdog not triggering a reset (timeleft value
> not getting updated) could be a hardware problem?
> 
Sounds more like the watchdog isn't running. I don't know about that system;
it may well be that the driver doesn't fully support that hardware.

Guenter

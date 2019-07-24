Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF8B72914
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2019 09:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfGXHe5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jul 2019 03:34:57 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46383 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfGXHe5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jul 2019 03:34:57 -0400
Received: by mail-oi1-f195.google.com with SMTP id 65so34306857oid.13
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jul 2019 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=kFzljJul/j5i5sMZxFGaTO06hfeJuBG0kgpTWhlelY8=;
        b=kRw4SOndhLFTRMUSPLjwmBFIPcOshFtLXD5wkxya4UFw0up/ciNh8cG5OCGRUO/jLE
         gVfgKYV6C6H2uY27Asn0cTNdktp5WRSVR/yQmAjsNc46GFhZQRaVhMk1332hb2nMUoiQ
         khCPGGVoWIM94GPX+9pSWuRjFaRBtk2M+Q6AL0tBXlFe2RVomSpeZp2vpQzl4tSsOYBp
         AesX0bVpSxrnRGpGwoIPoZuNbG4sw+ZLtQ6kzxzuqb4DBYdO7WQfZU3QlHqIDF4lakF7
         Wv/FjWeCcFY77Zxfxd/XQ+nQZA5qhWpZafYcyzHYDrgUciFLRt+xjtk12hVJz9JUeYd4
         rQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=kFzljJul/j5i5sMZxFGaTO06hfeJuBG0kgpTWhlelY8=;
        b=KvPpfuJ6tsTH+TZNdah54WbKcpC90j8Kz7u2wIVp9x+I+aS1oBElAImDFRO6T5EX8I
         6IxDleVodQUf7elNhdcwPAQEenz4zh6Tl5E4h7JSju+nJU1w/hV/hSWTdvzsrjT6Zite
         nWKRNWvRmDqxuqRnaIU+UprfYUev6auCamkaDZzghTQww1tnOTori7Ni/DESgyWGQv93
         NWUGbKAw0410dOOt+QJep6rvIBtP8wEsiJRHEfU6mdw78GB6UJLtnCqStfBXekcqbRhz
         5Fs4wA5IhJSzB5rkh/+0L7ZNk2PNBBGgK8mQ6bCMXpYtZSJR2Ci8MayibeLVj9b29JXR
         1pow==
X-Gm-Message-State: APjAAAVbrq23jGN6UaNbT5Um6rsH4RVMGW/8k3glfnvcll0CUEQpxrNF
        Fu0QTSgrA9aoLoQzbhCYReKBg8VvJW79CdiRLNCNaGET
X-Google-Smtp-Source: APXvYqyTPe9AA2odq3prgb1JkugoD4+Grn3hogcI/UlT7UNsQGR9OxFzad1VMmP2ixAXCw+4dr/VY2D65Q8UO7/FjEA=
X-Received: by 2002:aca:c715:: with SMTP id x21mr42481961oif.142.1563953696331;
 Wed, 24 Jul 2019 00:34:56 -0700 (PDT)
MIME-Version: 1.0
From:   Vignesh Raman <vignesh.raman.in@gmail.com>
Date:   Wed, 24 Jul 2019 13:04:45 +0530
Message-ID: <CAH3OF53GqY-h+9woZS_8Kx671PCiCFjVbaFQ_gs30ZXMWxUO8g@mail.gmail.com>
Subject: watchdog: iTCO_wdt: failed to load
To:     linux-watchdog@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com,
        rajneesh.bhardwaj@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

I'm seeing an issue where the iTCO_wdt module doesn't load with the below error,

[    3.827599] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    3.828440] iTCO_wdt iTCO_wdt: can't request region for resource
[mem 0x00c5fffc-0x00c5ffff]
[    3.828803] iTCO_wdt: probe of iTCO_wdt failed with error -16

CPU and logs:
cpu: Intel(R) Core(TM) i3-8100 CPU @ 3.60GHz
dmesg logs: http://paste.debian.net/1092702/
lsmod output: https://paste.debian.net/1092703/
root@localhost:~# uname -a
Linux localhost.localdomain 4.14.103-rt55 #1 SMP PREEMPT RT Tue Jul 23
03:53:28 UTC 2019 x86_64 GNU/Linux

Please let me know if the error (can't request region for resource) is
related to the patches below,
https://patchwork.kernel.org/patch/9627085/
https://lore.kernel.org/patchwork/patch/770990/

I tested with the patch
https://lore.kernel.org/patchwork/patch/770990/ and it fixes the
issue.
root@localhost:/home/vignesh# dmesg | grep wdt
[    5.766470] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    5.767104] iTCO_wdt: Found a Intel PCH TCO device (Version=4,
TCOBASE=0x0400)
[    5.767865] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)

But the patch was not merged upstream.

When testing the hardware watchdog, it doesn't trigger a reset even
after triggering a sysrq crash.
The system freezes and there is no reboot.

I noticed the timeleft value is not getting updated.
root@localhost:~# cat /sys/class/watchdog/watchdog0/timeleft
15
root@localhost:~# cat /sys/class/watchdog/watchdog0/timeleft
15
root@localhost:~# cat /sys/class/watchdog/watchdog0/timeleft
15

This issue has been discussed in below email thread,
http://lkml.iu.edu/hypermail/linux/kernel/1609.1/01979.html
https://lkml.org/lkml/2016/9/8/641

In another platform the hardware watchdog works.
root@debian:~# dmesg | grep wdt
[    3.901842] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    3.903415] iTCO_wdt: Found a Intel PCH TCO device (Version=4,
TCOBASE=0x0400)
[    3.937816] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)

CPU and logs
cpu: Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
dmesg logs: http://paste.debian.net/1092845/
lsmod output: http://paste.debian.net/1092846/
root@debian:~# uname -a
Linux debian 4.14.103-rt55 #1 SMP PREEMPT RT Tue Jul 23 03:53:28 UTC
2019 x86_64 GNU/Linux

Hardware watchdog triggers a reset and the watchdog timer counter is
started and the value gets updated.
root@debian:~# cat /sys/class/watchdog/watchdog0/timeleft
13
root@debian:~# cat /sys/class/watchdog/watchdog0/timeleft
12
root@debian:~# cat /sys/class/watchdog/watchdog0/timeleft
11
root@debian:~#

My questions:
1. Please let me know if it is okay to take
https://lore.kernel.org/patchwork/patch/770990/ patch or will there be
an update to the original patch?
2. Could the hardware watchdog not triggering a reset (timeleft value
not getting updated) could be a hardware problem?

Thanks.

Regards,
Vignesh

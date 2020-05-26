Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9041E20CB
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 May 2020 13:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388746AbgEZLVp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 May 2020 07:21:45 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:39201 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388728AbgEZLVp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 May 2020 07:21:45 -0400
Received: from [192.168.0.7] (ip5f5af73c.dynamic.kabel-deutschland.de [95.90.247.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id D4F82206442E6;
        Tue, 26 May 2020 13:21:42 +0200 (CEST)
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        it+linux-watchdog@molgen.mpg.de
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: watchdog: iTCO_wdt: cannot register miscdev on minor=130 (err=-16).
Message-ID: <a6e0f876-3a0f-49fd-7f45-715e75b6a779@molgen.mpg.de>
Date:   Tue, 26 May 2020 13:21:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Dear Linux folks,


Linux 5.4.39 reports the watchdog messages below on a Dell PowerEdge 
T630 with 12x E5-2603 v4 @ 1.70GHz.

     DMI: Dell Inc. PowerEdge T630/0NT78X, BIOS 2.5.4 08/17/2017

```
handsomejack:~$ more /proc/version
Linux version 5.4.39.mx64.334 (root@lol.molgen.mpg.de) (gcc version 
7.5.0 (GCC)) #1 SMP Thu May 7 14:27:50 CEST 2020
handsomejack:~$ grep TCO /boot/config-5.4.39.mx64.334
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
# CONFIG_SP5100_TCO is not set
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_NV_TCO=y
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_EXTCON is not set
handsomejack:~$ dmesg --level=err
[   11.618887] watchdog: iTCO_wdt: cannot register miscdev on minor=130 
(err=-16).
[   11.627956] watchdog: iTCO_wdt: a legacy watchdog module is probably 
present.
handsomejack:~$ dmesg | grep -e iTCO -e watchdog
[   11.603138] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[   11.609888] iTCO_wdt: Found a Wellsburg TCO device (Version=2, 
TCOBASE=0x0460)
[   11.618887] watchdog: iTCO_wdt: cannot register miscdev on minor=130 
(err=-16).
[   11.627956] watchdog: iTCO_wdt: a legacy watchdog module is probably 
present.
[   11.636462] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[   11.643679] iTCO_vendor_support: vendor-support=0
handsomejack:~$ ls -l /dev/watchdog
crw------- 1 root root 10, 130 May 26 11:40 /dev/watchdog
```

Together the error and success messages are from the same module are 
confusing me a little. How can I find out the legacy watchdog module?


Kind regards,

Paul

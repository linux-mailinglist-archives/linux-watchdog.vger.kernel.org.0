Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AECD38A7F
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2019 14:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfFGMkr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Jun 2019 08:40:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38404 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbfFGMkr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Jun 2019 08:40:47 -0400
Received: by mail-pf1-f193.google.com with SMTP id a186so1139370pfa.5;
        Fri, 07 Jun 2019 05:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9agjdYCFnOWdtpDyphPqUUWHjCoYb24AFnU1NhNh4UU=;
        b=c6WpfqQDrvjtE8UnxdDIKkxBnZe2fQjsDpl9jhuV8jV3r0Ak0F7b32GrRLDtf2qRrc
         FIsPdeo87ZeR9JvHqITNgac6Ck1LGTzVtW/2kBgnxZohGa9tTlVA/HUccEOQ2l/KUK4C
         WOZooh1ewy/OnLAvIHt1T4crt/+GNmywZqQI8fs8mqXt1TZOUadiYDyJTNT3/mmI3BMY
         k3eIiTpZcELA0ZrBf2OjN7bFlKGw2v+LJcSxdTiHdteIl6n+trrl782HdmnZvAd6hmnB
         rcuRIDzMFsXx+8pDRPz2zI3xDAX5EY71LCMJxiNUdIUsBOJXTmO3GQ+Lywrx501pI2oL
         5bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9agjdYCFnOWdtpDyphPqUUWHjCoYb24AFnU1NhNh4UU=;
        b=P+uderktYps6dxusEoPWzD472rIHC0WGjykKmhSXLwiwJg7O3FrkHxKWcvNYrJ2BMP
         7svH+623TEx6zYhKMa/pVC6eOWGNNFmu02YLPhkX5TuVxGYGPK8TrGwBAp4hE2CSDdoC
         gizJyeCrOHGbOiyE8Zsxk3Ock1PGxLAj5JlZXcBsYIlv/qeeE4mLcNqZWe5WvSzT4TrV
         QCBTjwfXDsbick1F/Srswxv+YHEOR6u0lZ3lqret94+PB35WbdaLTuvlstPUkq2xrq05
         B4E+9w3P2AwCJL/zYWk6LggfMgfFLGKXooQHHr8qNdZHvQQerggOdad+FBbXVe6ll5IU
         uEEA==
X-Gm-Message-State: APjAAAX/xxcuXIZXNqanEN4pG8vs6xZSPl0V0ZyJFion2ldJCKYkmSzj
        u8qSXNfeJNbj+h48k5+iwQurPN3N
X-Google-Smtp-Source: APXvYqyVZ43jmC/ZJL4AC3z+IYzXlwv2abx6WLtRd0DQsxJooba+4W19apwpKAE9joGHjVpolwwaqg==
X-Received: by 2002:a17:90a:2e89:: with SMTP id r9mr5125356pjd.117.1559911246082;
        Fri, 07 Jun 2019 05:40:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p23sm1772648pjo.4.2019.06.07.05.40.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:40:44 -0700 (PDT)
Subject: Re: [PATCH 00/46] watchdog: move 'registration failed' messages into
 core
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3d68d837-ea4e-fd70-27a7-2fb72696e378@roeck-us.net>
Date:   Fri, 7 Jun 2019 05:40:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/18/19 2:27 PM, Wolfram Sang wrote:
> Similar to my recently merged series doing the same for
> watchdog_init_timeout(), here is a series moving all error messages
> after a failed {devm_}watchdog_register_device() into the core. Guenter
> was right, this was even more worth it. For some cases, this also
> resulted in neat code simplifications.
> 
> The core changes were tested with a Renesas Lager (R-Car H2) board. The
> driver changes were created using a coccinelle script and build-tested
> by buildbot.
> 
> This series is based on Linus' tree as of today which should be close
> enough to -rc1, I guess. A branch can be found here:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/wdt/register_device
> 
> Looking forward to comments.
> 

For the series:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Happy hacking,
> 
>     Wolfram
> 
> Wolfram Sang (46):
>    watchdog: make watchdog_deferred_registration_add() void
>    watchdog: let core print error message when registering device fails
>    watchdog: aspeed_wdt: drop warning after registering device
>    watchdog: bcm2835_wdt: drop warning after registering device
>    watchdog: bcm7038_wdt: drop warning after registering device
>    watchdog: bcm_kona_wdt: drop warning after registering device
>    watchdog: cadence_wdt: drop warning after registering device
>    watchdog: da9052_wdt: drop warning after registering device
>    watchdog: da9062_wdt: drop warning after registering device
>    watchdog: davinci_wdt: drop warning after registering device
>    watchdog: digicolor_wdt: drop warning after registering device
>    watchdog: ftwdt010_wdt: drop warning after registering device
>    watchdog: hpwdt: drop warning after registering device
>    watchdog: i6300esb: drop warning after registering device
>    watchdog: ie6xx_wdt: drop warning after registering device
>    watchdog: imx2_wdt: drop warning after registering device
>    watchdog: imx_sc_wdt: drop warning after registering device
>    watchdog: intel-mid_wdt: drop warning after registering device
>    watchdog: jz4740_wdt: drop warning after registering device
>    watchdog: loongson1_wdt: drop warning after registering device
>    watchdog: max77620_wdt: drop warning after registering device
>    watchdog: mei_wdt: drop warning after registering device
>    watchdog: mena21_wdt: drop warning after registering device
>    watchdog: menf21bmc_wdt: drop warning after registering device
>    watchdog: mpc8xxx_wdt: drop warning after registering device
>    watchdog: ni903x_wdt: drop warning after registering device
>    watchdog: nic7018_wdt: drop warning after registering device
>    watchdog: npcm_wdt: drop warning after registering device
>    watchdog: of_xilinx_wdt: drop warning after registering device
>    watchdog: pic32-dmt: drop warning after registering device
>    watchdog: pic32-wdt: drop warning after registering device
>    watchdog: pnx4008_wdt: drop warning after registering device
>    watchdog: qcom-wdt: drop warning after registering device
>    watchdog: rave-sp-wdt: drop warning after registering device
>    watchdog: s3c2410_wdt: drop warning after registering device
>    watchdog: sama5d4_wdt: drop warning after registering device
>    watchdog: sp5100_tco: drop warning after registering device
>    watchdog: sp805_wdt: drop warning after registering device
>    watchdog: sprd_wdt: drop warning after registering device
>    watchdog: st_lpc_wdt: drop warning after registering device
>    watchdog: stm32_iwdg: drop warning after registering device
>    watchdog: stmp3xxx_rtc_wdt: drop warning after registering device
>    watchdog: tegra_wdt: drop warning after registering device
>    watchdog: ts4800_wdt: drop warning after registering device
>    watchdog: wm831x_wdt: drop warning after registering device
>    watchdog: xen_wdt: drop warning after registering device
> 
>   drivers/watchdog/aspeed_wdt.c       |  8 +-------
>   drivers/watchdog/bcm2835_wdt.c      |  4 +---
>   drivers/watchdog/bcm7038_wdt.c      |  4 +---
>   drivers/watchdog/bcm_kona_wdt.c     |  4 +---
>   drivers/watchdog/cadence_wdt.c      |  4 +---
>   drivers/watchdog/da9052_wdt.c       |  9 +--------
>   drivers/watchdog/da9062_wdt.c       |  5 +----
>   drivers/watchdog/davinci_wdt.c      |  8 +-------
>   drivers/watchdog/digicolor_wdt.c    |  8 +-------
>   drivers/watchdog/ftwdt010_wdt.c     |  4 +---
>   drivers/watchdog/hpwdt.c            |  4 +---
>   drivers/watchdog/i6300esb.c         |  5 +----
>   drivers/watchdog/ie6xx_wdt.c        |  6 +-----
>   drivers/watchdog/imx2_wdt.c         |  4 +---
>   drivers/watchdog/imx_sc_wdt.c       |  8 +-------
>   drivers/watchdog/intel-mid_wdt.c    |  4 +---
>   drivers/watchdog/jz4740_wdt.c       |  6 +-----
>   drivers/watchdog/loongson1_wdt.c    |  4 +---
>   drivers/watchdog/max77620_wdt.c     |  8 +-------
>   drivers/watchdog/mei_wdt.c          |  4 +---
>   drivers/watchdog/mena21_wdt.c       |  4 +---
>   drivers/watchdog/menf21bmc_wdt.c    |  4 +---
>   drivers/watchdog/mpc8xxx_wdt.c      |  5 +----
>   drivers/watchdog/ni903x_wdt.c       |  4 +---
>   drivers/watchdog/nic7018_wdt.c      |  1 -
>   drivers/watchdog/npcm_wdt.c         |  4 +---
>   drivers/watchdog/of_xilinx_wdt.c    |  4 +---
>   drivers/watchdog/pic32-dmt.c        |  4 +---
>   drivers/watchdog/pic32-wdt.c        |  4 +---
>   drivers/watchdog/pnx4008_wdt.c      |  4 +---
>   drivers/watchdog/qcom-wdt.c         |  4 +---
>   drivers/watchdog/rave-sp-wdt.c      |  1 -
>   drivers/watchdog/s3c2410_wdt.c      |  4 +---
>   drivers/watchdog/sama5d4_wdt.c      |  4 +---
>   drivers/watchdog/sp5100_tco.c       |  4 +---
>   drivers/watchdog/sp805_wdt.c        |  5 +----
>   drivers/watchdog/sprd_wdt.c         |  1 -
>   drivers/watchdog/st_lpc_wdt.c       |  4 +---
>   drivers/watchdog/stm32_iwdg.c       |  4 +---
>   drivers/watchdog/stmp3xxx_rtc_wdt.c |  4 +---
>   drivers/watchdog/tegra_wdt.c        |  4 +---
>   drivers/watchdog/ts4800_wdt.c       |  4 +---
>   drivers/watchdog/watchdog_core.c    | 16 ++++++++++++----
>   drivers/watchdog/wm831x_wdt.c       |  9 +--------
>   drivers/watchdog/xen_wdt.c          |  4 +---
>   45 files changed, 53 insertions(+), 168 deletions(-)
> 


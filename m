Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F075A2FA7D2
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 18:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436640AbhARRnZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 12:43:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407154AbhARRkj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 12:40:39 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE74C061573;
        Mon, 18 Jan 2021 09:39:58 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e7so19092354ljg.10;
        Mon, 18 Jan 2021 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=rtEV+yO5hUryVrfLNZRshRF3BazYXZlOEOzIhM8uokE=;
        b=guRYV35XTWl9ld5O144nAB/ZYsmBXhpzubFy8YZfybThYsmCspvbj5MNr8LyolLa2V
         /+ywk5PzIoM4GIo8GDaeFN+y6yK6pNIoWwrcErfN9p3o4wqR7LBZ5yRjOAmXNf09T4yO
         IfzJ2/cXyJRrQsykgn35+vZHR+r2PbebhBg8xYChgm8M3w+eYslmYHFuSJHgx7+YkQfn
         CP6jD9p41btVW45GCZEM/VbFDI+31FhII17Zj94LpFT8JdphP9LFL+kSms2RMLJeEBGD
         tXsFYWtTuPJzgbl57QUrfbSVFC74Oz81bNaE/78nK1peanmB1jCcrZNf39aWgT8DPcKC
         dSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rtEV+yO5hUryVrfLNZRshRF3BazYXZlOEOzIhM8uokE=;
        b=YQVrxWKPIlc46G4szKic/0pZ+tlOfrJWdyKQAle4lZZEo5jj+Wz75qAlH0yuI5+k4u
         pez95dyxnlUEPqsYFZTXZ/3SXfqS/P5hSpXHnm6689mNvGDUiUjBRlmLN/5fObz8qcYX
         myYKeB06nnTftab1VadKmMjQRRNrlTGQyCb1T/5esrlv0ZbnCe8P7PFpidFLIqk31h8L
         UMIhMY5f3kblS5z7sLJT0W+ca7sOQv7hz4PzeCAZ1JMXRgszRtI2aVv2QVSfLuJ9GG1g
         t4dX4OWbv4NFSw7oReSW08qEkpyNJjdGOFujklg7d+03XwLHRNCYb2lXS03qAJ4HNHPx
         EUbQ==
X-Gm-Message-State: AOAM533yJ5LAYppxehT63kxuTR0AXFVEI1S7/u8A09OjNsZ76LskJIiU
        qPaG7r9wUj8jJMLPo7d1EPfO+/DXZWV/erJDkE6yf5SXW0zpAg==
X-Google-Smtp-Source: ABdhPJyZK9bb5bJkuiSzKhYfsUlMOKgpGAVs019N1eEcHohcFTiaN5VVvF398PZeRQFoR49c3NBwmjGUleu3fZcrBp0=
X-Received: by 2002:a05:651c:3ca:: with SMTP id f10mr305984ljp.508.1610991597284;
 Mon, 18 Jan 2021 09:39:57 -0800 (PST)
MIME-Version: 1.0
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Mon, 18 Jan 2021 12:39:45 -0500
Message-ID: <CAD56B7eAZ0hb0kuRbALONMAgvuhHjqrShVRwf1s93ZSbv8xqww@mail.gmail.com>
Subject: watchdog: watchdog_stop_on_reboot()
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

I'm going through our out-of-tree commits, and was wondering if there
is anything to be done with this one. Basically we remove both
watchdog_stop_on_reboot() calls (not sure why there are two to begin
with):
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -330,7 +330,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)

        watchdog_init_timeout(cdns_wdt_device, wdt_timeout, dev);
        watchdog_set_nowayout(cdns_wdt_device, nowayout);
-       watchdog_stop_on_reboot(cdns_wdt_device);
        watchdog_set_drvdata(cdns_wdt_device, wdt);

        wdt->clk = devm_clk_get(dev, NULL);
@@ -359,7 +358,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)

        spin_lock_init(&wdt->io_lock);

-       watchdog_stop_on_reboot(cdns_wdt_device);
        watchdog_stop_on_unregister(cdns_wdt_device);
        ret = devm_watchdog_register_device(dev, cdns_wdt_device);
        if (ret)

This seems to save us in certain conditions where the Software System
Reset fails[1]. I'm not sure if there's other use cases where you
really do want the watchdog to stop on reboot?

This is on an arm64 Zyny Ultrascale+ platform.

-Paul

[1] The one reproducible example of the Software System Reset failing
I have for our system is after a kernel oops from removing the
xilinx_dma module.
https://lore.kernel.org/lkml/CAD56B7d_9+0XuOBysxW=CADLTG_7RybBTM8hCYKSigB8ie8E_g@mail.gmail.com/

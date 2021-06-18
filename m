Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315E73AD327
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jun 2021 21:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhFRTxK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Jun 2021 15:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbhFRTxK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Jun 2021 15:53:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997DAC06175F
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Jun 2021 12:51:00 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id r5so18481988lfr.5
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Jun 2021 12:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CPNUC1INpkBGp7L0c6yR9HA1R8pzzjkYXv1R+/dnXdc=;
        b=JbpUejWIGvdWnGdaScvOssgSjlQOm6+oUTSDMXhPVQU17pxE44HrVju0YelRoaFNhI
         j63avYLtLaX7KWvuQNZZ40b4KqNxCl8kLOCGy5dnSL3ukn0FvO6D1xQYhDXtwS4x/Iyl
         uqeoUquKOq1oEsEBOVVL1/DMrMnrozFtlAZU9IsxEHSQycwtRdaYDaPwMjAiRnwwCrEj
         lLe6Xsf0uvNluuIP0veR3+Dka65ddrYNIFUAZ/qw5zyM5rc7MFQaB2UB0iyd6h/4eWI1
         Dyyn18WMyPfrSeHIMlhOzEnQrbbYog2eyq36FGpxY2cW1GRBbHSeUyNZP49WR3IT3W6q
         G+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CPNUC1INpkBGp7L0c6yR9HA1R8pzzjkYXv1R+/dnXdc=;
        b=ny0HjI3t/21iDQjLwtQs0zdPk8igZiQDQA+fmGWQRW+LYE6QPgCVHd0x6IX67Uwtff
         MS3cMwEqiD9zPl5pDDY5GvAP8p+X5jKvvRTby6WPA9N/XHaf7e0a71+LD3IV4Kgy4q6V
         3FuZskbpm5HemZ/43cg5Xj9lLwyuWFqjuV9kw4SbJwEBe/D8qLmiEl3KT+/ysNF9HF7I
         D2jEA62giG8+zPkNxAOwazhhF/p5sMILVhFqot8vTB39o7yr5x8GfgnxYTX/focjG9dB
         CQ7S4TMza5Bv6SXm1dma9JRLqQOT+sQ31FZWcIDYwfPkx/ygrXFid/ch77pEfqxXhnps
         3RMw==
X-Gm-Message-State: AOAM5320TwvfqP1/NnGdIpwb7tt4J8DFS1IHBSeYSwwkX8Vbuhm+VgDc
        S0Sgs1FXawSB6jSDnXPOzbTkEg==
X-Google-Smtp-Source: ABdhPJwSCScqwnEQQilC7ZOKJUU/HzRiR2R7hdC02vTd9iU32d4X7neASyXaR24rQhCDirfjQi57qQ==
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr4585528lfv.181.1624045858969;
        Fri, 18 Jun 2021 12:50:58 -0700 (PDT)
Received: from gilgamesh.lab.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id o7sm993221lfu.215.2021.06.18.12.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:50:58 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        grzegorz.jaszczyk@linaro.org
Subject: [PATCH v2 0/2] introduce watchdog_dev_suspend/resume
Date:   Fri, 18 Jun 2021 21:50:31 +0200
Message-Id: <20210618195033.3209598-1-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

The following is a v2 version of the series [1] that fixes system hang which
occurs when the ping worker fires after wdog suspend and before wdog resume.
This happens because the ping worker can issue low-level ping while the wdog clk
was disabled by the suspend routine (accessing hw wdog registers while they are
not fed by the clk).

To overcome this issue two patches were introduced. Patch #1 introduces pm
notifier in the watchdog core which will call watchdog_dev_suspend/resume and
actually cancel ping worker during suspend and restore it back, if needed,
during resume.

Patch #2 introduces relevant changes to imx2_wdt driver and notifies wdog core
to stop ping worker on suspend.

[1] https://lkml.org/lkml/2021/6/15/542

Best regards,
Grzegorz

Grzegorz Jaszczyk (2):
  watchdog: introduce watchdog_dev_suspend/resume
  watchdog: imx2_wdg: notify wdog core to stop ping worker on suspend

 drivers/watchdog/imx2_wdt.c      |  1 +
 drivers/watchdog/watchdog_core.c | 37 +++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c  | 47 ++++++++++++++++++++++++++++++++
 include/linux/watchdog.h         | 10 +++++++
 4 files changed, 95 insertions(+)

-- 
2.29.0


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C48D3A7E4A
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Jun 2021 14:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhFOMlU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Jun 2021 08:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhFOMlT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Jun 2021 08:41:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB0CC06175F
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Jun 2021 05:39:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p17so26755313lfc.6
        for <linux-watchdog@vger.kernel.org>; Tue, 15 Jun 2021 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UuCiW2orTCucTZCp6O8CDD9AXD/9H9Otzbi//Cqg1DA=;
        b=VZ3GcXveZakLxHce86jM4RSuS7T16Lj1tuDnRPjjD6LmGpt28d1lvFZtSU3p7z0M1p
         ReRbsQU4aVs4CX7VFzsuAIKAuJuvEBZfqLFZAhOCb0mt7DZrfKtiZGkkVZ0uNrLZ+dY1
         luUe8J/JKZuqKjFiY1V+aiYKkwFMJtMvVHz50fSPUv2+LoFm+fL2cYZoLhoavVaMcnJp
         53C879XsXgpQeNsOLnsK/jCocXn6Lbilb9UCJpfDqXFZr83N9k5sPbKzhl9sjnOtyrbn
         ykxZsh28MK7EPMorjJGsGTZwre6MCu6c0GgBoCpNHt7Cq7+wQBsVAU1WIBfp8FIUsLin
         Ofyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UuCiW2orTCucTZCp6O8CDD9AXD/9H9Otzbi//Cqg1DA=;
        b=c8t0tOWCoiw57TGsWI7QKenyZqI3mSV6vt1oo6+b+xgQ4HgpgWyJjeQZG6XqT9WFAe
         zTXLPDllm7EgaABXS3jiZfI42HmDcqK33xa0LPsAUxn3w4BNN2RdJli+oOuZBsXzpQqw
         dfjGANCVGrW6h6VpKvOunpnObfNUnNpGzpjhi8b7HJMdJr+2MpbaQmgJH53kyoqDWsfW
         0U97DXts3R4sR6YpMunJ68bZjg1O3FJvcmDOKTmjrSn4/pLekIxzDUPgUEfax7++Uxwb
         cbmDyHs0Rk/6cmgcyu9wjsfhMBFnXSXWiUef2lNwdIVr9Is0rKBIsFfhnnu7nZQ2jNku
         v02g==
X-Gm-Message-State: AOAM532fKBuxtMTzh6CVwuM7ua7e2repeUJNpwNB7E4DX/n3wfs0z+of
        qDtO34+/lIOcpkEDXhg1WNv4RQ==
X-Google-Smtp-Source: ABdhPJwDSx5g6S/Z3ibqwuHIj/X45vbYi1g0IUdok+X6ST8l1GlMDaBjW2PeiJeQ28sxtJaAY2HhRg==
X-Received: by 2002:a05:6512:36d8:: with SMTP id e24mr10216306lfs.8.1623760751686;
        Tue, 15 Jun 2021 05:39:11 -0700 (PDT)
Received: from gilgamesh.lab.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id m12sm811418lfb.231.2021.06.15.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 05:39:11 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        grzegorz.jaszczyk@linaro.org
Subject: [PATCH 0/2] introduce watchdog_dev_suspend/resume
Date:   Tue, 15 Jun 2021 14:39:02 +0200
Message-Id: <20210615123904.2568052-1-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

This patch-set fixes system hang which occurs when the ping worker fires after
wdog suspend and before wdog resume. This happens because the ping worker can
issue low-level ping while the wdog clk was disabled by the suspend routine
(accessing hw wdog registers while they are not fed by the clk).

To overcome this issue two patches were introduced. Patch #1 provides
watchdog_dev_suspend/resume function, which can be used in wdog drivers. First
function allows to cancel watchdog ping worker during suspend, preventing
watchdog_dev from issuing low-level ping and second one restores ping worker if
needed.

Patch #2 introduces relevant changes to imx2_wdt driver and takes advantage of
just introduced routines.

Grzegorz Jaszczyk (2):
  watchdog: introduce watchdog_dev_suspend/resume
  watchdog: imx2_wdg: notify wdog subsystem about wdog suspend/resume

 drivers/watchdog/imx2_wdt.c     | 20 ++++++++++----
 drivers/watchdog/watchdog_dev.c | 49 +++++++++++++++++++++++++++++++++
 include/linux/watchdog.h        |  2 ++
 3 files changed, 66 insertions(+), 5 deletions(-)

-- 
2.29.0


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEC34475AA
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbhKGUcb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbhKGUca (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:30 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0B0C061570
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:29:46 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e11so6237621ljo.13
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jGY7RfOaQrR143tFTXp9AmdaelagLkghITmdcAU5ck8=;
        b=W4SKTjFA/TwvdtydJ3O3SLGlMUvD3lJKRcCtlae+ZoWNf3xoQjJ2Q4l8YD741gn2TX
         2CPO9+YqCVeFaZpY8swk55G2XMtzaWwZGB1RVvF3/73DQOSp4BHB0F/KN6W7d+kgA10+
         GdxqOJWAEw8FHovVwTFY55UexKesLc72omZ3J/EwbtfFILCDV1OIJne/Cd+Y+HFLTLLX
         KXbnOJ02/Lr0DlGkk/WAkL9fuYu4fb+UguBhy5eIwesuWNcE/adt/0hvUwy7l/Z3tX36
         jsyrI87Mm8G/zj/WPxNeLfOk2Hur8wFcMPzXocB1A9wyH9ryhR2jnqHmm0ybwW8e9eOj
         gssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jGY7RfOaQrR143tFTXp9AmdaelagLkghITmdcAU5ck8=;
        b=zRiYtZYtMDJkJWyy9QdouUYTr7gOJFZwe5umKa3TVqvkmt9dJG4cZGaY71J58s4Hap
         0LdR76smb8zcmaVpa0FEhU9YgMrUOc5MI237wFf406zKJx8lSGmEGb74nSpz1+Zt6MlH
         ECALhUTMzJz9Yj0Ox9Yrn8GIt3EEsuSpCmKF8O9LYnUwGQrG3NEMpHBBIccoRnTLbddW
         nl+H88HCaNseHhlbDw67Hp1hq4uqR0MwZJKSYlPhqbKtqWpEC7UgrLw5p2ILqbtWinMZ
         9m+iykphz4M5b/bRrXZvTbQgK0ZojmjliXTxs7+TBKZZJLSc0OkbPSKwC+Z4NOJvUUOW
         9VQQ==
X-Gm-Message-State: AOAM530S6E6RnzXlEwtJLDe+e7c0MuhcYltkZrfvY/oJLTpwLBTA3XFq
        IxOjM4MKQZ2LOCNCjAtSueUFMg==
X-Google-Smtp-Source: ABdhPJwrjrSG/hCZUVzVADJdX6jnHk5AqH06vyV+y+aUeCYlO/afKuy3y5L6/Q1l5o0DZSSHdlTX/Q==
X-Received: by 2002:a2e:3902:: with SMTP id g2mr77151116lja.321.1636316985146;
        Sun, 07 Nov 2021 12:29:45 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id e29sm4437lfb.111.2021.11.07.12.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:44 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 00/12] watchdog: s3c2410: Add Exynos850 support
Date:   Sun,  7 Nov 2021 22:29:31 +0200
Message-Id: <20211107202943.8859-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Exynos850 WDT IP-core differs a bit from existing platforms:
  - Another set of PMU registers
  - Separate WDT instance for each CPU cluster, having different PMU
    registers/bits
  - Source clock is different from PCLK

Implement all missing features above and enable Exynos850 WDT support.
While at it, do a bit of cleaning up.

Changes in v3:
  - Renamed "samsung,index" property to more descriptive
    "samsung,cluster-index"
  - bindings: Disabled "samsung,cluster-index" property for SoCs other
    than Exynos850
  - Added quirks documentation
  - Removed has_src_clk field: clk framework can handle NULL clk; added
    s3c2410wdt_get_freq() function instead, to figure out which clock to
    use for getting the rate
  - Used pre-defined and completely set driver data for cluster0 and
    cluster1
  - Coding style changes
  - Added R-b tags

Changes in v2:
  - Added patch to fail probe if no valid timeout was found, as
    suggested by Guenter Roeck (03/12)
  - Extracted code for separating disable/mask functions into separate
    patch (06/12)
  - Added patch for inverting mask register value (07/12)
  - Extracted PMU cleanup code to separate patch, to ease the review and
    porting (09/12)
  - Added patch for removing not needed 'err' label in probe function
    (11/12)
  - Addressed all outstanding review comments on mailing list

Sam Protsenko (12):
  dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
  dt-bindings: watchdog: Document Exynos850 watchdog bindings
  watchdog: s3c2410: Fail probe if can't find valid timeout
  watchdog: s3c2410: Let kernel kick watchdog
  watchdog: s3c2410: Make reset disable register optional
  watchdog: s3c2410: Extract disable and mask code into separate
    functions
  watchdog: s3c2410: Implement a way to invert mask reg value
  watchdog: s3c2410: Add support for WDT counter enable register
  watchdog: s3c2410: Cleanup PMU related code
  watchdog: s3c2410: Support separate source clock
  watchdog: s3c2410: Remove superfluous err label
  watchdog: s3c2410: Add Exynos850 support

 .../bindings/watchdog/samsung-wdt.yaml        |  48 ++-
 drivers/watchdog/s3c2410_wdt.c                | 322 +++++++++++++-----
 2 files changed, 287 insertions(+), 83 deletions(-)

-- 
2.30.2


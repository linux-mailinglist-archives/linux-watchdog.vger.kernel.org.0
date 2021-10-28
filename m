Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABE443E867
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Oct 2021 20:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbhJ1Sh7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 28 Oct 2021 14:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhJ1Sh5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 28 Oct 2021 14:37:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B2CC061348
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:30 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bi35so15481195lfb.9
        for <linux-watchdog@vger.kernel.org>; Thu, 28 Oct 2021 11:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4WzQadX+RqazB/22Gcyj8+qG3ieppJrK8iuTkJY04o=;
        b=lz9xHVl/WZ2+qnHRULOWJhF3wAg+Qu/4QXcPuEBwjl0bcQxDa7ZcADKsUnqisJL85m
         9QuxVaumc9MsznWizeq3BP1NSxZv7ZZKlHK0QE7Bt3b1WVXBM4cd1AQ+bZSm9I81B/+y
         nrw2D9un7XZGlJbRX4HJx4X+vEMQysSSi9CKh4jgzthdODy8xr6DoJz9mecr8DutP+vd
         4InCy0xFoZRcbF7Xm+9ocRSWR0Nn24L+m+Xtf+ZAVZnWhEQO/f37Miw4CpwOn192h3dY
         SYx9lUgPK9DHydFFvuDaDUxvKoBcA4cUZN+0GEGni0H3/OF+3HBCMV3nTsr1lj44uFFa
         XG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n4WzQadX+RqazB/22Gcyj8+qG3ieppJrK8iuTkJY04o=;
        b=8R3572qs18iF22NjBWoPRANge/tteeeXGVKJAuAfflHOvJ7cqbsBdKuIDSW2qyM9Xe
         dhxdvanSL8xQ7ZYLlC6DsISd2pBgC95zsmgHboQ//w0WJsYVlrqWNx7lF2wlyhmhYjE1
         L/1KJ/ZFDbDQOD3Ik2Jd44TpOrt+WNDO2T0XqoUTPQ/UHgHpjAlv/QzORVEVBJ8gmfHj
         J725xFPIOu+Cf2qr4gddhIV78bjo3Dh7AViljaRm8wF6o8JUNgpN1AsyJLtzX/I5XE8d
         /eznRlo0GERmkOaivPPHlxjXoPsrIwgIWFwQ6rEweJqQS2qlppmo5fYoFPf2HDfq48yh
         Am+Q==
X-Gm-Message-State: AOAM530yxNL6kOHjLdB6ZX4s6TiMJ4pwHzRjSVUKg8M+iyd0CsVxgSRc
        rx3j6WUoE3cpUcBkK+yI/LY5yFrBBkneNZN5
X-Google-Smtp-Source: ABdhPJzw48y/mBL2BnGr0m1Qqbbip97MzoXwpbjKR4smI4OiyzC/sI4MTwQAwE05fJIq4q+TjgD1Pw==
X-Received: by 2002:a05:6512:b8b:: with SMTP id b11mr5822144lfv.99.1635446128588;
        Thu, 28 Oct 2021 11:35:28 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z3sm390466lfh.17.2021.10.28.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:28 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/7] watchdog: s3c2410: Add Exynos850 support
Date:   Thu, 28 Oct 2021 21:35:20 +0300
Message-Id: <20211028183527.3050-1-semen.protsenko@linaro.org>
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

Sam Protsenko (7):
  dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
  dt-bindings: watchdog: Document Exynos850 watchdog bindings
  watchdog: s3c2410: Make reset disable optional
  watchdog: s3c2410: Add support for WDT counter enable
  watchdog: s3c2410: Introduce separate source clock
  watchdog: s3c2410: Add Exynos850 support
  watchdog: s3c2410: Let kernel kick watchdog

 .../bindings/watchdog/samsung-wdt.yaml        |  17 +-
 drivers/watchdog/s3c2410_wdt.c                | 215 ++++++++++++++----
 2 files changed, 190 insertions(+), 42 deletions(-)

-- 
2.30.2


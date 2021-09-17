Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B46640F4C6
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 11:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343694AbhIQJ2K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 05:28:10 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48564
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240392AbhIQJWW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 05:22:22 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 767664029C
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631870458;
        bh=YcuZIvaL+AKjfRZLsdr1yj1j2DO/8dKWf8eF/CvCCZ8=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=DCcHSXHY7tNWxBgHHr/AqwLydKPien93hrVXqnfcMhr17MtF+R4ujchemZlm4y+he
         ncyecXsrUS+wDw1LTongCEsTLs+zWRPviDLEqmvWb+MkwMjBji1xheWth6uyl0V27+
         KTv0OoP+uh3c+TUPrAKzMeouSZb+G7lz0OCI9/axp46jYrItAlMCuJ9ksNvNFx6VHJ
         eJS15FBi+H/i2elSr3+XPNyPYQyFvemX2Y1QZbqYbXmNqiHujWeudwoDbthIYsVD6O
         VKZS//+us2DGSx4LcZlkwscApgatH3N8T1FVud1/95dyNA7X1BOkSy+mbE0kiX/JRP
         tCJ6zUo8+JELg==
Received: by mail-wm1-f69.google.com with SMTP id z18-20020a1c7e120000b02902e69f6fa2e0so4357155wmc.9
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 02:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YcuZIvaL+AKjfRZLsdr1yj1j2DO/8dKWf8eF/CvCCZ8=;
        b=En/jDJlQLr9ZFCnqUmYhaCJm/0ldl9BVIR6S1h3mcJCxlKJHVgD1xw+Zpu6VPulaXr
         a5QL3AZ4QL8TRiML2X2Ozu7jHY0VrE52kMI/46g0H6Wg2EuGCG3NWjCYDski3ni+Fqh5
         j6BiE7MMBYus7N2LFY3+LK2vjz6HxkWJJ9iBFModSxehWPx3nEG3qXQRDDmDt5zZCTX1
         XiImuCwrMBCKWOqVXLixZOzPL4ZfeHrsUmPzROh95nEo+Ua13hfKoC1yGKwHjiEsZDZZ
         BkjyjtAaglp02t+QrvJnFHwCSV5hN8FTQOfBzWqBejCAZ8s0gnwEWENQ+kWanqv/9bc8
         1rSQ==
X-Gm-Message-State: AOAM530dgHhtFdb8ygkAEsXXxB9kus6H27s13BDz7jxAeqIyMf+3z0VG
        gskqAssjfOW+jk4cQ5NlGqTFzKiF5LN+Onzs9tlp9lL/x870TlM2rsuQFw+gyKLhVpkeS7lvwrV
        zHqwSA0D+l1L0AUxftPxkp7XmJ4dw4OohI4Sv9LgYEXur
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr10808463wrw.122.1631870458125;
        Fri, 17 Sep 2021 02:20:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvQmLIS0aKtvq0BU+XTh60mXLl/jBGH1MtzbCR0/UJlDIfPyI3O62aYGgTy/76XmF4d0kwUw==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr10808450wrw.122.1631870458009;
        Fri, 17 Sep 2021 02:20:58 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id w5sm6097828wra.87.2021.09.17.02.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 02:20:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: sbsa: drop unneeded MODULE_ALIAS
Date:   Fri, 17 Sep 2021 11:20:23 +0200
Message-Id: <20210917092024.19323-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/watchdog/sbsa_gwdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index ee9ff38929eb..87b496405871 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -411,4 +411,3 @@ MODULE_AUTHOR("Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>");
 MODULE_AUTHOR("Al Stone <al.stone@linaro.org>");
 MODULE_AUTHOR("Timur Tabi <timur@codeaurora.org>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.30.2


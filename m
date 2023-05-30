Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4B27164EA
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 May 2023 16:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbjE3Ot2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 May 2023 10:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbjE3OtP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 May 2023 10:49:15 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91315114
        for <linux-watchdog@vger.kernel.org>; Tue, 30 May 2023 07:49:12 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2af29b37bd7so49175811fa.1
        for <linux-watchdog@vger.kernel.org>; Tue, 30 May 2023 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458150; x=1688050150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1z7LKWFPOmfXdAKBPrDZn05nG/m3OsiksUdI+BUoo8=;
        b=au3kKg8W7QqZlM184Mf3plRAjYuxNOiScsb1NkoNQrKhB+QKk+18S6EtrPRE58o5Rs
         Q1/3o2Mjj9eY0FEkE53VAKcNAbApZFdG5q9x7+IyOwzMudLNMFi+sq4W0TzNG2QkGwHO
         YnGuPKIwQhukjOLKYlXmRBvdNvqokIHxeYfj7hwnQ4hepXuizdGpVCLTdZusUyau/TGP
         3Vj4v3F4Sg6f3/X2GB+44fSqmHH9eyb+nkIEeJFVpK5Ifb5peDRxxdT/JHpLmKDfKEph
         /287kJIavDJMaiQ4wsKVKTqboEp2XQfs7llNgs/6FY4YQQ0C6Fz2iGXVoBHlZ2Iep6Ah
         ZkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458150; x=1688050150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1z7LKWFPOmfXdAKBPrDZn05nG/m3OsiksUdI+BUoo8=;
        b=APFsNCXxiiZcEYzwmrQ/A+aw91bn100BGfpb6yYZpeDBTzT3yyu3o3bnnQ2Rh9d981
         ZOZFusvYNQU9y4dzRC8l+SVZeORx2x8fNGMBBZ7rZcsZbBkWUOrM4e10uV9qj1DhJZkb
         YppKwbFRQ6OVOdwqOIU7HyPSKes0luEN1uoD1mka22aDL7v3AjBjLbddvU3LtuuF3tiJ
         mWADXdTlvNd4QBacNUf25wgnqzodZsMnAFRUdgJDpkfpbwowvi9Rhhr6yBXd159MH3qB
         1NQDegmaHqFOwWi3hDiSKULTRfz1B6OCjuA6oIJbhHtfPDxuXWYyanUi0k2s6rEI5HAj
         S0GQ==
X-Gm-Message-State: AC+VfDyz4HunSPLFScr5PMoBKIbjOROtCWUBGzOHLT3jP5qtuA39B7Rm
        C8O3RtuIGoS5WSQFGI5fH+/DIA==
X-Google-Smtp-Source: ACHHUZ6Q397O5W+0T36KU+LeZVZXavLXO/YPP87rL8qBwPyoOzxipjl3/WBbz3r85vX0ljLsQp0EWA==
X-Received: by 2002:a2e:8382:0:b0:2ad:a12d:e458 with SMTP id x2-20020a2e8382000000b002ada12de458mr1016018ljg.41.1685458150736;
        Tue, 30 May 2023 07:49:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Dipen Patel <dipenp@nvidia.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dilip Kota <eswara.kota@linux.intel.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-spi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH 5/7] spi: dt-bindings: restrict node name suffixes
Date:   Tue, 30 May 2023 16:48:49 +0200
Message-Id: <20230530144851.92059-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Make the pattern matching node names a bit stricter to improve DTS
consistency.  The pattern is restricted to:
1. Only one unit address or one -N suffix,
2. -N suffixes to decimal numbers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/spi/spi-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 90945f59b7e8..524f6fe8c27b 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -17,7 +17,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^spi(@.*|-[0-9a-f])*$"
+    pattern: "^spi(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   "#address-cells":
     enum: [0, 1]
-- 
2.34.1


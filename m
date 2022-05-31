Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE06539231
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 May 2022 15:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344938AbiEaNvH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 May 2022 09:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344942AbiEaNvA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 May 2022 09:51:00 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02521146E
        for <linux-watchdog@vger.kernel.org>; Tue, 31 May 2022 06:50:46 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q21so7594126wra.2
        for <linux-watchdog@vger.kernel.org>; Tue, 31 May 2022 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uV55XMdMMXm/8YBcA+hYcRdN/Sy/q9ytKejpU0TX1a4=;
        b=ydZ0fPc4/noMrgY/rszzHccN97Dm96R2jV+wrzbjo52SSgkXsjX2+EmRB8HsR5XPRy
         OVhxeu+TgJKJQmJ8ptz4ZS7KSw34lKfJHR/Oh1KxcrGhn/iCWSi/i3mbLTb8GgMD5vo4
         pr0FmYobyv9iFimX2s+CYCufeQZNf5yKkJ6M6nUmnNbMUbsURMc58EQ4rsJoD++egq8e
         XahX6EwRKB1QJ10UyGUAm9BQzptgx5KvmldEadtAjoKFX5UJv5AzOa20xrPpQB/aVtrR
         qLyOwm378YQrHUZMrdxvMFzDfZaVWFwOrMrwzLddQGIhcZrd9/nkoQi88OD6OFhcqZvG
         /tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uV55XMdMMXm/8YBcA+hYcRdN/Sy/q9ytKejpU0TX1a4=;
        b=nWj+qiltVkVhYPKMLYu5BYIM/X2LsxeJWUV0cipQLCq3QEW0XtUm71Znee6ZCWkriN
         lRTiIbQX0onFNNYr0Idp62un+f0nvYG1V/m1s8vg+pirJ08MUZEt+D7bZegZjqXbg6nT
         Zi+ncd419T2DJ2ViW6cvcvvi8vgHmCu9MVOYf0pnl6EcszefuBpkzKmEHTm8SkLGNOAJ
         I3UBOwVgvcm0uzEWkMb18NnMBG+Cly8LvUnC4uGUTUwO20z8/n+YQDM8Rlo1PVuoJYLQ
         CsBW8AQJv+pRg+/59BYbfL01/Ke9rndbH0ZCNSM90f8NIupVvzDzgyNR0HvcA85qGuMD
         lGvA==
X-Gm-Message-State: AOAM530x0rsUEwuqRyP5P27Mgu9OSWXxtoaK+8/2Z6Fk7oN7FjJog4Mn
        JKSF6eglFFEvzc0p4WpYJpkO8A==
X-Google-Smtp-Source: ABdhPJxv8/PQNV+ezFLIiwnnP78JfWw4efymnBcIzCpOQsc85VBTswc/napM3IwCND/u1AFwGmeM9A==
X-Received: by 2002:a05:6000:1869:b0:20f:c1a4:111 with SMTP id d9-20020a056000186900b0020fc1a40111mr43818748wri.261.1654005045408;
        Tue, 31 May 2022 06:50:45 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:44 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        Sean Wang <sean.wang@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 04/17] dt-bindings: arm: mediatek: Add binding for mt8365-evk board
Date:   Tue, 31 May 2022 15:50:13 +0200
Message-Id: <20220531135026.238475-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531135026.238475-1-fparent@baylibre.com>
References: <20220531135026.238475-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add binding documentation for the MT8365-EVK board. The MT8365 EVK board
has the following IOs:
* DPI <-> HDMI bridge and HDMI connector.
* 2 audio jack
* 1 USB Type-A Host port
* 2 UART to USB port
* 1 battery connector
* 1 eMMC
* 1 SD card
* 2 camera connectors
* 1 M.2 slot for connectivity
* 1 DSI connector + touchscreen connector
* RPI compatible header
* 1 Ethernet port

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4a2bd9759c47..a4b1288fa837 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -216,6 +216,10 @@ properties:
           - enum:
               - mediatek,mt8516-pumpkin
           - const: mediatek,mt8516
+      - items:
+          - enum:
+              - mediatek,mt8365-evk
+          - const: mediatek,mt8365
 
 additionalProperties: true
 
-- 
2.36.1


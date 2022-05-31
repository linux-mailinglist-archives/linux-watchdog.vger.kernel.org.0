Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60B72539271
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 May 2022 15:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243939AbiEaNwi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 May 2022 09:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344960AbiEaNvS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 May 2022 09:51:18 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E248397299
        for <linux-watchdog@vger.kernel.org>; Tue, 31 May 2022 06:50:53 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id e2so18821683wrc.1
        for <linux-watchdog@vger.kernel.org>; Tue, 31 May 2022 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poEfxrglOPRvGSjuKsP/EkFpCQGyu08L1eg/xjf1B1Y=;
        b=aHmuwAfSfJw6Mefu9ShhCni9jlWFc+9ZC9ROtMspcijeIrK4NW2NnFHPjuJNB6UnqY
         fbWvMizollAHpP4g1wiQxsHcPAEufWVY3Q4ZOaALL1x46y+ayC0kMwl3y50W0tLYinnr
         DA80hwBPdL17pWfSPFvwTEsv/ZjHjV6UvnjTBCyzpSYbQEyCVJ54PJpuaqP69QdDR2vb
         gzBoG9139g4a6k4E3Vmb+/SWrzsVqFxrjQzjEKsnmPqEtL/2jd0IVfoxtnmFeFHVNsMv
         DSidPQzDa8RiBW6TyVqha6BIvBOaxjN0Sj1OpD3TogJqehwGY2CTnXvMD3Gez73Jc5Z7
         AemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poEfxrglOPRvGSjuKsP/EkFpCQGyu08L1eg/xjf1B1Y=;
        b=NlZ616HeS10uRUa8+Il9EVQiAVYK4oyCdZSo+BesxhTkyiNqqqymmbivyr5DjHbIBt
         vzZI207PKwSqn8skyiRBREgM8iwtZoFYffH2zuUiyXtWg3Aykptee53GVvEmTxt1JeXb
         2WNFzaG3FdlN+1VAxvkxpjugYSSlEoEfxN57XUgTrl+U07T1+e/3yWsk9TRyl6NqMmHh
         m3Sizupwyh32KS6a2RqMvYuH2z4aJry5ex3d1ghxtpfADip/2sR0ir+G3oOVEtU6Vr9f
         nGcUTXLol8KvxjALXf19XJYXyfMIWCZYE54yaakWllBkkXdXBdxroTzXIe6D4Fi0cXth
         ovwA==
X-Gm-Message-State: AOAM533x6oWbnkUculK3l37iDDgnbGMe/XmvbZkf9sabOPSv5/gLIO7N
        VJuP/OxE+TiXmonsUE3BGbKqxQ==
X-Google-Smtp-Source: ABdhPJykTBwGPKug6M1MqnHyEK7Ev61BplKNaormccadnbmARRHHBqjjm4OJ28cN7w83/dZOCJCd0w==
X-Received: by 2002:adf:cc87:0:b0:210:307b:2ec5 with SMTP id p7-20020adfcc87000000b00210307b2ec5mr9747075wrj.98.1654005053251;
        Tue, 31 May 2022 06:50:53 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:52 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 08/17] dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC bindings
Date:   Tue, 31 May 2022 15:50:17 +0200
Message-Id: <20220531135026.238475-9-fparent@baylibre.com>
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

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index a97418c74f6b..0e63c4ba3785 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -19,6 +19,7 @@ Required properties:
 	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
 	"mediatek,mt8192-wdt": for MT8192
 	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
+	"mediatek,mt8365-wdt", "mediatek,mt6589-wdt": for MT8365
 
 - reg : Specifies base physical address and size of the registers.
 
-- 
2.36.1


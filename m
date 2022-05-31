Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB83E53925F
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 May 2022 15:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241983AbiEaNvx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 May 2022 09:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345048AbiEaNvs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 May 2022 09:51:48 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE24986F2
        for <linux-watchdog@vger.kernel.org>; Tue, 31 May 2022 06:50:59 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d26so13180933wrb.13
        for <linux-watchdog@vger.kernel.org>; Tue, 31 May 2022 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQC4VQ4WPzHEK/K/bvUrrtdGhjy2EyWTwZNKtRp+iyw=;
        b=3zIN1i390joEcWbbq2lEOHhXMbqplBLfG3SD7Gn+0anr4jkoPd2gwnoMEaZyMG8yla
         79QJeDtdsmbhvTN0aVi5ShWLg923FwOfwzsJscVxwTBck9XRvgDLMf1YBLIGIMtHLxp/
         2fx/3yU5USgbjMKAZuKyerFEXHn9DkEkkIQcxl7/VfGcrIpsxQUqsiMBkPIUbw5ELdWP
         LaEcasNOwwN6Hgwjt+9noUuQw6IjSIkKmqo07es5YJAW1c2FQFNg2FXnXV8QrSZU7KcI
         E/wqN9qZKk0nK7AO5t9fdLwAoMhU9MFxIRULSYgcApWN7dji4+sJeKwaQnjXe2jGwzNH
         ekoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQC4VQ4WPzHEK/K/bvUrrtdGhjy2EyWTwZNKtRp+iyw=;
        b=aI7dQTHKLZSAiZw4O9CbGznCINRuWTN4GPlNplYJ+h9y9vyeKZlDTBg/PW2MCFY0g/
         uFpGcLx7Fen3O8OXqJ8xDOQOYTR/Y2lj/vbxji0syO21q8ukiHYziHjwFUpfUMxPnxNR
         mpNKKn2MFLPNsaP616Zb+CAXnQrNs0lhKGMdu8m9gwmL/bwgjfUe6QoF1XvMg5Q8kISv
         ONccbye05wTvaC/ITUut3taL00wqK+KVRuhD/Uc2J2Ho/nTBE+B6Mxx9GWfTwa2tzx+K
         kbvNLgcg+ImFwgHRca9wGgBkTXFDWy0NJkgHCVGUANBi6Hrdf8DcT3i+1w2YfXueLdyB
         GxSA==
X-Gm-Message-State: AOAM530PMm++XTX/W+cVOkeFA2v1poVGxYrvprKy8U7bYnYcIrAKdTX9
        ezqwfEMYt1KKPwrHBKkz7Uq+1w==
X-Google-Smtp-Source: ABdhPJzt2aaYFVPwdsiueoPDpTiBXsJc2pSW2BEWEyPMk06DY6DCbjp2yLb2MuUyFpuwoIgosOJPOA==
X-Received: by 2002:adf:ed86:0:b0:20e:6f48:a194 with SMTP id c6-20020adfed86000000b0020e6f48a194mr48087877wro.290.1654005059022;
        Tue, 31 May 2022 06:50:59 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b00394351e35edsm2404806wms.26.2022.05.31.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 06:50:58 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 11/17] dt-bindings: phy: mediatek,dsi-phy: Add MT8365 SoC bindings
Date:   Tue, 31 May 2022 15:50:20 +0200
Message-Id: <20220531135026.238475-12-fparent@baylibre.com>
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
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 6e4d795f9b02..9c2a7345955d 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - mediatek,mt7623-mipi-tx
           - const: mediatek,mt2701-mipi-tx
+      - items:
+          - enum:
+              - mediatek,mt8365-mipi-tx
+          - const: mediatek,mt8183-mipi-tx
       - const: mediatek,mt2701-mipi-tx
       - const: mediatek,mt8173-mipi-tx
       - const: mediatek,mt8183-mipi-tx
-- 
2.36.1


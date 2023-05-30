Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D88A7164DD
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 May 2023 16:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbjE3OtL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 May 2023 10:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbjE3OtJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 May 2023 10:49:09 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A5EEC
        for <linux-watchdog@vger.kernel.org>; Tue, 30 May 2023 07:49:06 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af2ef0d0daso46807441fa.2
        for <linux-watchdog@vger.kernel.org>; Tue, 30 May 2023 07:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458145; x=1688050145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYFfkWfA3QoQgVvoKYaWNHgXlyKDc3MLd+zuCLSKJyA=;
        b=cNmu0nPgKOyLJPsM0EDcisLnunATo7htMuua8fjjb2dhKb/bdEMfj0asRSzmGsuh7P
         44j7Vq1bzp6YWznZJLTZKq9bX9Z3Y91EY6efqTnbDcYlS+17WXOfAJyDYBBeO0P2PLpY
         Ew5/3U+6ptw6SD59IJt1h2M8GgCyLrFIuSdA0ZRwApWRnnHYfCd3qwfbTFeLjA8jUcob
         zagphslihs9ef2gj/4YWtdblbVQEHcZE+ZmFnDSeLxgPfiZfYLR2qh68RjdNaRYaKsgo
         ydoZ+VXgm0D+DG+h+FoHCLSaTTFTZyv5Wjgaee+3q2hGOMaZfSi14hWdrFXBSP52xi4+
         P6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458145; x=1688050145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYFfkWfA3QoQgVvoKYaWNHgXlyKDc3MLd+zuCLSKJyA=;
        b=KutGHuaEkmeoMt4BaacKwLoZPMqpPNKd3FrKnU72PYftg2BfWuf7ZChi3MDgEVCqOw
         Nk8s31dSYwsmyiyFA479zZPQLFgcAF6wEHGGlqhxz2bOgp1b1Bz8WqwDGUUszwNQA2ld
         VFOfReiwT4kUS8dAImwSwf66DRHNH5UbS04YHCp2IUisb/3AY7Myd2UQsO56nEpOsM/L
         6T6eV98JMQ71QcVVtZtGBZ//3vxO74i7J6oSHfmjqisAWyPXf2zm89JOEp6jKYmpUoab
         5JrwWYNOjENB7y5k5mXv3OOxMrNdKmj1AbXQH7xauSJ7Aw+1QR4Em2El2pPcXyxd/7Ol
         LeMQ==
X-Gm-Message-State: AC+VfDzdPlll+KPEl+PBTNMSpesLG6NPnCcJbUlKCTg3sn8xy5m0Ow2a
        LbgC+24xM44XlT2ukIpV+S2ZiA==
X-Google-Smtp-Source: ACHHUZ5jvz5LnAumNP/2xr9PcMdbMsGITdxeArnebJmxulNAPz1T+umYnd5f3D0F0Ae9rFUUNWklSw==
X-Received: by 2002:a05:651c:87:b0:2af:1fd4:9011 with SMTP id 7-20020a05651c008700b002af1fd49011mr906793ljq.34.1685458144944;
        Tue, 30 May 2023 07:49:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:04 -0700 (PDT)
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
Subject: [PATCH 3/7] dt-bindings: rtc: restrict node name suffixes
Date:   Tue, 30 May 2023 16:48:47 +0200
Message-Id: <20230530144851.92059-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 Documentation/devicetree/bindings/rtc/rtc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index c6fff5486fe6..efb66df82782 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -15,7 +15,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^rtc(@.*|-[0-9a-f])*$"
+    pattern: "^rtc(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   aux-voltage-chargeable:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.34.1


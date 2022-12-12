Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D666C64A639
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Dec 2022 18:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbiLLRux (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Dec 2022 12:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232697AbiLLRuv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Dec 2022 12:50:51 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0C1F01F
        for <linux-watchdog@vger.kernel.org>; Mon, 12 Dec 2022 09:50:50 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id c1so685506lfi.7
        for <linux-watchdog@vger.kernel.org>; Mon, 12 Dec 2022 09:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wvsMVvtThL8gMv7LQ3fpmievE9cnCujmolAZoIZFwM0=;
        b=p7hlMr7wM3wyuA9xtFlMfUZP4AXHjSiNRsW14oK0LRr8bGQ7wMzch9VO83Cl6nSrlo
         sLVcnRMsi6l7+x6uxr0I2uwvRvTAjItkiYxSBTNOS45zuoRMRhynjnNeFpboAwdsV2N1
         eaD2TT7VByDxJqP71GAwWwc4b0nbZqYjw40s04lDRyETX5hVzyhiIsd0jIVfXyKKnSYj
         OtGg535FPBztb1Tq92x7ir3gpuV2mor9kQsGLgV7rBdEuEpU4t3O3XafJD06ibu1BMTi
         1dVKdONoBxtusBQPtFzVR78DTHDFK6Tqs7mytgM+/hlqwu+565pTulNWNvj41egQjWLr
         N1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvsMVvtThL8gMv7LQ3fpmievE9cnCujmolAZoIZFwM0=;
        b=KXQYCh2GjG2tYEP8Swjjmv0MwaAaqLUnYJrnVKNFAsMlLoITJttnqSZkzIni6K3Kif
         TxaeJLKTccL4r9yleCvolYXotfMn8l9iTaR+8tbv4FxqfJuFpEz/PwDS59yRb8umH/CS
         FACBuAfSGrQfiGcFPp3nfK+SV66rbwFm9rZX874H0qufW08qQVk19P0zpamwRMS2eUtg
         8rHeMNn2JCvfKRABFsu6NjbXVp+mcdc90bN1nYsMnrYd0ipL5HmgokIT6xBZuk9vOSi4
         CccE/G/isNOzoepi6kHQ6x/RY/KV+HKj2daVkmU6dKdeqXBiXnDKYKGCz0kTDZMMQdzf
         Xz7A==
X-Gm-Message-State: ANoB5pn/yBFiplHxt13BgDqrrjJ7943nF8C0SK07lzFAigwV6kAQvGWc
        TppPH/HhO738TXYouoZeyCR/kQ==
X-Google-Smtp-Source: AA0mqf5yozzf2suKwfpmYDJ9vwovvz+x2ktVmjITNkA6+gE4JaNy2k72UkVw3K+6fJbUSI7duKqHmg==
X-Received: by 2002:a05:6512:21b:b0:4b5:5098:e6f7 with SMTP id a27-20020a056512021b00b004b55098e6f7mr3642514lfo.68.1670867448686;
        Mon, 12 Dec 2022 09:50:48 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j6-20020ac25506000000b004b53eb60e3csm44094lfk.256.2022.12.12.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 09:50:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: allow "timer" as node name
Date:   Mon, 12 Dec 2022 18:49:33 +0100
Message-Id: <20221212174933.208900-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On some SoCs the watchdog device is actually mixed with timer, e.g.
the qcom,msm-timer on older Qualcomm SoCs where this is actually one
hardware block responsible for both system timer and watchdog.

Allow calling such device nodes as "timer".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

See also:
https://lore.kernel.org/linux-arm-msm/20221212163532.142533-1-krzysztof.kozlowski@linaro.org/T/#t

which causes warnings:

qcom-msm8960-cdp.dtb: timer@200a000: $nodename:0: 'timer@200a000' does not match '^watchdog(@.*|-[0-9a-f])?$'
  From schema: Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
---
 Documentation/devicetree/bindings/watchdog/watchdog.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
index e3dfb02f0ca5..b1daefec86af 100644
--- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
@@ -14,9 +14,14 @@ description: |
   This document describes generic bindings which can be used to
   describe watchdog devices in a device tree.
 
+select:
+  properties:
+    $nodename:
+      pattern: "^watchdog(@.*|-[0-9a-f])?$"
+
 properties:
   $nodename:
-    pattern: "^watchdog(@.*|-[0-9a-f])?$"
+    pattern: "^(timer|watchdog)(@.*|-[0-9a-f])?$"
 
   timeout-sec:
     description:
-- 
2.34.1


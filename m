Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46C67BA44F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Oct 2023 18:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237132AbjJEQFL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Oct 2023 12:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237034AbjJEQDt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:49 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD2D8682F
        for <linux-watchdog@vger.kernel.org>; Thu,  5 Oct 2023 08:57:31 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so1155113f8f.1
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Oct 2023 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521449; x=1697126249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WotVRIx4IfQWLl7bsIqhgSrhHJCYtM2efkzCcXjlJ0=;
        b=fKN0FNxZQsnaKhU8KpZohEQIexiyaLjkt2O8JHVuY7/rXBtmgp3DFt7ZxA0wRpyq5b
         AuEruZGCxhuOFpECFlxMjvVYAxLQfeUWE/RB86KG13uiKAQYpWJ76kTIVA2MytD/TlnV
         1nRdb/Y9JepnHmfTfIxzx9TJlhQRXRoq11GNI1fK59ETXEI4RIzTHSG9PSH6GS5K+ekz
         u0YLO8grA92CM82ZjQ4HEfd0Hw0ArC28hrC9XdFCkqR2t3OQuMCJfyvFs9ZsQu3RH9n6
         U6LSF1g+6XbMis2C9W7lVPCGzxoOrTEsVEL0CX80rtx/5ctxE/LPwqra+9vOh9w7EDLA
         C1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521449; x=1697126249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WotVRIx4IfQWLl7bsIqhgSrhHJCYtM2efkzCcXjlJ0=;
        b=p9+A+LSMeD2lFXdUfpsx6am6JyK+4i93OuRdQfY2OTmjivbdzbF9sWiBMPlIu1Kzwq
         plMmAI8M+Df4Ph+oTNNpgjXtilZ/Gaf7KnpNeFmlteDXYdOv92tZmiCmt3BpHvZEH39z
         e99yetFyZrghWUad1pf89umFQucoADLrEHQG0iM0ezn60iIksrAd1b7zBlcM4yoogYJx
         z/2N0XVp/N2RrEc1IN+ex8rVXsA/Gx4DnNte++d8icKYN5xt/3DKIQDKJW0GikiDB9nf
         sySRSMG7EDi/SEoZBnQEbkbPY79blRxKGPZifBvQphWQe+IwdJWloSVt8PxGlxlAdLuq
         BMlA==
X-Gm-Message-State: AOJu0Yz94NQ1ASF1sdkvv174ghACGZcYxg8NC9DckZIj4/HHZiYufZ70
        osn/Vl0FEJo1NjK10RfS4oEU5A==
X-Google-Smtp-Source: AGHT+IHb0s500PrFGOrLeuuBwpGQ7OFg+clB+5dsL7CoXu4v4IuKDCuex94QNDTzGTMDp0JcDuLSUg==
X-Received: by 2002:adf:cc81:0:b0:321:5971:23a5 with SMTP id p1-20020adfcc81000000b00321597123a5mr5355332wrj.20.1696521449677;
        Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 07/21] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date:   Thu,  5 Oct 2023 16:56:04 +0100
Message-ID: <20231005155618.700312-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..e0f37f8ae8e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,11 +54,13 @@ properties:
       - samsung,exynos850-pinctrl
       - samsung,exynosautov9-pinctrl
       - tesla,fsd-pinctrl
+      - google,gs101-pinctrl
 
   interrupts:
     description:
       Required for GPIO banks supporting external GPIO interrupts.
-    maxItems: 1
+    minItems: 1
+    maxItems: 50
 
   power-domains:
     maxItems: 1
-- 
2.42.0.582.g8ccd20d70d-goog


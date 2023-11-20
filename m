Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3167F1EC5
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Nov 2023 22:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjKTVV2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Nov 2023 16:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjKTVVU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:20 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C70DC
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:15 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c8769edd9fso28777691fa.0
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515273; x=1701120073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPrhMgiNguGxrbIvdeLHcyqlQe/MyMdJk9mAGos3v4M=;
        b=BBT4hRcWaWp7id2y9wcT4oUFb86mPb/R4ViiYjxTlaeOwhbc+lto7Z8oyi7NQjNz/N
         eaA3h0dDzebMxLFmqde2gXVq9a06OmuMyCTjh6koO2gYiWyqKdiOzmL+f/AWmtiyGbLw
         lpNeqC3Crtmu0vDGAc0FXUCElaMvIyQfsQhfaJIduHt89OeFx9bLHNPq1sH/xFXju7x+
         N9oMxfnfke61FCHT8g2j03GSqV9HUKb6FWFWSRHGBzDdOavrtAMTwr4Z5F/zcYwRVY4S
         2BGPLh9sB3nkz9BPBAdNhMhiEX1iPtVqNucrupjcMMxPWFhpPxwRx2SJ+DjJxEEB+CX5
         EMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515273; x=1701120073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPrhMgiNguGxrbIvdeLHcyqlQe/MyMdJk9mAGos3v4M=;
        b=AZyY6Zxc8XcSyC61xCqX3/GjrS2PB551gjqEDL1pMy5mmeh+qkkvHqjpBio40lRH6F
         7RFb4k3kvAw4w9WwtCe7+t23CLX1UibNojNBK7kNuYMagvp9/Q6S8mToHv0lpPWEuInD
         xcnqlRz7kBenWI2dO/7UbL5QhCMK60tTWSiVesYO+QEc9Uet0UkNafSiddNZ4LREw/wa
         7AXwqbRWCwCvZZRcvVv6vzPXWZ0eqM2qHebCJtG5vy1mhtCWikR1R+kdz8ONZ7IfKJ1Z
         FNrQs5yKuq/0c6IHFeDT5xG5450+EkAtynl/dujw6a1LScbxYEPbAvMUm1ge9yErA07V
         OAkQ==
X-Gm-Message-State: AOJu0YwmkqKPSv9SKjzrVOflpvSA27ICS7+dMxOyOfQpzszLq6AfcVXt
        ZFVHHv8jR7kFNq99rA5ejh7kNQ==
X-Google-Smtp-Source: AGHT+IE/JKzpTwMnQTxuReZhJ11l4AHB9TdiKw1LttbX0YcLxLFVDCxuFEkk2KCs0cS0JmaV5wy8gQ==
X-Received: by 2002:a2e:81cf:0:b0:2b6:a804:4cc with SMTP id s15-20020a2e81cf000000b002b6a80404ccmr4975927ljg.53.1700515273249;
        Mon, 20 Nov 2023 13:21:13 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:12 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 05/19] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date:   Mon, 20 Nov 2023 21:20:23 +0000
Message-ID: <20231120212037.911774-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/google.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..0e987fecb2cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/google.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor platforms
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
+  devices.
+
+  Currently upstream this is devices using "gs101" SoC which is found in Pixel
+  6, Pixel 6 Pro and Pixel 6a.
+
+  Google have a few different names for the SoC.
+  - Marketing name ("Tensor")
+  - Codename ("Whitechapel")
+  - SoC ID ("gs101")
+  - Die ID ("S5P9845");
+
+  Likewise there are a couple of names for the actual device
+  - Marketing name ("Pixel 6")
+  - Codename ("Oriole")
+
+  Devicetrees should use the lowercased SoC ID and lowercased board codename.
+  e.g. gs101 and gs101-oriole
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Google Pixel 6 / Oriole
+        items:
+          - enum:
+              - google,gs101-oriole
+          - const: google,gs101
+
+additionalProperties: true
+
+...
-- 
2.43.0.rc1.413.gea7ed67945-goog


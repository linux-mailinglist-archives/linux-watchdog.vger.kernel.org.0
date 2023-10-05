Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 826377BA4B5
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Oct 2023 18:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236560AbjJEQKt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Oct 2023 12:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238722AbjJEQKA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Oct 2023 12:10:00 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B023E85DAA
        for <linux-watchdog@vger.kernel.org>; Thu,  5 Oct 2023 08:57:29 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so9955315e9.2
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521448; x=1697126248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMWnJU8MsW38YqwezPXC42C6b/YrhBHi3/ZxSDJgFAQ=;
        b=EuT6SeXl8O87yIT6gGd/t4GMSiDJVxyJV0+GlwI+qknSf22O+r1szlTGz3AsB6S727
         piWP5sVc4scD39t2JxilQdHg5uA8/ti+LM4TKhgAdxPqlvEhMkQBFk+AXrx7nU7L0mrZ
         vZzl/umboZSChsG1CxmzOhOVzkMQVZ460bcftFrBYlggKtswZf9e4ahNUoc7W1CFvodw
         mOtolivfM/UXBmJXp/V83p8JxVix3YmFg2qWH+2yb3ensMKCfXT4xJ+DNRkqSqP9ESiL
         etqaxW5yjBxilnX7g8aS6/ge+KrNChoMSZbx+GE00I+dTXSeVWZUMGExfB/KjHOGCKeO
         LkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521448; x=1697126248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMWnJU8MsW38YqwezPXC42C6b/YrhBHi3/ZxSDJgFAQ=;
        b=P2nf0aYttbe09hE195Sh6gWdozqmzLQjFz/UHi+ncYhteuWKE9GiPDLxxTO7viDozL
         4Zt4Pqzco2EdlMCfw0bixkKaUU8w5vXy6eu+6zPzT2sLedXvqJoacqeetAS9D7VP/7FW
         s6Uw6Hv3z5poRDemk0CHRG7lyjObEmpwkzyRD8zlt/OmRqqfQJbbzMCvhKYFhCDlavZm
         747e7rglyk5Yjvu/THXXGbPC6vaqO3NLs1aKD+DDbOhOsDc+I+NQvcCeaA/x8gqLWszG
         sP3JljZD1ZZkxenSdacDaKIWVTppekBiqTjlkNocq4zMSzt9f+CQS08tv/+xAO4H6wT5
         J7JQ==
X-Gm-Message-State: AOJu0YwpjSdPf2TY3gDair1zAJfHKUquwSedFlhUx+xM26Gj5mq8bjWR
        VSWUdWBubfckVnAS9ZtYIs4BO+YRSuWzilGziL0=
X-Google-Smtp-Source: AGHT+IElw6k3YNkDW9u8nFOA5PsXxz5xE+xMGpuB2fgKZPK0gtuloOqBwjzaNH/QHLmyKFBNlfOM0g==
X-Received: by 2002:a5d:4286:0:b0:321:651b:4651 with SMTP id k6-20020a5d4286000000b00321651b4651mr5358186wrq.29.1696521448129;
        Thu, 05 Oct 2023 08:57:28 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:27 -0700 (PDT)
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
Subject: [PATCH 06/21] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date:   Thu,  5 Oct 2023 16:56:03 +0100
Message-ID: <20231005155618.700312-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..3759d423d9cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,46 @@
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
+  ARM platforms using SoCs designed by Google branded "Tensor"
+  used in Pixel devices.
+
+  Currently upstream this is devices using "gs101" SoC which
+  is found in Pixel 6, Pixel 6 Pro and Pixel 6a.
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
+  Devicetrees should use the lowercased SoC ID and lowercased
+  board codename. e.g. gs101 and gs101-oriole
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
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
2.42.0.582.g8ccd20d70d-goog


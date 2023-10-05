Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056657BA456
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Oct 2023 18:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237396AbjJEQFM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Oct 2023 12:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237402AbjJEQEC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Oct 2023 12:04:02 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B271187D57
        for <linux-watchdog@vger.kernel.org>; Thu,  5 Oct 2023 08:57:50 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-405361bb94eso11275055e9.0
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Oct 2023 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521469; x=1697126269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nur27tW19rRSdA+inDic0S7r9ItKpgvMyVV6vQ9tmEQ=;
        b=NwLW4KuEOU2iIlsbxy/MPv+8j1gBuhnuDvFRkD4CaYdCV1oVEqtJiJpinLOz85T7LO
         TH2LMzoJkoNeJuDaMjwJvb3wusonefiBzet6SfToN/SoxisM8dWqAJUIsxbvTeZEpxn0
         5IYKqn5EckSXHHpPuugQWfzRxm4ubdn6J9shR6xE4K0a9w8VvQVJrmXNZRcdMWEsIj2G
         kRQEz5G58tz8BcAUBcBg9H8OMz5LqfSJdDRzki6iaD6Ca153vQFiME3t5cbpZ8qJSDU8
         OJOSfb3jxh4z9lWQm3tbN7RoBCpgJvsVZgGZ1dPtv6YKp09pLpu1357SVVlv88Q0HrbZ
         drTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521469; x=1697126269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nur27tW19rRSdA+inDic0S7r9ItKpgvMyVV6vQ9tmEQ=;
        b=lqFymckaK+zGwEPfBMUPP29iiYnCYgbgwe/0kdBDU3BTPP821W1z6maixY3N9VReoJ
         lyHTpugv30ppCt6dFScQtWa1ltkZKDzggVEj5T6qMASd5kT6LrGGc4zk2vfZi7vtDiHw
         DCep3zbda6SBZpmRsUUA98OjLdxaYa6CCnHB2NIFaEcsZqMvDqSn9eCvQezsbwTBP2Jz
         5pT0ygG22pXps+6aJRzYE2nKCiMTfBDN/Z8P2f+1TjqRoU+dEir4H8kay83Bqv1185uv
         zfwgjERNP8lksLzVjsaOSDxooNbPWUBB1Rc6Gv3gqfL5nd3s0nl9huPh+SaJyUa5xmc/
         2P8A==
X-Gm-Message-State: AOJu0YwJqco9czUUNANPCtCXnJdsjksdFjBrkmSxqzubmJkzWkTMS4DD
        kaxdxKmwrwR2ZF7VJRY9URpxjw==
X-Google-Smtp-Source: AGHT+IF0KkpCw7exE287U3x0Way1lMxqQVtTi1YA1LDZ0OBcnwTpgIQbWiSTzafiHowqawG63A3wkQ==
X-Received: by 2002:adf:f1c6:0:b0:323:3b5f:3564 with SMTP id z6-20020adff1c6000000b003233b5f3564mr5295468wro.10.1696521469054;
        Thu, 05 Oct 2023 08:57:49 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:48 -0700 (PDT)
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
Subject: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
Date:   Thu,  5 Oct 2023 16:56:16 +0100
Message-ID: <20231005155618.700312-20-peter.griffin@linaro.org>
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

The LK bootloader on Pixel6 searches for a dt overlay in the
dtbo partition with a board_id and board_rev that matches
what is baked into the device. If this overlay is not present
then the phone will bootloop in fastboot and you can't boot
the upstream kernel.

This commit adds a dtbo for the production oriole variant.
The other pre-production board overlays are not included
at this time.

Adding the dtbo here allows for a better experience when
building/booting the upstream kernel on Pixel devices
as all the DT required to boot the device will be created
as part of the kernel build process. Rather than having to
fetch the dtbo from some other repo.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/google/Makefile          |  1 +
 arch/arm64/boot/dts/google/gs101-oriole.dtso | 21 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso

diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
index 6d2026a767d4..3f1761f8daa9 100644
--- a/arch/arm64/boot/dts/google/Makefile
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -2,5 +2,6 @@
 
 dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
 	gs101-oriole.dtb \
+	gs101-oriole.dtbo
 
 
diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dtso b/arch/arm64/boot/dts/google/gs101-oriole.dtso
new file mode 100644
index 000000000000..50832fd94204
--- /dev/null
+++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Oriole DVT Device Tree
+ *
+ * Copyright 2021-2023 Google,LLC
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	board_id = <0x20304>;
+	board_rev = <0x10000>;
+	fragment@boardbase {
+		target-path="/";
+		__overlay__ {
+			model = "Oriole DVT";
+			compatible = "google,gs101-oriole";
+		};
+	};
+};
-- 
2.42.0.582.g8ccd20d70d-goog


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325DE7BA444
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Oct 2023 18:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237400AbjJEQFJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Oct 2023 12:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237129AbjJEQDy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:54 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE56B8720D
        for <linux-watchdog@vger.kernel.org>; Thu,  5 Oct 2023 08:57:35 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1065886f8f.0
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Oct 2023 08:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521454; x=1697126254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsPPxazWNR9GZX2GO53uCm+7icHkcSZjslvI+J0YBFw=;
        b=EwOD+6J0I/hVtzmo8eIP//TELnGESExaG2DEoAn2tjWKiMCMMIPVrJiiT+owqZvMqZ
         wDp0cCfTPHxrPPNFMXXqSzRZRCWjOvoZX3/pY6WQtJ1avgm9jSYg003W+3KhjqQ0qcpl
         G3aDWiMUhNAk65oqPqn5wJXi1zCzCW0hq2rCNNAlAB/YmoI81eBr6A3+o3P1pB9+vM/i
         hWAWgSk4yWoURHpqXER7twOBWQ+FrfhDd7t6/s54VPVZWJVqv5UvIotW86X90K8Kf3MH
         SWsAguFBJSoYMyR5cNGDaMm9hhp35BOHoBmkJCjbCp5KuFRRNciW2MUVBFdveEXdciwe
         GP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521454; x=1697126254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsPPxazWNR9GZX2GO53uCm+7icHkcSZjslvI+J0YBFw=;
        b=tp3nNRB5YNiBMWTmHCx+Jsj7bb0rWcoR2hh6vFY85+99hgOHH5DPLPeRZ34xmPUMMb
         zuIHUrbcTISaDoGoTcOHmBamwy9kAf7DmsZr8ZcDpyT6XUWTWlEABjPPAazbG9ZEoeX6
         +liu5MOIgsvTQcEXMSh1zQ5hTkWrSX1ZvsRjqtwNPexOKDH4WlfMgiTIU7CGuOON1ADo
         VnBzJHTSNiO3tzMdOmLS3qAb6sDE3KvF51IwuaZftiT6s8VR6OwQbuoST4hd0Fv2tSba
         VaaIqm8vftm+SD/rucq0hzithN+FYO4kRmXt2htt4hBl5EUyTZaNm+wcUgP91/gkUrHO
         OVRw==
X-Gm-Message-State: AOJu0YwD6XlzYgT6tHoP+4Hl7/JklMxNWFyd5zhTGib0CKBMQdhYwMld
        SaQksSazVZvt6SjcoL5oD9jpSQ==
X-Google-Smtp-Source: AGHT+IHUyJpuQbW68qjMruXib/ii+3Nwgybhtbaupq7BnOuixwUEbyhlm+DL6/M5TMqX57BaO4ziFQ==
X-Received: by 2002:adf:e406:0:b0:31a:e6c2:7705 with SMTP id g6-20020adfe406000000b0031ae6c27705mr4915179wrm.50.1696521454330;
        Thu, 05 Oct 2023 08:57:34 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:33 -0700 (PDT)
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
Subject: [PATCH 10/21] dt-bindings: clock: gs101: Add cmu_apm clock indices
Date:   Thu,  5 Oct 2023 16:56:07 +0100
Message-ID: <20231005155618.700312-11-peter.griffin@linaro.org>
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

CMU_APM generates clocks for the Active Power Management
controller. Add clock indices for those muxs, dividers and
gates.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 include/dt-bindings/clock/gs101.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/dt-bindings/clock/gs101.h b/include/dt-bindings/clock/gs101.h
index d1e216a33aeb..d9b8299fcc0b 100644
--- a/include/dt-bindings/clock/gs101.h
+++ b/include/dt-bindings/clock/gs101.h
@@ -201,4 +201,21 @@
 #define CLK_GOUT_BO_BUS			184
 #define CLK_GOUT_CMU_BOOST		185
 
+/* CMU_APM */
+
+#define CLK_MOUT_APM_FUNC					1
+#define CLK_MOUT_APM_FUNCSRC					2
+#define CLK_DOUT_APM_BOOST					3
+#define CLK_DOUT_APM_USI0_UART					4
+#define CLK_DOUT_APM_USI0_USI					5
+#define CLK_DOUT_APM_USI1_UART					6
+#define CLK_GOUT_APM_FUNC					7
+#define CLK_GOUT_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK	8
+#define CLK_GOUT_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK	9
+#define CLK_GOUT_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK		10
+#define CLK_GOUT_APM_UID_SYSREG_APM_IPCLKPORT_PCLK		11
+#define CLK_APM_PLL_DIV2_APM					12
+#define CLK_APM_PLL_DIV4_APM					13
+#define CLK_APM_PLL_DIV16_APM					14
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.42.0.582.g8ccd20d70d-goog


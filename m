Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 617BE7107A1
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 May 2023 10:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240300AbjEYIfM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 May 2023 04:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240317AbjEYIez (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 May 2023 04:34:55 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01173E73
        for <linux-watchdog@vger.kernel.org>; Thu, 25 May 2023 01:34:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30957dd7640so1223091f8f.3
        for <linux-watchdog@vger.kernel.org>; Thu, 25 May 2023 01:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685003645; x=1687595645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRBwEvfGQIrh+pVMdhdSvf8KI6OxPqchD4EYbezjkwM=;
        b=LlvJ9cdbMMkkz0SdtzRChzXK+JPc/QEtnzQ6LXT+MEYP8Q+rhhivrdbGHE90+Tjnqw
         x4VCFspM+/fAGxa597+fTZrBuOnw5gS1YN3f8Oaqzvip0qIrfzORTcf/KUI8xlzAUjG1
         2Pv7cTYsLyNEZxrloY6BXVaRGfzIBNMGB5ETcspuxanhDsr12nwy9HEE5NkWkNzel7Zu
         xxtxURRTrhBE6gcuInvEdK7e747WbabDDvn9xv3ifqYhCH1FfCMoRcwamjo6n04nO7rg
         txdifvtj0NgNz3b4aJuoWYHl+YrnJfXJNjdrwdCJ309zDfBMZEKsFczcgYtCnTrnu75O
         BvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003645; x=1687595645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRBwEvfGQIrh+pVMdhdSvf8KI6OxPqchD4EYbezjkwM=;
        b=QoY2ZOhjk7Vpj1CztgC0NDyhwPd/rZhzbG2rKj5f0PoMdqaV2mJ+PlOfucQlNwDKOF
         mmeg/vuVHGkKT6L12AkaDHQFLXPQ6ITQP6Cg7nDNyAHat1w1/KDqV7a4Fx7miTdOK8XV
         0JhX6dGgAS64ydpSQIueUBWZDBZ57A5WPtqtDa4mzVmzEw181xatFGgmZwf/etfO3Pew
         YMUD+J3P1pbVYG9FZ9fps6j8noskS2m5aeYvQg7F8dt/bSuca5YcuZjEF+nsTTuVO1KM
         8cMurXGWTxJKZeaBYcjh7jy/HoG6FgXd4SvC9mwBe42TzgWJUy2tpQYFYD/vq2Ro0BR3
         mNdA==
X-Gm-Message-State: AC+VfDxeoxoQUK5dfIjPBgs+L4egthWIbXoQJ9eM4aRGWUqlhNWEzSwq
        8fit3cfXPMDzkq8sojYU/znaXg==
X-Google-Smtp-Source: ACHHUZ4jPcDlm5Oe7/D1Pyf9jOshwayKovAkNLACHESXsWad5CTPI20Ibmfy3F9fav5hkIRXQLtzTA==
X-Received: by 2002:a5d:404a:0:b0:307:a075:2709 with SMTP id w10-20020a5d404a000000b00307a0752709mr1682576wrp.68.1685003645432;
        Thu, 25 May 2023 01:34:05 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o3-20020a5d6843000000b003095a329e90sm945809wrw.97.2023.05.25.01.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:34:05 -0700 (PDT)
From:   amergnat@baylibre.com
Date:   Thu, 25 May 2023 10:33:19 +0200
Subject: [PATCH v8 10/10] arm64: dts: mediatek: Add CPU Idle support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v8-10-7019f3fd0adf@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vYzOQ2oc5j6ZLGT/M6bLKTIS/chNEplrOLaJKWbM7ds=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkbx1vwwfm1FE2tPgSwzNRmNwwkLok2bisOz/1j0Ht
 xM5kYK2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG8dbwAKCRArRkmdfjHURe6hEA
 CtgM2LWXjgPP5/TBAZ/A8Jg3uvPT49uwSr9+u5wdaLwvCpQcJDlemVP91cnOgJk0yEdYZaaU3TlWiC
 EX1+LeulD9lSiUFaxAdUf1Qrzq6D0rKDJt+9x1uBQ+2JtNRXbHh30eed7kKhXwGcK1jaszwqAY17FP
 LyC+bCmz9eL0Nc8LCMe8yB0zdVio/buNBKl33CRRC8uuTvnL2sUaBWTSwlB0Wsbxh1oTrfs2jaUN/C
 OK1cnqEmduCuFVrqzzxIy5DmWegN1lk6GrgVwcgdYYwb1VNrEIppclJ1+QBV5txM0sZKVRkO2dQRWG
 l+Y/BzsztEFNmgGj06H/2FX2ZWKpT+HEiZd/qZuETguOYQU4Ot1+Z3ybwEe6byMooYgDISpleqy0Kp
 ggiNz5KChGAkv+U4Z5C+mllOzr4QCXtnSQDP6wjMDJqVQdG2sn6H1rxOaAuDK76IRNRWKAMEtxuZ0d
 ofjZ8GA/1lNQIyRKM/Nou6cCQonCwUyCc9DGcFon1u+JAgyUdp4R5xidFjLKryztcbtLDoVwAB4hhj
 jzfwzhn3+ryEwoICdjNgF5tSojag6QuyHGVnQd9njGabSWQwTOEQa35a15FzyuGddZu0t5HbX6ierO
 B8STaKWzGY9v+88nceQrS/WZITiPlzzotX21Hylm0PCQc1jZ4uXUtd1deg1g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Amjad Ouled-Ameur <aouledameur@baylibre.com>

MT8365 has 3 CPU Idle states:
- MCDI_CPU. (Multi-Core-Deep-Idle)
- MCDI_CLUSTER.
- DPIDLE. (Deep-Idle)

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index cfe0c67ad61f..413496c92069 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -128,6 +128,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -147,6 +148,7 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -166,6 +168,7 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -185,6 +188,7 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -198,6 +202,37 @@ cpu3: cpu@3 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			CPU_MCDI: cpu-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x00010001>;
+				entry-latency-us = <300>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+
+			CLUSTER_MCDI: cluster-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <350>;
+				exit-latency-us = <250>;
+				min-residency-us = <1200>;
+			};
+
+			CLUSTER_DPIDLE: cluster-dpidle {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010004>;
+				entry-latency-us = <300>;
+				exit-latency-us = <800>;
+				min-residency-us = <3300>;
+			};
+		};
+
 		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;

-- 
2.25.1


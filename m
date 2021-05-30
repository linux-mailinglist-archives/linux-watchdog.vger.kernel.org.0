Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74E6394FF7
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 09:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhE3H2v (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 03:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbhE3H2t (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 03:28:49 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09FAC061574;
        Sun, 30 May 2021 00:27:09 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id n4so7535399wrw.3;
        Sun, 30 May 2021 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqTv+TFAOMBiEQMLXRI7rx6F3LpfuebvVaCG8zYT/N8=;
        b=t3XOZQ0+GPBHMvc7jKJ8+B5qJmp/hejArOvrKUIw76PRgRmsGHr1xHHCdcAuiTUoSW
         oImLysP4I+2u7smPG7iKmW2WrN2lERvYmUdBhKUYYhdSiQsoLg0IqL2GB+IYMsofB//Y
         orsO+64lBcObe1XdOAH6L+zsyDBfYWnhIJSNGDblFnujLV3DgxA6XsX9UjIeZ84+z5Ir
         p6jKrFF1UHI8eN+V3ZuIMxllX4sEDIdkLUXhwOq6pIG7qDilhObsolSedYuQ1LeeMcKv
         gcH7oiu7jcZplPVEvxdB4PHf9vT6ounW2djTC290B48esvXXx4h+MPsGf7+qgog7Fk2U
         ELhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqTv+TFAOMBiEQMLXRI7rx6F3LpfuebvVaCG8zYT/N8=;
        b=egiVn49c297uIZ3e503DwYaMbUzXFUJpEn2WDFMsEV4PbzItZCReNQcjZlkx8jBWct
         aiMUlZyPTnUPrJryxwgCZ7AmN63RUCNDMhtFG0Prpg0LOkr8Jawhf9cuExM7rVfJYO4S
         j9MJC8XQBqhICoiORWJsjyEsoLt7/AWBCDrII+Mj134joV+vmAkLIDyCuLSae8SyfUDC
         O7YFBJcTiJVWdohfHmy5J3rXAtWYCzCJobqIPtn5JJF19/xvGRL6BkqUJ05F6clliBSw
         1SpCN+URY48oI0Y5U4Z2JR68+990nG0h/9G7PC49RUnBQzVjFM7d8KWO9cHDJG0cyToE
         Erpg==
X-Gm-Message-State: AOAM530axOUnaZok95swXR2QWDosQMw1FAcVwU1YMG4j5mbySLy6j7/h
        5HaOlsgbCNzGZbaOZtChhxtvzAnVAAg=
X-Google-Smtp-Source: ABdhPJycgQu9cG1MwDFjSHOPKfw74miis8053epUTviXFreI7IyYvT+4JMmX6yYXeboUH6GojL5xKg==
X-Received: by 2002:adf:82ee:: with SMTP id 101mr10144233wrc.137.1622359628314;
        Sun, 30 May 2021 00:27:08 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id h14sm23841045wmb.1.2021.05.30.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 00:27:07 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ARM: dts: mstar: Add watchdog device_node definition
Date:   Sun, 30 May 2021 09:26:45 +0200
Message-Id: <20210530072645.10379-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530072645.10379-1-romain.perier@gmail.com>
References: <20210530072645.10379-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the definition of both an oscillator at 12Mhz required by the
the watchdog and the watchdog device_node.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 3d5d8c634de3..23dff8fe4731 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -62,6 +62,14 @@ rtc_xtal: rtc_xtal {
 			clock-frequency = <32768>;
 			status = "disabled";
 		};
+
+		xtal_div2: xtal_div2 {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&xtal>;
+			clock-div = <2>;
+			clock-mult = <1>;
+		};
 	};
 
 	soc: soc {
@@ -119,6 +127,12 @@ pm_irin_pins: pm_irin {
 				};
 			};
 
+			watchdog: watchdog@6000 {
+				compatible = "mstar,msc313e-wdt";
+				reg = <0x6000 0x1f>;
+				clocks = <&xtal_div2>;
+			};
+
 			intc_fiq: interrupt-controller@201310 {
 				compatible = "mstar,mst-intc";
 				reg = <0x201310 0x40>;
-- 
2.30.2


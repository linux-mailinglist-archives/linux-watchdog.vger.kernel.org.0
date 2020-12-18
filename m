Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E172DE26C
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgLRMGx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgLRMGw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:06:52 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC84C061257;
        Fri, 18 Dec 2020 04:05:50 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id b9so2903715ejy.0;
        Fri, 18 Dec 2020 04:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t6IawFaTxlXErq81LHg7H7iHtTYroJYDvrDaOnFY3WQ=;
        b=tCeKxpzidw4wpeNtTlUC2MsQrKtU5p+9l82IRzDxKn4wair0jV1sjajMvGZ6WVN5AB
         yD7+J8eHsOvfY4ZtcHKKOFR0Ezow9juDqPED5P761rzz4EdZgv8NGoDmW0Du+CnzcQn/
         zGil5FyGTrCjws/aBOs/ydL1E9lcoBLI3LkR+HjJ8X+dkffqeAU2FWlfhjKRgJh0u45A
         LUc6MgKxBefdOWgUbt+66pfWPOiRQNmEHteifIXNgR3lXbre7f0epVebu4mwC13PG3KX
         IIFvMz8Wx+78JI55vZkdliGLDiJzyx5pp0YfghI01mmWOKmlgbbVfR8oy+oH34PV/hEo
         TT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t6IawFaTxlXErq81LHg7H7iHtTYroJYDvrDaOnFY3WQ=;
        b=TxWLl7b55WSfxXcjcHLvUUL17NgfgBZk/NkrAuzy+RcBf5UF1J56kAEiOSY1KPmTKc
         Ph6oqewgSU92kN2YsypyLS5cEJGv7j3udfWzKdatiHeGHl2zYW5gFsLz51+mcMNCP2Al
         mGniONTHqFsNoR0i+S5RHKhjqDa1/B7pGcEv67pWshJDChFNSVrpf5sFvVs7w6O7yXH9
         sED2EaytSfWD+FxUiO06uekg0ki/exw2B7s+ZTvL15EwIpPBH/YUfYdYLn8Ed3EOvMqJ
         9XIjFGmf9cZd1ovKFmxbXx1sWibACvw+PEefrTDHiTkocq0GLzVUyK4qfuw2N0yFuNJ1
         o/Cw==
X-Gm-Message-State: AOAM532o/rnlHIAOv45jXf9KLZ+PW77AUqSpInA7l6uVwPLDVbNDOxZg
        x/mMcmw+RT/uHYw7UhLSYU0=
X-Google-Smtp-Source: ABdhPJzSar6uDlkcYSArlYr83CyBFBxNMlePA6gL9OekO8talCfdxAOiss9MicKjqUr6XHL/lK01WQ==
X-Received: by 2002:a17:906:9888:: with SMTP id zc8mr3646664ejb.42.1608293149321;
        Fri, 18 Dec 2020 04:05:49 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:48 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 5/8] arm64: dts: rockchip: add new watchdog compatible to rk3308.dtsi
Date:   Fri, 18 Dec 2020 13:05:31 +0100
Message-Id: <20201218120534.13788-5-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog compatible strings are suppose to be SoC orientated.
In the more recently added Rockchip rk3308.dtsi file only
the fallback string "snps,dw-wdt" is used, so add the new
compatible string:

"rockchip,rk3308-wdt", "snps,dw-wdt"

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 2560b9877..ad54acf5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -244,7 +244,7 @@
 	};
 
 	wdt: watchdog@ff080000 {
-		compatible = "snps,dw-wdt";
+		compatible = "rockchip,rk3308-wdt", "snps,dw-wdt";
 		reg = <0x0 0xff080000 0x0 0x100>;
 		clocks = <&cru PCLK_WDT>;
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0


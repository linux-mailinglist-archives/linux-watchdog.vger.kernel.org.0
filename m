Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9152DE26E
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgLRMGx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgLRMGw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:06:52 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9462AC061248;
        Fri, 18 Dec 2020 04:05:49 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id g20so2899635ejb.1;
        Fri, 18 Dec 2020 04:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/ZZ4VBnbNLp5BmhedYREI5dGQvhTk+buJrXKgrwV+9k=;
        b=BjFKZ/kInBB3IhnwuwfILcjBujRZmZru2u9hhK/11pIIrU0IxLhAlXBTf0CNPaJun1
         C5dyMdl8Dbjecd2wZl4krNXj23NRef7m9FM6f4SeJiJylmw5trYMnUpFKiRteYmdydNM
         7pL2VQklCt4/P54w+lOiE/S/IdiuHLLsOH7pOHy7URn6nk0CWoe4foaiwCp0fTQwQgbr
         kGr2sWtKO3Qs2e+oj61SHQVqJFMWFfdIF1us/ofJT2fyerjW5CCy86VxYVq9P8SvpckU
         QGu9UYSBQDidZiM23oFL1svRWeYqdP/NAmB4ESLGEnE/dD+YxXaY1M69bNZdkuURNFnE
         OPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/ZZ4VBnbNLp5BmhedYREI5dGQvhTk+buJrXKgrwV+9k=;
        b=MGEMNpaCZMe03tg08taYAVt86SBwSJ0p08lsH1j2odY4tXezPmkE+TqhnFmZqd/+Mm
         uX/9s/qbDbWA+Gyfyjz6QXmBIS97bJVXkN8muezY5QRu1wUo0osz55/HNoatjE2LkzqD
         sE5UyPVpHPCuBcFWzQm97XfvGuDcUq5WyMgeycTrJc/WQCf6YnquX+9X5STbMzzpxP50
         NB8TodLhPYe1pfpJzCBrSKyjCYKdmO7q7dLKv4cdIgiEIMA5A9MI1I6npiym02TEZys6
         YPHgzFHl12qFBAEhFJqK9QQ62B/ErzM/ZcDEmtw3xOBb+3mOE9L2nApnl84XY+QCzdfH
         G2ew==
X-Gm-Message-State: AOAM5303gn54NC4ht5Dweso5EYNl7gVomGf6uYGQy4c6E6pGWuSYrZwl
        Ml4dmUQLbs8CrYBrrZ4ShlE=
X-Google-Smtp-Source: ABdhPJxHfIZ2zikC+cc85SIfju4KkJ6KDnevlI+HVFp90ifbcpbus3lkMjqe1/lr0Tuf6M/rCLanQg==
X-Received: by 2002:a17:906:c289:: with SMTP id r9mr3587553ejz.311.1608293148392;
        Fri, 18 Dec 2020 04:05:48 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:47 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 4/8] arm64: dts: rockchip: add new watchdog compatible to px30.dtsi
Date:   Fri, 18 Dec 2020 13:05:30 +0100
Message-Id: <20201218120534.13788-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog compatible strings are suppose to be SoC orientated.
In the more recently added Rockchip px30.dtsi file only
the fallback string "snps,dw-wdt" is used, so add the new
compatible string:

"rockchip,px30-wdt", "snps,dw-wdt"

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index af6bcef9e..541785425 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -600,7 +600,7 @@
 	};
 
 	wdt: watchdog@ff1e0000 {
-		compatible = "snps,dw-wdt";
+		compatible = "rockchip,px30-wdt", "snps,dw-wdt";
 		reg = <0x0 0xff1e0000 0x0 0x100>;
 		clocks = <&cru PCLK_WDT_NS>;
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.11.0


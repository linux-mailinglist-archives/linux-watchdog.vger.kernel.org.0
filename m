Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16F92DE25B
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgLRMG3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726517AbgLRMG2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:06:28 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9EFC061282;
        Fri, 18 Dec 2020 04:05:47 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id dk8so2123899edb.1;
        Fri, 18 Dec 2020 04:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1PyEzvS82rnhRnbvDzISjipZNGlkvR5cR7CHNHeeH+I=;
        b=uE8gLtg9Sgd7Jvq5YATDb6VEeikhHfMfrQf5jPXHuGyxMb4Kfu8jvAhtfuViCXCPRw
         ybWpgr5Znl9QViZX3XAfazjyG5TU8/tYYCx7F0Kx/nrYmTq6CNP9DmdsYt/J35NXtuxQ
         KR0CJgAnc6tPj0TGVM+Vtk7xcfVJNiIHMtj8IwviUBXfJFk9uPucikO+TVJr8A9DUmet
         4huNDcB+eYPMH+mynMPXCVk59qftv/cWRBjmv/nRezbeBLXw+4Turjt+nxbRP7x6EAuw
         /064vpCAzsaHqJbD0amZL1XDppN07OBM3yEEnvRQe96vwOPfs5lM884bk+1aSpuNqNGr
         jhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1PyEzvS82rnhRnbvDzISjipZNGlkvR5cR7CHNHeeH+I=;
        b=uDMtbia2z++ee+yAu5zyVPbZNukpG6KmP+TtQ4O0RqPB+sjGacwFU9q1jwvnT0ZKAr
         2u54aFyFd0jKaF6HStXV4HzVgNYy3rUHLWA3N2tez0bSQ8lgBfbBnN+YVnMzF3TRpP0w
         IrU7MPKYeXONZDwKcCdutfdItvOC2VIeQAB+gVEUfBJ/Jc0WVqHurtiNqYgnMkzB7n7P
         gExtMGjpi6m7RZdBm9pwkC4T7Nk93YP8WZ8CxH2zaE3i6hqQtQgvfniJlgao3CjGhesc
         ZReuEuQA+6TBq3wbZZ8RSo7pygNLY/IbNc7QzT5pipMx2UNA9CB7WaMB/+Lq0tyarSv3
         j9kQ==
X-Gm-Message-State: AOAM531iD1ZPxpzigoO5owxVanyHywsi3H7M97pjB3JYgc1EZx6S3v/r
        T1trsjoecFxV6zVOG41LBYY=
X-Google-Smtp-Source: ABdhPJyQ6mBWCp9s9rcB5cgA3qSh9N4I2Fyw4psSOClliyAEcbszic6rB08dw+cRG1fQadWGCgxzIQ==
X-Received: by 2002:a50:9354:: with SMTP id n20mr4097070eda.231.1608293146635;
        Fri, 18 Dec 2020 04:05:46 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:46 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 2/8] ARM: dts: rockchip: add new watchdog compatible to rv1108.dtsi
Date:   Fri, 18 Dec 2020 13:05:28 +0100
Message-Id: <20201218120534.13788-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog compatible strings are suppose to be SoC orientated.
In the more recently added Rockchip rv1108.dtsi file only
the fallback string "snps,dw-wdt" is used, so add the new
compatible string:

"rockchip,rv1108-wdt", "snps,dw-wdt"

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rv1108.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index e491964b1..8ef8d038e 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -300,7 +300,7 @@
 	};
 
 	watchdog: watchdog@10360000 {
-		compatible = "snps,dw-wdt";
+		compatible = "rockchip,rv1108-wdt", "snps,dw-wdt";
 		reg = <0x10360000 0x100>;
 		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_WDT>;
-- 
2.11.0


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24B02DE262
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgLRMGx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbgLRMGw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:06:52 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE6BC0611CA;
        Fri, 18 Dec 2020 04:05:52 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id dk8so2124123edb.1;
        Fri, 18 Dec 2020 04:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4XAsCwTny31hiZyHYjOU01P8vUXEjyFQK6m4wdFwu8Y=;
        b=rztLfrcsh000/0nNHokBSq0/k3YJ0bYQLi5FLxUvhqBE+bpF3a4eDnw36EdNCtT8io
         wQZ7JjB5ZlnMLA69ETJWBjJsmA7QAKlswM6DjMf3XNCO5506YE8rSbYNUsqAhkZkHdp9
         pNC9/0V5qMjh4lqPOtHaRFss9P533vyxVtBGPDTf/K4pZ/PA3anZW1vJ00vWycY0hS9N
         UvW3iXutKbV0XElZEk+9tQTFrEIQbtv9zBS7jJi3A3vDU6ZM7rxAgMsrxNCRMYMLjPA3
         1b/jEka5FdPD6JRg2767kzcShknNAcJtwgvA2+aV0gHgJgUOVbcFoVdRsPMbWT15D/30
         IpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4XAsCwTny31hiZyHYjOU01P8vUXEjyFQK6m4wdFwu8Y=;
        b=plimEIPsqqQr9smcEd4qoEDM9aUebYF0GD9QS7CTBhGmWcqTAzkqbWLj5N/Z68l7/l
         EeoRYtzlCxfJLYRLZLXpytZoYdFQppxIqteG58Mdq6aU0EvFO62xcjFVdCcxjYIFJnPk
         DKNDMevIBiroKAocSF4dTR/p+o+TVmQmhtERKJ0+trqedsJaM4+EwkjJKa1UnlT6Kat7
         UWtAzMOyu2/vWZYxV2eug85DCpHs7IlBR07CY2uvCD/Hb5bWPYga6iyUY2tQ7Lv3+HFu
         rmeieBvrctrVMrwwIByWAvmVoTh9XdHLpvdVTvVlAVF2by/mDe5hvnUR0cEOgEc2lmVH
         3tpA==
X-Gm-Message-State: AOAM532soglYm8bHu+dmE1WRCtJpa7uug6z11oUkDgwiDSD+5CyAsm9z
        LLcJJe+wXBSgujL1ywKULb4=
X-Google-Smtp-Source: ABdhPJwZPyzaq+Ep3j3m5cpnxkyP4k8BkMeWDUm/3OvnwsQzAOM2NmyQgnOUyVyHsiOokI10ALIlBA==
X-Received: by 2002:a50:8a90:: with SMTP id j16mr4007056edj.334.1608293151123;
        Fri, 18 Dec 2020 04:05:51 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:50 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 7/8] arm64: dts: rockchip: add new watchdog compatible to rk3399.dtsi
Date:   Fri, 18 Dec 2020 13:05:33 +0100
Message-Id: <20201218120534.13788-7-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog compatible strings are suppose to be SoC orientated.
In the more recently added Rockchip rk3399.dtsi file only
the fallback string "snps,dw-wdt" is used, so add the new
compatible string:

"rockchip,rk3399-wdt", "snps,dw-wdt"

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 2b99480ea..825eb254b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1536,7 +1536,7 @@
 	};
 
 	watchdog@ff848000 {
-		compatible = "snps,dw-wdt";
+		compatible = "rockchip,rk3399-wdt", "snps,dw-wdt";
 		reg = <0x0 0xff848000 0x0 0x100>;
 		clocks = <&cru PCLK_WDT>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
-- 
2.11.0


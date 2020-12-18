Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960802DE25D
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgLRMGg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgLRMG3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:06:29 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B98C061285;
        Fri, 18 Dec 2020 04:05:48 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ce23so2846073ejb.8;
        Fri, 18 Dec 2020 04:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=k0nDcuZ8QugfOX5+RU/cJ2JSrJVjKHFnRTpYUjY4q0Q=;
        b=eQcKsTMisHgJKl7nf6cbOe0rE1W2HYMx3136Cuvaf/o19Z22JPA/RgGY+26s9aU5bM
         hWPv8axClPU4jinaXPNwebsblpKZkwWZQu1BWwKLIXQKXheBY66+oOLZ9r5W/lTykwcQ
         T+bbmXxJy432P9Bp70DmB/u1A7Ycf2vq/FB4jJkN0Gpa+TU+8v9fQLDbbAkkPXiAZWHn
         wDsMMdetwVuQYucZIbdEaxcCOcf5j0jcYAQeqKcNw/IWYGtf/+KRQZsBCdiV6r/P1A9/
         vw5pOBzqxI1S3ZV9AQolVtL7PGHp/Xl7JK2isvvmgdHKH8pR/rJi9bchWpnkkJCTZhmr
         dbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=k0nDcuZ8QugfOX5+RU/cJ2JSrJVjKHFnRTpYUjY4q0Q=;
        b=N6OcryEWR3Tfe8IY+gj1CWmO2wR0uT2efjpHXCS5RlJkl3e5hrpdZgJ/DAfs6npgbG
         cyc7ZdwmE68awjIumOJZov0hHKiVyRGCBhxf4bzt08m5mjiAATRu8oqyuHJE2h8ksLQ/
         zYhOUgnFm3554GLYeVaVKuUPitdtRwtDK6+M4yE/zIroH2f0lVLiVe9Jk7u8I/Ek0FKu
         5UInGm960EjkaFWI3UdU/8Aak8j/pj1vjNmfomhZ3EpCfNKDzkMJ06JdrgxBBsygiWAr
         ET26YYK0dhTJjSxhiOdv1ZtbPcHVEcfbwGhHgQwaIUP8QV47Kp2eqzq0sJe3ernPjNLQ
         gPgw==
X-Gm-Message-State: AOAM533KZvyH7xTBSmOcsriDtYtWU1HRoKaatVoj+wOu1l3egHuGeGVu
        wxvJI1H5XTBE/OTmGsC30T4Aj9bmChwvBQ==
X-Google-Smtp-Source: ABdhPJzI4ZMOUEYRg33YHLpuyl5z10Loxckhv/FIOQvpWiqfJ1GY0QvxwqrWdUdSKjhCxARoswbCUw==
X-Received: by 2002:a17:906:350b:: with SMTP id r11mr3753211eja.143.1608293147503;
        Fri, 18 Dec 2020 04:05:47 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:47 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 3/8] ARM: dts: rockchip: add new watchdog compatible to rk322x.dtsi
Date:   Fri, 18 Dec 2020 13:05:29 +0100
Message-Id: <20201218120534.13788-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog compatible strings are suppose to be SoC orientated.
In the more recently added Rockchip rk322x.dtsi file only
the fallback string "snps,dw-wdt" is used, so add the new
compatible string:

"rockchip,rk3228-wdt", "snps,dw-wdt"

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 48e6e8d44..9910f9b5c 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -385,7 +385,7 @@
 	};
 
 	wdt: watchdog@110a0000 {
-		compatible = "snps,dw-wdt";
+		compatible = "rockchip,rk3228-wdt", "snps,dw-wdt";
 		reg = <0x110a0000 0x100>;
 		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_CPU>;
-- 
2.11.0


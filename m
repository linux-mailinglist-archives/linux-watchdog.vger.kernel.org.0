Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659022DE261
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgLRMGx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgLRMGw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:06:52 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DBDC0611C5;
        Fri, 18 Dec 2020 04:05:51 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qw4so2809079ejb.12;
        Fri, 18 Dec 2020 04:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nprlEGWaHBCqZYtho0Xw3+zC3YA4tgvCjM5E0w0Edtk=;
        b=SY671sQYZGbgkrpI5o3PX3OfSBObJr+MvSOfQsI4q8u1EM0iT7qmL31CXgjD418+6w
         9TWWy6F74drQGqno+9XkxFxjXGDKeU4hrX6Ge5EMRqnTyvZhO3RUCqL0NEPI4q1vMK23
         YGujL+kvZmqyzWIB+fJn6G2X240t9G5nYXQO/poMtqCwTfKJxY1Oy2JqD20I49dmj4DU
         cuEeGPLeaPjcp3kpcIY6jsWpsfcEway6nUIF4Am6Ti2brXySV3eajbz4E6R7ZBWlJtOv
         G7+KrFFVxcXNmDBwS/0DrXK/jB5T07pq56SgvONzE0tb2UxU/xlJJM0h6Ky2yW6CHB6s
         6EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nprlEGWaHBCqZYtho0Xw3+zC3YA4tgvCjM5E0w0Edtk=;
        b=jm27pO/JC67NNoUr68HPe3hwE4kZ7PQkeD6epFDNd0h1MhTIfP7N9J80l+IuqG+GTm
         4gfNHILrwAlFgaH5r3xOHq7xms89Kwii8PqX/k3GH4meV4aSnw/1RNwP9PL7x1gWJDE8
         1Nw+2IZcrg1Uf37GvqPooMeVrAgQenlzZ1bnIh/YDewd5Py6b+lbXXds/l7jWjEL0MsY
         PhgoIt2iFYUhnqwBGGYJ95O5tWVc8i25VYYQWikdgdFls4AhegDKbxDN46uLFp3dNVSq
         +rqg/4C3Dcy4D/FGS5z7dMAXTgF9a6yKhjrUym0jDugb2m2CUql6hj02aZZ9bFozZJST
         xsNg==
X-Gm-Message-State: AOAM533y7kLdMlHhzKySctlFgWaK2QmHw953Y/XvyzEFLIHjLHb+Gj7J
        T4blSgiaM9OqjtcPVtiTwWM=
X-Google-Smtp-Source: ABdhPJxtVfoaiGqv5Jo3CmnEdaRolsTqNzNZjivs47itf0kkIzZ8MMrUHO70K046YOsPTiD87cNN2g==
X-Received: by 2002:a17:906:d209:: with SMTP id w9mr3081004ejz.211.1608293150174;
        Fri, 18 Dec 2020 04:05:50 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:49 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 6/8] arm64: dts: rockchip: add new watchdog compatible to rk3328.dtsi
Date:   Fri, 18 Dec 2020 13:05:32 +0100
Message-Id: <20201218120534.13788-6-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog compatible strings are suppose to be SoC orientated.
In the more recently added Rockchip rk3328.dtsi file only
the fallback string "snps,dw-wdt" is used, so add the new
compatible string:

"rockchip,rk3328-wdt", "snps,dw-wdt"

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index bbdb19a3e..1e3e1086e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -453,7 +453,7 @@
 	};
 
 	wdt: watchdog@ff1a0000 {
-		compatible = "snps,dw-wdt";
+		compatible = "rockchip,rk3328-wdt", "snps,dw-wdt";
 		reg = <0x0 0xff1a0000 0x0 0x100>;
 		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_WDT>;
-- 
2.11.0


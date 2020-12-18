Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 713032DE26A
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Dec 2020 13:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgLRMHI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Dec 2020 07:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgLRMHH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Dec 2020 07:07:07 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8C4C0611CB;
        Fri, 18 Dec 2020 04:05:53 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id i24so2086836edj.8;
        Fri, 18 Dec 2020 04:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Wu3SXkqHC6cpy3h0/8DvgzvKrbbUzD8H5+UCQx/bkb0=;
        b=RSDoocGUy3y3+pjCTiA7rPJRyh2f2zOqox4g2mZ0VURCEvUS3A94RgpQeZOSTcLlka
         Y+nzOj7YtHnJOB+E1XYRE9xUtGzjWptsh7gELogOsHkuN9uhMwPDjG/kIoViH3kKVIB/
         +oLu75pvejiF0tnQUAi6qkCkS5dOt1sqBLDttNzda1qbt5meNxBkLocnzc3x+Q+zQoEv
         v9McpspFF0mQbl9mpOcu9ZXfEjYx3uo7FHqC3khG9mIOAC55oaq9C3s+8yDW6znJjFuq
         7hi++xd/c7KJBjh90VUAwQU9caBfee0Izhyn+9HZC2BF1XCBiVnXYInQKuMkYmHhio+n
         i16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Wu3SXkqHC6cpy3h0/8DvgzvKrbbUzD8H5+UCQx/bkb0=;
        b=CeCa7dLEGns9awIOSTvK68QqlKKhFXL6Tgicjr4noch6MfSrjjF583PM7cMdLfS8fk
         nwGmri/217QkXoRcqdsAkTTUJaDxEyjoN08vxp26R41H2+pOS7jGOZB4lyQqps5xPMSJ
         4pxnfYjiHGkkPudBWymyji8mFitg6AvCxxKI5b/vGIjQIWaqDjBliHvPboiCnVgmcvN2
         pKMuCXin6j5p6oqReYkPQ00PVcS9GGg0rEKD2ruGBx7E5ByDTQ5IB+N/vNrA5g1yQvwk
         2HgX/xvV1jkhkj1QFj6xpOA7rgOVnXxqXO81nrpDEnnuDm1t5S+AwsZvUcZDzdndQiRJ
         MbfA==
X-Gm-Message-State: AOAM533vv9wjausfDSPModAo1sZgA5to5k8GZgMeOpOXe5n/dSvKFr2+
        /jTaShtUFqEO7M+sdz0lF7E9nBhFUY5sqA==
X-Google-Smtp-Source: ABdhPJwnO8bGvjXbEsr4oz6udOYL98137c2SWWKXKxu0iHrHZIP7VpcK2vstLE4PdR5l9bM+H2HDCA==
X-Received: by 2002:a05:6402:128d:: with SMTP id w13mr4044665edv.56.1608293152133;
        Fri, 18 Dec 2020 04:05:52 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ga37sm4775832ejc.96.2020.12.18.04.05.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Dec 2020 04:05:51 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 8/8] ARM: dts: rockchip: remove clock-names property from watchdog node in rv1108.dtsi
Date:   Fri, 18 Dec 2020 13:05:34 +0100
Message-Id: <20201218120534.13788-8-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201218120534.13788-1-jbx6244@gmail.com>
References: <20201218120534.13788-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

A test with the command below gives this error:

/arch/arm/boot/dts/rv1108-evb.dt.yaml: watchdog@10360000:
clock-names:0: 'tclk' was expected

Comment from the dw_wdt.c file:

Try to request the watchdog dedicated timer clock source. It must
be supplied if asynchronous mode is enabled. Otherwise fallback
to the common timer/bus clocks configuration, in which the very
first found clock supply both timer and APB signals.

Like in the other Rockchip watchdog nodes the property "clock-names"
is not needed, so remove it.

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rv1108.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 8ef8d038e..bec47e0be 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -304,7 +304,6 @@
 		reg = <0x10360000 0x100>;
 		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_WDT>;
-		clock-names = "pclk_wdt";
 		status = "disabled";
 	};
 
-- 
2.11.0


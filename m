Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACEE039092F
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 May 2021 20:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbhEYSqb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 May 2021 14:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhEYSqa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 May 2021 14:46:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDB7C061756;
        Tue, 25 May 2021 11:44:59 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id n4so7351284wrw.3;
        Tue, 25 May 2021 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bqTv+TFAOMBiEQMLXRI7rx6F3LpfuebvVaCG8zYT/N8=;
        b=hLav2Q7or125o0zrBzNf5u+ACFiioB2IxHdwFxQ4yGd2FIPHV+8AoIrrXv0y0Am+uR
         bcXLjdplJ2iz+DIYOkYUlJPj7paVRPy+HceZQXevvK+coIGow13KR08oLVkZ8ykJF85P
         pyhfmFa1rbU/CCUiAfam8CjjMqioRvEmRiWexQcwh427lx2WmR2y29sRkz6XwwzQrHR7
         BVDka9IYtZtYiWixr1gwDlr/MN8M/RcYAOVTil4yn5EBreLr1Uxnn/9qz9qv4fwVXCK6
         uxx73F3lKbVj3hkKKJTx6smZW8m8CFPaXdQ7L5q8Eko60kKhAxgTO8eZfZX2vhQIlimV
         JzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bqTv+TFAOMBiEQMLXRI7rx6F3LpfuebvVaCG8zYT/N8=;
        b=mNvBX8Kxpo3+esVdWHzYAuwQXJ9qArdrlfWp+i+P9Osw3wrvJOTsAnksMb0wfwnCAT
         hyXtdFbEZQfxZ2KEPw6LErqttgUFMtIjqvoOgB5W2NV74FqwTxv5VQUKueNCqwwC9dB8
         b8/Vej8BrUZQ49sXv66KbWkY+EBi2Mk5cwEfM/vrM5BkrY4EKEbVaRihwXYvxx2eSQA2
         EjoYJ/DnVyi1LXRZE1mr4wWOVyLjqp3scPvuozzYl+cTmJyNZGtyJQoggAQoG+paXhRX
         yWEjq5GsVXviXE7WrH3KWHHyW25D1hT4ZGdIBQ7R1/owzBEEylyDOFRJkSajxATfOXU7
         OA5A==
X-Gm-Message-State: AOAM531Yq2MeqjV/l0HgYQcaohwLe6rsAYmrudkhAi0boBYwggZFU8V8
        RxCHk5XhSAc4kV3tp8HMrmvWMFBhZ6I=
X-Google-Smtp-Source: ABdhPJwor9nnK+rwJRHqFbttHr3fZpGo8vUcaPhHIaSN5bwKEj7DzM7qdy8y/YeHMvQF+EXoQy5PhQ==
X-Received: by 2002:a5d:6d83:: with SMTP id l3mr28938777wrs.241.1621968297955;
        Tue, 25 May 2021 11:44:57 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id u14sm3595732wmc.41.2021.05.25.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 11:44:57 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: mstar: Add watchdog device_node definition
Date:   Tue, 25 May 2021 20:44:49 +0200
Message-Id: <20210525184449.57703-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525184449.57703-1-romain.perier@gmail.com>
References: <20210525184449.57703-1-romain.perier@gmail.com>
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


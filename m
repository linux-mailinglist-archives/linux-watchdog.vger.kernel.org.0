Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4379254C6
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 18:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbfEUQDm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 12:03:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45589 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728615AbfEUQDm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 12:03:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id b18so19198818wrq.12;
        Tue, 21 May 2019 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QpDXZXYym29zoRjsqduFr5nvO56XxhEiJtjU9uFwgpA=;
        b=myg0kVbvmbZMg4wMSNJNjqjThk/atZjhPgsXft0HcYvA6F/Wb2aqyb7pgjdU5vd1Uq
         Oa0OVzB8LMhxHE1skUKFmESOAnmFvl6LyhmTnZD9Z/nFkLIem17t1B6wBLYvfXjQVafR
         62coFzNMdQw2UgoOJ4MNRlOmQIddli7ELBYACmyOipYaBIrlVVhrdp+mHL/gJMDl7tA8
         ZA63gsCPHuVZ5zHSqSTV9eEj5Skt649vHWcJR8RKNu3ujkGmls609fiShQfRpjEB8y83
         Zvnpa1dosXnvxbI2GfTxha4jbl0jNivujYxmlqw7VYOlU4y7WMFkhACfFexmxVLcEDpp
         2QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QpDXZXYym29zoRjsqduFr5nvO56XxhEiJtjU9uFwgpA=;
        b=saIhydvbCruCBQSJDvdreCjQrFMW2Pi6R34xVBZSLN+N8cnB6auDcUxYUHAkFqxORA
         QAO/FjavYgYKToKSoKSak4YSGtjytR0A2Cn2H2i3p0QbCFhYTsG22vYswE7EIpfVBMp0
         ynrWb4uK6PBRAH3k/HL7I1KUepsKDdPEsmI8WC5H8ph8oMPRRtuTz+7e7BheYLMpP+h+
         2ygx+8pVmUUI0z76DKnVSX6eVDhTHCgCPQQODcKOuWYT0KHlwKifDItQkKalmlAy416o
         zNyrSRCU1DntDoHWHXPcCSXPIogJCewEU5K7go4XruPB6IKc9q7/b4jXVsotdLzTD6Co
         5D6g==
X-Gm-Message-State: APjAAAW4tNKHJOPPvZhQRuPcfSW1ezU8EYapeFdskPBzUeWasx5JSRYT
        gNHVfQR2Yrw6Ze/yjUqBGVs=
X-Google-Smtp-Source: APXvYqyG8Z9Cg25S9tECJteAsXvRH4P6r7/DZmyURD8DPwh2PqxPxWbojqBz44LdbbuIcGGMG56h8w==
X-Received: by 2002:adf:f351:: with SMTP id e17mr197313wrp.113.1558454620199;
        Tue, 21 May 2019 09:03:40 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id g11sm6853811wrq.89.2019.05.21.09.03.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:03:39 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 2/5] arm64: dts: allwinner: h6: add watchdog node
Date:   Tue, 21 May 2019 18:03:27 +0200
Message-Id: <20190521160330.28402-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521160330.28402-1-peron.clem@gmail.com>
References: <20190521160330.28402-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Allwinner H6 has a watchog node which seems broken
on some boards.

Test has been performed on several boards.

Chen-Yu Tsai boards:
Pine H64 - H6448BA 7782 => OK
OrangePi Lite 2 - H8068BA 61C2 => KO

Martin Ayotte boards:
Pine H64 - H8069BA 6892 => OK
OrangePi 3 - HA047BA 69W2 => KO
OrangePi One Plus - H7310BA 6842 => KO
OrangePi Lite2 - H6448BA 6662 => KO

Clément Péron board:
Beelink GS1 - H7309BA 6842 => KO

As it seems not fixable for now, declare the node
but leave it disable with a comment.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 16c5c3d0fd81..13e70aebddbe 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -208,6 +208,15 @@
 			reg = <0x03006000 0x400>;
 		};
 
+		watchdog: watchdog@30090a0 {
+			compatible = "allwinner,sun50i-h6-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x030090a0 0x20>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			/* Broken on some H6 boards */
+			status = "disabled";
+		};
+
 		pio: pinctrl@300b000 {
 			compatible = "allwinner,sun50i-h6-pinctrl";
 			reg = <0x0300b000 0x400>;
-- 
2.17.1


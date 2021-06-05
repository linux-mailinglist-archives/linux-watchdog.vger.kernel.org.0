Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A0139CA13
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Jun 2021 19:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhFERGu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 5 Jun 2021 13:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhFERGu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 5 Jun 2021 13:06:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0847C061789;
        Sat,  5 Jun 2021 10:04:51 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a11so10573315wrt.13;
        Sat, 05 Jun 2021 10:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g/W44ow+C6jPmps5gfwR35TPNfFxt3RYI3mHXT3ZiRU=;
        b=Bw2IBYrnzHyx4A99ZqsNvFNjENfkjgf2045SpAsco2Ufqd1uK/etMZ7muBq3Ida0AX
         GDxstPbhFwStHlWpaxXwRVC4m56a/XUcNBqkRpMOtSZHmZf83QaYbbKvdCBjnfzU4kKp
         E0MClDxVpoHeoNHPzdIWPS2mvFZ5vo7DiDt2yjBoSFlf0bGrM71MCmcsUJ+wNhEVhfx4
         NQHo+LmWi+AnA80SdQj6e5INRe0a+b395toR0ot52zKtv3umVc0Lz4o9oqtoIGwh0ePI
         jmOyxBYuYDXrZuaqUBEe3/8KLXNn+/MmfKKPhmexZilVC3Sg2CYuvLkgnV1dn9l5dWSK
         ofhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g/W44ow+C6jPmps5gfwR35TPNfFxt3RYI3mHXT3ZiRU=;
        b=GP+pwLTa1iKmzZA/EUin27Iu4hl3dy0A5ihV0UmWDANY6OmSSfL+vMfZcC6V6v8/CE
         wYpmGhtKMghzrQYOLufuB/+1c6qQt1/ztakMekCo/Ar03eXQBiVp268EaTCe19n7aS6G
         NOrpSJ3F9zvJ2ZRRJDnUj1Uf5xbRzftOqBFrDlVbFWmcz0hbmj/MQXQf6YtWdUlLbTiy
         RU73RG8oMBee0YW0P8S73sjPefPs8b8ez/77aH64+M+6saekC6i3puBEwCfUJluxO0cS
         G7Rc16tNmqHICZBoommjc2wfdf7/tXeCn0B7IhS7+3r6ga2Lt3cmdNSPx7flRJqSY3Gt
         9zyQ==
X-Gm-Message-State: AOAM530hAg5W/qqiBJDk5kQsf0KaEbm0AN/1WrxG1paHRhXtT7JUo0fo
        jKJEznTplWvj4sck3SLxbxerXNqrSqg=
X-Google-Smtp-Source: ABdhPJybYMS+Qt8hUA7uuNlltK6Z2xKsKaPvHD9Ky0eTMbcjFktPuaTwZqWLA98/yeoyRA08QmTKfg==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr8965921wrq.81.1622912690062;
        Sat, 05 Jun 2021 10:04:50 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id z19sm11201170wmf.31.2021.06.05.10.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 10:04:49 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ARM: dts: mstar: Add watchdog device_node definition
Date:   Sat,  5 Jun 2021 19:04:41 +0200
Message-Id: <20210605170441.33667-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210605170441.33667-1-romain.perier@gmail.com>
References: <20210605170441.33667-1-romain.perier@gmail.com>
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
index 3d5d8c634de3..471d005e2e62 100644
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
 
+			watchdog@6000 {
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


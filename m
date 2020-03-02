Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C4217649D
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2020 21:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgCBUE6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 15:04:58 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58052 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgCBUE5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 15:04:57 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 022K4ckN059606;
        Mon, 2 Mar 2020 14:04:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583179478;
        bh=MnQUCS2p5FfCgMGaa35GROR+KFXSAuN1485gewbObmg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZLX1keKiYtyS0FUD45taRcFpUwfFkfBMyi3jzP9Rxv/onati4HHfBQHC5nHw+ae8Y
         dOLQC9QPemVMdnQFEwGNSgcmpRmGoTCJ/tU6butsaANoQnbW+LwJveCXoA6l2SQNlW
         swuP32dY9bX5OKiAfQLBFDa+eYAQikpeBKfq1A28=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 022K4ccu029339
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Mar 2020 14:04:38 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Mar
 2020 14:04:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Mar 2020 14:04:37 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 022K4UtE074555;
        Mon, 2 Mar 2020 14:04:36 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCHv2 4/4] arm64: dts: ti: k3-j721e-main: Add MAIN domain watchdog entries
Date:   Mon, 2 Mar 2020 22:04:26 +0200
Message-ID: <20200302200426.6492-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302200426.6492-1-t-kristo@ti.com>
References: <20200302200426.6492-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add DT entries for main domain watchdog0 and 1 instances.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 0b9d14b838a1..7ab989496c2c 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -963,4 +963,22 @@
 
 		status = "disabled";
 	};
+
+	main_rti0: rti@2200000 {
+		compatible = "ti,rti-wdt";
+		reg = <0x0 0x2200000 0x0 0x100>;
+		clocks = <&k3_clks 252 1>;
+		power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 252 1>;
+		assigned-clock-parents = <&k3_clks 252 5>;
+	};
+
+	main_rti1: rti@2210000 {
+		compatible = "ti,rti-wdt";
+		reg = <0x0 0x2210000 0x0 0x100>;
+		clocks = <&k3_clks 253 1>;
+		power-domains = <&k3_pds 253 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 253 1>;
+		assigned-clock-parents = <&k3_clks 253 5>;
+	};
 };
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

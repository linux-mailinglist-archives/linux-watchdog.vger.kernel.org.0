Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B29182CE2
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Mar 2020 10:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgCLJ64 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Mar 2020 05:58:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJ64 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Mar 2020 05:58:56 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02C9wXRs054704;
        Thu, 12 Mar 2020 04:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584007113;
        bh=uiFzRscv7Q/Por3roHFVtDDPPVCVZ2Mgpw9+arQADOg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kNLYcYN60WfGD+xjtvgH9yIuZKP2GKM0ZvXpo+KUEmexGbUoi111uoX2zIz2+Uf1g
         d0bWKIaHq977L8/AZzuCJkLlXFkphG5mQKfC18U5tLK4R+Stmyt3F7pluwhjxYjJ0y
         kMHyDPrfT7VDO7baPShYTKBGHLMc6QEyzm+3/h5I=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02C9wX7V010654;
        Thu, 12 Mar 2020 04:58:33 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Mar 2020 04:58:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Mar 2020 04:58:32 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02C9wOR9089783;
        Thu, 12 Mar 2020 04:58:31 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>
Subject: [PATCHv4 4/4] arm64: dts: ti: k3-j721e-main: Add MAIN domain watchdog entries
Date:   Thu, 12 Mar 2020 11:58:08 +0200
Message-ID: <20200312095808.19907-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312095808.19907-1-t-kristo@ti.com>
References: <20200312095808.19907-1-t-kristo@ti.com>
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
v4:
  * renamed main_rti* instances to watchdog*

 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 0b9d14b838a1..aa525bc321f1 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -963,4 +963,22 @@
 
 		status = "disabled";
 	};
+
+	watchdog0: watchdog@2200000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x0 0x2200000 0x0 0x100>;
+		clocks = <&k3_clks 252 1>;
+		power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 252 1>;
+		assigned-clock-parents = <&k3_clks 252 5>;
+	};
+
+	watchdog1: watchdog@2210000 {
+		compatible = "ti,j7-rti-wdt";
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

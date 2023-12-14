Return-Path: <linux-watchdog+bounces-346-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD348133F1
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 16:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2BC1C2172A
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 15:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0A55C06E;
	Thu, 14 Dec 2023 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="KNalxmWA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF818182;
	Thu, 14 Dec 2023 07:05:33 -0800 (PST)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE9Lqc6016870;
	Thu, 14 Dec 2023 07:04:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	pfpt0220; bh=c+KSLbDoDzpXnRUguZfTCy+EBnWOgf+TQnT2K6R3LKc=; b=KNa
	lxmWAXOd2Z4cYooSU5UCtf3PO774y0Mpc9PkE4XoVZrZUj0PSSHpbot/y+pk9jiB
	whkfReFVAQIp78sc0reuHsQf3gk6P+a2Wm76KWcNxWZfEEkJQrw9ND8ODxUO6GUO
	aagoSAllXNICFW5jnE8gPkeWQ4isfJyf7BZt4rf8tFBeMaVflYIBBF40DjejL3eg
	BzMzsKJKqvA+Ukbul/IPZkMPTjgwkxspihWiiYogwSlfd42bH1JqtTReNV/PFfi4
	0lb4lSH2AR1EhTwBM6DtXIrZoWTXe5NYGPg7U8ijkd9abovX6aHtqI2U9hjO/uiu
	ubiZpdI1A9W1MTP/JuQ==
Received: from dc5-exch01.marvell.com ([199.233.59.181])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3uyy0ns36f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 07:04:31 -0800 (PST)
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 14 Dec
 2023 07:04:30 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server id 15.0.1497.48 via Frontend
 Transport; Thu, 14 Dec 2023 07:04:30 -0800
Received: from dc3lp-swdev041.marvell.com (dc3lp-swdev041.marvell.com [10.6.60.191])
	by maili.marvell.com (Postfix) with ESMTP id 0B7813F7077;
	Thu, 14 Dec 2023 07:04:25 -0800 (PST)
From: Elad Nachman <enachman@marvell.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <gregory.clement@bootlin.com>, <chris.packham@alliedtelesis.co.nz>,
        <andrew@lunn.ch>, <fu.wei@linaro.org>, <Suravee.Suthikulpanit@amd.com>,
        <al.stone@linaro.org>, <timur@codeaurora.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>, <cyuval@marvell.com>
Subject: [PATCH 2/3] arm64: dts: ac5: add watchdog nodes
Date: Thu, 14 Dec 2023 17:04:13 +0200
Message-ID: <20231214150414.1849058-3-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214150414.1849058-1-enachman@marvell.com>
References: <20231214150414.1849058-1-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: HFPwXkbmfHwAQFdtlK6yVdicb1PU5u_d
X-Proofpoint-GUID: HFPwXkbmfHwAQFdtlK6yVdicb1PU5u_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02

From: Elad Nachman <enachman@marvell.com>

Add watchdog nodes to ac5 and ac5x device tree files

Signed-off-by: Elad Nachman <enachman@marvell.com>
---
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index b5e042b8e929..e898c6bd31f0 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -307,6 +307,20 @@ nand: nand-controller@805b0000 {
 			status = "disabled";
 		};
 
+/*
+ * Global Watchdog:
+ */
+		watchdog: watchdog@80216000 {
+			compatible = "marvell,ac5-wd";
+			reg = <0x0 0x80216000 0 0x1000>,
+			      <0x0 0x80215000 0 0x1000>,
+			      <0x0 0x80210000 0 0x1000>,
+			      <0x0 0x7f900000 0 0x1000>,
+			      <0x0 0x840F8000 0 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			timeout-sec = <30>;
+		};
+
 		gic: interrupt-controller@80600000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi
index 2ab72f854bea..d850c30db552 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi
@@ -15,3 +15,11 @@ / {
 &cnm_clock {
 	clock-frequency = <325000000>;
 };
+
+&watchdog {
+	reg = <0x0 0x80216000 0 0x1000>,
+	      <0x0 0x80215000 0 0x1000>,
+	      <0x0 0x80210000 0 0x1000>,
+	      <0x0 0x7f900000 0 0x1000>,
+	      <0x0 0x944F8000 0 0x1000>;
+};
-- 
2.25.1



Return-Path: <linux-watchdog+bounces-4296-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F22BA91D1
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 13:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 117D0188782A
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Sep 2025 11:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC9630648F;
	Mon, 29 Sep 2025 11:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkj9hPhs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B590305943
	for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146577; cv=none; b=hIMKDQOmsqapMXNgPg4upLPd8dDjo4xc0WqqJvar11K/2LRNQCD0YObEnNoHi1cvOV58nXCJbHzYGQ2UV08J+IP51PSxHE7hsH5oh78tiGq5UIuewebYSUd5rhHEZ8hEA5kpww2ouvkvdvwNg5Y7b7keWFHSc2X/0xnevxWrTI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146577; c=relaxed/simple;
	bh=Hjg7O/VP84/J9e7RtIca3ORI/sXxn52fxB421eoIakc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=slMwyuFJ0aGW49Fldu6QX5Sg7HQTVvhj1WXhvCQIlNsIzKauXdJumRpZPS+ywYIWQ/jJwVRWJS0FblN7OSDH09FSgWnt61kLJilEmPjF6P7Cy68l8b9Vly3oJcTpgNR6qbljlBAxX98kSUg77UfrTv36OE27TmIqK7gy0DghRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nkj9hPhs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso32945645e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Sep 2025 04:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146574; x=1759751374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNXwjySoMWBRZ4GYpoJmH4Y5RPTmMIKD3TMc/fbCEec=;
        b=Nkj9hPhsaVU7H8Lc9qQKpJuvGEgx/EU874W4J9UrpEWjnxokyPG9j2xHkRTCAdBO6/
         4c+tiKo94S5c0O8MBZBeZOoIwQ60BKHzJMroGGWl2IgLbFJTFT61ENmrQl+WRkCEMBaS
         0jGl6x8wcEoTlrqaykVoyZDpKrjveCAYSa+frXIsnMHPBnzVhwa1vktp0OCaJlrEWbB3
         XQdrCG7pWwJBJJb+G+umzfRksACkLQB38annLTsCdxUIQdPK9Q1Doa7bnpuzguX2JUAN
         XGxGTu4mjMd+x0NpED6c4xqVeM1RYfdNKD5VCa6Fc1O2CKLylQt/xEB+aV4KYU/KY9+N
         eMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146574; x=1759751374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNXwjySoMWBRZ4GYpoJmH4Y5RPTmMIKD3TMc/fbCEec=;
        b=pCdi2LhIgjpNg+QZapBhxe3HpMza7TRfdA+16XlG02db3CNnhPm+ol1fJ6O0o+7+2G
         XpXi2mrk/fg4sC0mR4wTqRaZ0k5UsAsMPUKTAsb4/qcnsA4Mh6oH1qBGCkMLtT1UCFaJ
         V0bgb43I2Ge8lehm9rFM6NVUDivwwyrECFMxZ2p6cK3gMlUYASbCBprwXa6Tsoq/talp
         gALPMiukoktdH0phEgpgitAAhm0/C1Dw09HUyEb5afSMadr6/jFpIEKQwl+PkuYJG7GE
         bemt911zF9FKgDxrFjOlHw2m69vFsgD7SEP6Hs0uHRCkFLlGmCqlNvoKwYUPxvULpvA0
         qlGg==
X-Forwarded-Encrypted: i=1; AJvYcCXL8qvmTpUMKMlvmOnYfF+UkJNvvOTeejStOs77sOdsAhtvJWkI86GAVFi2i1dUaZtn1B4F0JBRFl9rEY6qLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVezPNLURAAKPegQ5ArUmtlepngdCHtolvseXdIfatoqdKz/nY
	LgT9ma1+b+jo8pw8r//xgtyoEzQpir/Du6lTrznD0NWSQh0RcS5UARNH
X-Gm-Gg: ASbGncsBWsFLCgmyZI7NbIl1UdD34aVhmfDyjpko8MnRDiyjUbEnjqR/CRFRfreHTXN
	aSq9GnrZzj67c9eO9CjsY5Iq90KjGbcRzuVIqzQyucK0Su3Qwl352yR9sN9CWhrUYW5OID0OQ71
	0X0cNDE5f/ZZSv5sufoWKOoT7nhkpKlGh+YEwXebyZO3HZse8lOcJUCA6wvf+8j9edrMNpTcTa6
	8n1CBlgknLSaM7gvBRzJpYPqMqyRQbV9ED1CykAercFoMrE57KMVAne7i0t1SUssV9YjVMLj1CO
	291/qNwoC2RizA/HiZ3gcSVugIvVVsrzwnwt4aO0Y43Z74CsxrjuYG1hCeb/EaSIHCe8dKkDuWh
	GIZy+fGoiUQPLHXggrDIbiDZIDQi6FfaUbyHucmby2lNtnTLUIDrWbTZ/a4tzunUdmBMmPaetoO
	R9OA/5XQ==
X-Google-Smtp-Source: AGHT+IHhYHgkfdxkZZncQx9k1whr6EHsQE6KaOfz7zeB9aghhqbCsKWiT9BDf9MZkeyuwud6rhMSzA==
X-Received: by 2002:a05:600c:4fc6:b0:46e:487e:33c1 with SMTP id 5b1f17b1804b1-46e487e3768mr61020195e9.7.1759146573699;
        Mon, 29 Sep 2025 04:49:33 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 4/4] arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board
Date: Mon, 29 Sep 2025 13:49:15 +0200
Message-ID: <20250929114917.5501-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce Airoha AN7583 SoC initial DTSI and AN7583 Evaluation Board
DTS and add the required entry in the Makefile.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/Makefile       |   1 +
 arch/arm64/boot/dts/airoha/an7583-evb.dts |  22 ++
 arch/arm64/boot/dts/airoha/an7583.dtsi    | 283 ++++++++++++++++++++++
 3 files changed, 306 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi

diff --git a/arch/arm64/boot/dts/airoha/Makefile b/arch/arm64/boot/dts/airoha/Makefile
index ebea112ce1d7..b43138671ee2 100644
--- a/arch/arm64/boot/dts/airoha/Makefile
+++ b/arch/arm64/boot/dts/airoha/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_ARCH_AIROHA) += an7583-evb.dtb
 dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb
diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boot/dts/airoha/an7583-evb.dts
new file mode 100644
index 000000000000..910ceaa6af42
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "an7583.dtsi"
+
+/ {
+	model = "Airoha AN7583 Evaluation Board";
+	compatible = "airoha,an7583-evb", "airoha,an7583";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x00000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/dts/airoha/an7583.dtsi
new file mode 100644
index 000000000000..945b69365747
--- /dev/null
+++ b/arch/arm64/boot/dts/airoha/an7583.dtsi
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			operating-points-v2 = <&cpu_opp_table>;
+			enable-method = "psci";
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
+			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			operating-points-v2 = <&cpu_opp_table>;
+			enable-method = "psci";
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
+			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-size = <0x80000>;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	cpufreq: cpufreq {
+		compatible = "airoha,en7581-cpufreq";
+
+		operating-points-v2 = <&smcc_opp_table>;
+
+		#power-domain-cells = <0>;
+		#clock-cells = <0>;
+	};
+
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			required-opps = <&smcc_opp0>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			required-opps = <&smcc_opp1>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			required-opps = <&smcc_opp2>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&smcc_opp3>;
+		};
+
+		opp-7000000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			required-opps = <&smcc_opp4>;
+		};
+
+		opp-7500000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			required-opps = <&smcc_opp5>;
+		};
+
+		opp-8000000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			required-opps = <&smcc_opp6>;
+		};
+
+		opp-8500000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			required-opps = <&smcc_opp7>;
+		};
+
+		opp-9000000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			required-opps = <&smcc_opp8>;
+		};
+
+		opp-9500000000 {
+			opp-hz = /bits/ 64 <950000000>;
+			required-opps = <&smcc_opp9>;
+		};
+
+		opp-10000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			required-opps = <&smcc_opp10>;
+		};
+
+		opp-10500000000 {
+			opp-hz = /bits/ 64 <1050000000>;
+			required-opps = <&smcc_opp11>;
+		};
+
+		opp-11000000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			required-opps = <&smcc_opp12>;
+		};
+
+		opp-11500000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			required-opps = <&smcc_opp13>;
+		};
+
+		opp-12000000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			required-opps = <&smcc_opp14>;
+		};
+	};
+
+	smcc_opp_table: opp-table-smcc {
+		compatible = "operating-points-v2";
+
+		smcc_opp0: opp-0 {
+			opp-level = <0>;
+		};
+
+		smcc_opp1: opp-1 {
+			opp-level = <1>;
+		};
+
+		smcc_opp2: opp-2 {
+			opp-level = <2>;
+		};
+
+		smcc_opp3: opp-3 {
+			opp-level = <3>;
+		};
+
+		smcc_opp4: opp-4 {
+			opp-level = <4>;
+		};
+
+		smcc_opp5: opp-5 {
+			opp-level = <5>;
+		};
+
+		smcc_opp6: opp-6 {
+			opp-level = <6>;
+		};
+
+		smcc_opp7: opp-7 {
+			opp-level = <7>;
+		};
+
+		smcc_opp8: opp-8 {
+			opp-level = <8>;
+		};
+
+		smcc_opp9: opp-9 {
+			opp-level = <9>;
+		};
+
+		smcc_opp10: opp-10 {
+			opp-level = <10>;
+		};
+
+		smcc_opp11: opp-11 {
+			opp-level = <11>;
+		};
+
+		smcc_opp12: opp-12 {
+			opp-level = <12>;
+		};
+
+		smcc_opp13: opp-13 {
+			opp-level = <13>;
+		};
+
+		smcc_opp14: opp-14 {
+			opp-level = <14>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	sys_hclk: clk-oscillator-100mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sys_hclk";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@9000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0x09000000 0x0 0x20000>,
+			      <0x0 0x09080000 0x0 0x80000>,
+			      <0x0 0x09400000 0x0 0x2000>,
+			      <0x0 0x09500000 0x0 0x2000>,
+			      <0x0 0x09600000 0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+
+		crypto@1e004000 {
+			compatible = "airoha,an7583-eip93", "airoha,en7581-eip93",
+				     "inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		uart1: serial@1fbf0000 {
+			compatible = "ns16550";
+			reg = <0x0 0x1fbf0000 0x0 0x30>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <1843200>;
+		};
+
+		watchdog@1fbf0100 {
+			compatible = "airoha,an7583-wdt", "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&sys_hclk>;
+			clock-names = "bus";
+		};
+	};
+};
-- 
2.51.0



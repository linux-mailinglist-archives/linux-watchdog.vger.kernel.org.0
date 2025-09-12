Return-Path: <linux-watchdog+bounces-4243-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15393B54D42
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 14:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF03E16A698
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 12:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CF1320A35;
	Fri, 12 Sep 2025 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFpDf6/v"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B287301470;
	Fri, 12 Sep 2025 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678915; cv=none; b=S3Xyu7qrTkpLlzEr803Jda6X7XnpMzZ1eTcevjByoA1wF+y1cJuVcJmdFMa8U44vvfF33jN6DHxXS3q2ucAS6xkHZbEmkC97urNP9wxX/mJHZcFG0U0jUaosJBiTg0wbqUkUSp0cWAFxdxCfLsLZ9T+MGBoVKjkQubA23/rXbZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678915; c=relaxed/simple;
	bh=Y/xLnOvWrgoYia/dvIuxe9JbBGwmEs4sMATELVf8sII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DNkB9RjTJ1ala3mHUZUcK5iDYYse+P9j7TqX03rEAvdMJN6QOYVY2O1nqvYPI3ktT9jvKWrMU/DiBHds1kX+9cXU4a8sbnJOwVaeV24ruYPmVRYuhIdzcA2oDuLbGSxjRAjqAeb03qtkVocJ6HDYhiRZcwkaRgztD1/fu6vtJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFpDf6/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C488C4CEF9;
	Fri, 12 Sep 2025 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678914;
	bh=Y/xLnOvWrgoYia/dvIuxe9JbBGwmEs4sMATELVf8sII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFpDf6/vXJKgu9C+t3HaXigUZGGBHOlHz7Kt1tfBpNYo90CyPwsvXk+ZKnv5g0nxS
	 OEJk14rnhZ2TgDVEYoZkasfjHCIpcF+JuivMSG2AlLHE5l4cCe0ntilyyr41pJOni7
	 LLUGQq1slpPr+CVVcHeGDtCNW2dPHPNrh+fD5xzCLa6VnXGLKyXHpin28SWfVFPRgy
	 1n7m8BYhTZZW1VGOuiIpNHGgbTNwE5DYdzpsNI//IbvH79GZsl2mhzwHgXoy1WBDDn
	 jbOS0Qnw6yvTTqW970lC51W87bWq9YQ9BexK+7WL9eoK12wmbV7q4J3FrouB6gLqKm
	 SwBh7DI8SCRSQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: [PATCH v2 7/7] arm64: dts: ti: sa67: add on-board management controller node
Date: Fri, 12 Sep 2025 14:07:45 +0200
Message-Id: <20250912120745.2295115-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the node for the onboard management controller which has a watchdog
and hardware monitoring.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index 5755df689752..7f05df9111ea 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -416,6 +416,24 @@ vcc_1p8_ret_s5: ldo3 {
 		};
 	};
 
+	system-controller@4a {
+		compatible = "kontron,sa67mcu", "kontron,sl28cpld";
+		reg = <0x4a>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		watchdog@4 {
+			compatible = "kontron,sa67mcu-wdt", "kontron,sl28cpld-wdt";
+			reg = <0x4>;
+			kontron,assert-wdt-timeout-pin;
+		};
+
+		hwmon@8 {
+			compatible = "kontron,sa67mcu-hwmon";
+			reg = <0x8>;
+		};
+	};
+
 	rtc: rtc@51 {
 		compatible = "microcrystal,rv8263";
 		reg = <0x51>;
-- 
2.39.5



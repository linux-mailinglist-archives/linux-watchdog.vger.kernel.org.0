Return-Path: <linux-watchdog+bounces-1183-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6D913DC7
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Jun 2024 21:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABE2D1C20CE6
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Jun 2024 19:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A472B183087;
	Sun, 23 Jun 2024 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QvkfVibu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29A3BBE2;
	Sun, 23 Jun 2024 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719172311; cv=none; b=hDhOjyuJsgxuwrnTA1LDLqjxH/ibXRCv1NeEkgYQGCiESAHNxSFMttYsFqn4VjEzf2soOJaNhD5P4awS8H+GzJgCSLNDmbTHAyKQK36eMx/3KM2WkGpPfY6jrsHk4fmkPVo9acVOVzrBew9LQvhEilJ+9aplWtx4BFkZUiAldpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719172311; c=relaxed/simple;
	bh=8Njo9M75DV0GjH4h/w6TNvvqjYcKmboBOGAzX7BQcQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOoMtFnZUW+ZNg+pazAG+hwmA/kzKafbj9dFlQTKqYmlzNzvUTeoEVXKA2szavPnAXe+WbSYbsDpujaWYToI9O9FQNUAaXROSioyZiFhLXR+H6Vib3kjz7Ku6QPFxjzFH1tDvhov6k1kDfMHtoX0TFc6RXlVrLZJiQa+2ufTL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QvkfVibu; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 40D2A866F6;
	Sun, 23 Jun 2024 21:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719172308;
	bh=dpfBkKDlAcEhwV93vk51cBuaVNWU/9Hhy3ka4ffDuAQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QvkfVibup0Tqm/zvQ5PRjTg/CmAD3knrS0+nS/HR1IeC6uiXZulu5ZBBLiBm2lIQJ
	 bnofODM/5fzvQhFOIsOo++40FMuO3pryr2SVlgmBZWiXsKa4bvE5E0YjCV0yHBJM9q
	 1GCUOlqwc81X3N3E09S7lFa8bT9kE5WdTVLN5T+BwjvI43Da6AiXPwAvEp2ctr9ZGo
	 LsWmYn3xce3fHR3RuBKN+D+VhKFS7MSftQ20HA33+VgeEtH0XbiPU0Jbe25Z5t2OFl
	 7N5hrrX2F2Dz23Xxb3HnF8wjuvzxLZtIdo0Vnz4MXvZ4GVtStARnPuKPEdKs3IQItd
	 dNCrN9G2bSShA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3] ARM: dts: stm32: Add IWDG2 EXTI interrupt mapping and mark as wakeup source
Date: Sun, 23 Jun 2024 21:51:08 +0200
Message-ID: <20240623195136.81522-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The IWDG2 is capable of generating pre-timeout interrupt, which can be used
to wake the system up from suspend to mem. Add the EXTI interrupt mapping
and mark the IWDG2 as wake up source.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-watchdog@vger.kernel.org
---
V2: No change
V3: No change
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 1804e202eb425..68846699b26fd 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -355,6 +355,8 @@ iwdg2: watchdog@5a002000 {
 			reg = <0x5a002000 0x400>;
 			clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
 			clock-names = "pclk", "lsi";
+			interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
+			wakeup-source;
 			status = "disabled";
 		};
 
-- 
2.43.0



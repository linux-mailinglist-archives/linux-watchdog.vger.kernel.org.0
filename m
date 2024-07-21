Return-Path: <linux-watchdog+bounces-1408-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49D938599
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 19:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D6A281229
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 17:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9360B1684B4;
	Sun, 21 Jul 2024 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBspY1c0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D3168498;
	Sun, 21 Jul 2024 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721581767; cv=none; b=MfqtCGuTM+tyQDRDWVOoLheLbSjFa21XWwt3vgpuNUm+qmVJGdIOUMJiMliCXITkciEQsT7i7K8YQaUdFIpmv0BoL5xK+YL5uAE82JSMU0v/hpXof0EKDD7ylJeH+BtuXlECL0UqCWHuycn2CNvZIjje3vTJbzMptXK3+SQiYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721581767; c=relaxed/simple;
	bh=2um/GU8leukLyHCK06Z2T9a+Z9uUER35bwjofaOfLq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvMEGCVTDazQ9ILbO5U/K4Ya26YGUvqE3st8Q3tRgR8sD1p6eTbj7H+AJEA7GLx01/Sdb/cDMJpz+q6TztS8y3N0anCYDLmDW//eKrB7MrPY39SrObyNWrcQDPFMhVsmIcJqpV0Xlm9cJvaAFGSwOI1KCMkOZwG1kshvP1bLetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBspY1c0; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-807007b8dd1so145110839f.2;
        Sun, 21 Jul 2024 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721581765; x=1722186565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJbtHFQcNPBsqXeFfU2FjoOsfer626zKkq+lXutNICI=;
        b=HBspY1c0LXij68jTV93VyaIfIyMpENfFWRudFmQWlHTcien7goCD4O0C9vFzf0k0Jj
         bHNlcIilOKN8PNEikXDUKdCYvGZDSBKo2HqTZag5p0rHDIXPkZRQ2Shb/Ld+MOgtgkqG
         Vdu8PZErE6B42BuHKLekLH5SP7wKQHGtTCwtwWdvTVG+lDy1bOr2qbkrlW8CinBGM548
         /p8ZqPcacvFcevSIE7jDoOjmEyO0urIfA1gduD1QK6C4gd0wdpvEJr0Wwf+laWZehqNn
         iIoELiLY1DQmOX9k5uFj+mvPzkKfrnBQe28TThPkcjzSuCWZzMVQ84jTtF4iE7KK8wAJ
         AiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721581765; x=1722186565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJbtHFQcNPBsqXeFfU2FjoOsfer626zKkq+lXutNICI=;
        b=GneRPCMsKNmgbUA4LSChk7GBDQKwbn0x2SLDgvPd+TRPddzXhOAfkp9VyjmGzD0k+O
         chufpKR4F4VKbUM7hmpQzR/HNBHyDDzMrQTSJdq4ga326+i9k5Wi2ALArLcAMoYINE3S
         0TSHqrTVjTmElzdgDs9cX4DdRNbkmNHO+02Cr6WhkiwB3EfjGmnvxALL8xJvS6zs8hda
         cdfgQ3rwKo0eK2aKfVnGs+b41w90LRCyS7xntlu7cRBD3RpEsrUkuLq760fzpwAvQc9x
         WAs3KKqkZmnMDvkL+XBvY1/qMm3+pNi3SM9MQrE9BzzDkQdetHS6IbX6tyScF8eqigpe
         JRYA==
X-Forwarded-Encrypted: i=1; AJvYcCXATLBd3NS88LzRCPWuU73VrBQp3p1HD6QBBaZ6otffxkRVIalvmIEyQUlxFMwGzqN80XUxRY2ck9vf8SmPQ8ovXoxGWpAquy0hXCPbfD7XMHuUIzrJ3SkJIi8noFH/RkzXAvBeuj/VdV82A1M=
X-Gm-Message-State: AOJu0Yzqtr5+AM2vkQedyzZsFj8BrvBxH3dE3UDqGA0U39FVNZpGBKDP
	whX4Tuh7NO9OlvMW4O0TDybSjNF/EU9yu1GaF7rzefbIqbyaNWkz
X-Google-Smtp-Source: AGHT+IHTUuDmrSkpDNTCs+DM7fkQIf/sYoD1C3wpPlVfiRwZYjxYuCgZLbQbZW5lfAz3EpEk6s1CMw==
X-Received: by 2002:a05:6602:6422:b0:806:31ee:13b with SMTP id ca18e2360f4ac-81aa538d525mr787891739f.4.1721581765062;
        Sun, 21 Jul 2024 10:09:25 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:312d:f66f:2b12:abd:60ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d285943e3sm417810b3a.213.2024.07.21.10.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 10:09:24 -0700 (PDT)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kousik Sanagavarapu <five231003@gmail.com>
Subject: [RFC PATCH 3/3] ARM: dts: davinci, keystone: correct watchdog nodenames
Date: Sun, 21 Jul 2024 21:58:36 +0530
Message-ID: <20240721170840.15569-4-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
In-Reply-To: <20240721170840.15569-1-five231003@gmail.com>
References: <20240721170840.15569-1-five231003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using "wdt" instead of "watchdog" for watchdog timer nodes doesn't allow
for validation with the corresponding dtschema and gives errors

	$ make CHECK_DTBS=y DT_SCHEMA_FILES=ti,davinci-wdt.yaml \
		ti/keystone/keystone-k2g-ice.dtb

	DTC_CHK arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb
	arch/arm/boot/dts/ti/keystone/keystone-k2g-ice.dtb:
	wdt@02250000: $nodename:0: 'wdt@02250000' does not match
	'^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id:
	http://devicetree.org/schemas/watchdog/ti,davinci-wdt.yaml#

Therefore change "wdt@" to "watchdog@".

While at it, remove "ti,davinci-wdt" compatible from the keystone dts
code.

Signed-off-by: Kousik Sanagavarapu <five231003@gmail.com>
---
Question: Should "wdt@" be changed everywhere in the dts code or is it
only a requirement of validation against dtschema?

Also, I'm not sure about removing "ti,davinci-wdt" from the keystone dts
code.  I'm thinking it is only there so that the driver code can get
information from keystone nodes too, because it seems that there is no
code for ti,keystone-wdt.

So question,

- Is WDT Controller driver for keystone not written yet?

Or

- Does the WDT Controller driver for keystone have the same
  functionality as one on davinci - hence leading us to simply do

	.compatible = "ti,keystone-wdt"

  ?

 arch/arm/boot/dts/ti/davinci/da850.dtsi         | 2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi | 4 ++--
 arch/arm/boot/dts/ti/keystone/keystone.dtsi     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/davinci/da850.dtsi b/arch/arm/boot/dts/ti/davinci/da850.dtsi
index 1d3fb5397ce3..89055ab87256 100644
--- a/arch/arm/boot/dts/ti/davinci/da850.dtsi
+++ b/arch/arm/boot/dts/ti/davinci/da850.dtsi
@@ -525,7 +525,7 @@ clocksource: timer@20000 {
 			interrupt-names = "tint12", "tint34";
 			clocks = <&pll0_auxclk>;
 		};
-		wdt: wdt@21000 {
+		wdt: watchdog@21000 {
 			compatible = "ti,davinci-wdt";
 			reg = <0x21000 0x1000>;
 			clocks = <&pll0_auxclk>;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index dafe485dfe19..884402a5fe4a 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -610,8 +610,8 @@ spi3: spi@21806000 {
 			clocks = <&k2g_clks 0x0013 0>;
 		};
 
-		wdt: wdt@02250000 {
-			compatible = "ti,keystone-wdt", "ti,davinci-wdt";
+		wdt: watchdog@02250000 {
+			compatible = "ti,keystone-wdt";
 			reg = <0x02250000 0x80>;
 			power-domains = <&k2g_pds 0x22>;
 			clocks = <&k2g_clks 0x22 0>;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
index ff16428860a9..f697f27edcfc 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -225,8 +225,8 @@ usb0: usb@2690000 {
 			};
 		};
 
-		wdt: wdt@22f0080 {
-			compatible = "ti,keystone-wdt","ti,davinci-wdt";
+		wdt: watchdog@22f0080 {
+			compatible = "ti,keystone-wdt";
 			reg = <0x022f0080 0x80>;
 			clocks = <&clkwdtimer0>;
 		};
-- 
2.45.2.827.g557ae147e6.dirty



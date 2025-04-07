Return-Path: <linux-watchdog+bounces-3222-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D79A7E7D1
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 19:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034D018914DC
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 17:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7605D216396;
	Mon,  7 Apr 2025 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rwrc8pEi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2120720E710;
	Mon,  7 Apr 2025 17:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045458; cv=none; b=ZqIsl5TKnp0tq7MeEq2s5ATPHg9WyA1s9cynixBvVcL/B4KZugqRXWhRE/i4RJHDOINkaMw75OKr7FEuSgJ6EYLMh5ifHbk8DsqZ73ImLVTc4k/T2lDZRzCsSGwl1udyw0rbV3qA1iN6eAiS8OdWqRYm0vuK2ai9KYU5FnBMZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045458; c=relaxed/simple;
	bh=tRptGN2VQPABYmQRjkXlVB+K4J3JZ0Tn+IO1aqrnPOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnnNkAkogAgeOncqUsV3I0tISWzjgDqwFbt5NQ6ByLR2X1VPv6fmiQxc404Jpy7RfaoQ+I/lbHzBJTqI/FYFCYlJrxnjrJkvK97ezIXN7BuGnLiyioVs6AaEPp3sFsScdQ0XtSBVidTB/vyoB/cM1iZsm78EG6o/6fFEDjUyb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rwrc8pEi; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8C64444DB;
	Mon,  7 Apr 2025 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744045454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kV0hNGa1kjTexXSzZvvxQHVpZ7ZxlhipHFtypistnyk=;
	b=Rwrc8pEi9w3IJsiFWw7xMMJrtOAQb57PCw3vrXfS0MlkcycvcRHgmhrPKDMsjSub5F3vTd
	uRGoTNHgKqEdn47O79JfcPbZqY6JRiirOQbFMGEQ3FKUWG7H5rVu34eLp+I5rAgnFc99B4
	PMBadNlKvoJFyq1POqrdhhf9VBA2TJIzM1ESIhiQf191IonXXdYCgMFHrno2eob/NPkMb0
	7yROdcw5QBcOnxYItl15e38xFGF8PsNd5vTqRNfgpFcMdXGUO5a6yLrZxPDiDIULquJhF8
	EnTi6w5B7LphQ5ezzbVzPN9FDIGYKf4NlbfwZcoORwgbvRO87foQnhaPwfmCCA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 07 Apr 2025 19:03:26 +0200
Subject: [PATCH 2/2] arm64: dts: imx8qm: add system controller watchdog
 support
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx8qm-watchdog-v1-2-20c219b15fd2@bootlin.com>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
In-Reply-To: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvr
 ggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

Add system controller watchdog support for i.MX8QM.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8..edd1201eb6c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -352,6 +352,11 @@ fec_mac1: mac@1c6 {
 			};
 		};
 
+		watchdog {
+			compatible = "fsl,imx8qm-sc-wdt", "fsl,imx-sc-wdt";
+			timeout-sec = <60>;
+		};
+
 		tsens: thermal-sensor {
 			compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
 			#thermal-sensor-cells = <1>;

-- 
2.39.5



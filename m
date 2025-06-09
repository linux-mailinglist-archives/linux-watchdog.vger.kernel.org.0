Return-Path: <linux-watchdog+bounces-3648-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D482AD1D1B
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Jun 2025 14:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 023C9161F44
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Jun 2025 12:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014AE254AF0;
	Mon,  9 Jun 2025 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ljoFAD+3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0061E98FB;
	Mon,  9 Jun 2025 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471767; cv=none; b=nVF3PFJRcaQVNpyO4jkpM3KQZc2BOFf6CxApvIdGdQmeI0jWlg9m4ytgMuD484u+rJM2YVAz4GSJvDdZdtQ6mnmTBKsiV7LBZckL37wQX69wZRkvSDffFY4DmiehRjj3wGmpaI6k1VA/5/Y4ppVXff4zHcBlSpp3gAMrDPGkpgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471767; c=relaxed/simple;
	bh=6l8ZTjY0d0DnRF5BA8fJMCrXwBY8OOHKBBbx8rUjqyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A7fHjBpyHlk3FfU+d7dKThH6hi9B0WZ69ZemQTIMuTKM5x3BuVvTH8+ZSh+pTU7aJJjO+s1Bea22wkh7bLvz8fWJrQm/+NcudtIrafe7R8OSYyRcL4hnbk/rmWgReB6xxCkp7YnfIpWBpOi5naZIMGjr0NVfKr9cz6pK+ckZjgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ljoFAD+3; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 95E9E58052E;
	Mon,  9 Jun 2025 12:02:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A901243280;
	Mon,  9 Jun 2025 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749470564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hfNgM/UwK9Bgs6Z72i34/JIUtkeJLfZjGuO9+tnxnH0=;
	b=ljoFAD+30tSZSx407+2w+YNK1fKSnD3cdTADkIFdznx6Rt/JlyhivF0fVhvp2IPAfRttnx
	4XMFp8fcOrGTdM/valSvUkptmZH4+/E2gWu6M10YK2vX7bQztIc+WLyMJjhBMe/mMH8FwC
	BcyNvFdPsVHWLxxArDn+0i5sVArRnHEfsr3Sm23MyzqZoTBme1lzWFHSSQsZd5YY4Owr6a
	rZ4nlIJ1ye7QGZ4cEonhqEZvyVzZ/OiSCkLu6xJdgzSLwdI3wH1u0KlQbnTC39B/lasPAP
	CHLZ/MpJy/VFzNgHfqV/3+T1Z4pBc9FBIqErUz5FBSawySGjltulFdGgXedaeQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 09 Jun 2025 14:02:34 +0200
Subject: [PATCH v3] arm64: dts: imx8qm: add system controller watchdog
 support
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-imx8qm-watchdog-v3-1-5c22618606c8@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFnNRmgC/2XNQQ6CMBCF4auQrq1ppwXBlfcwLkpbYBKh2pKKI
 dzdghsNy/8l881MgvVoAzlnM/E2YkA3pBCHjOhODa2laFITYJAzYIJiP5XPnr7UqDvjWlqXohB
 CQinBknT18LbBaROvt9QdhtH59/Yg8nX9WpKddlbklFFgGnhV87wxcKmdG+84HLXryapF+BG43
 AuQBCkrKHJVGSXtv7AsywcuBI9e8gAAAA==
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
 Oliver Graute <oliver.graute@kococonnector.com>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiveefueeiveffvedvfeetvdfhkeeuudefkeeuffefgfekudelheeiffduveeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemuggtkedumegrrggutdemfhgutggrmegttgdurgdphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepfihimheslhhinhhugidqfigrthgthhguohhgrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

Add system controller watchdog support for i.MX8QM.

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Third version of this series. I just rebased it on v6.16-rc1, dropped the
binding patch (already applied upstream) and took RB/AB tags for the
devicetree patch.
---
Changes in v3:
- all: rebase on v6.16-rc1
- bindings: remove patch
- devicetree: take "Acked-by: Oliver Graute <oliver.graute@kococonnector.com>"
- devicetree: take "Reviewed-by: Frank Li <Frank.Li@nxp.com>"
- Link to v2: https://lore.kernel.org/r/20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com

Changes in v2:
- bindings: take "Acked-by: Rob Herring (Arm) <robh@kernel.org>"
- bindings: take "Reviewed-by: Frank Li <Frank.Li@nxp.com>"
- devicetree: move the watchdog node just after thermal-sensor
- Link to v1: https://lore.kernel.org/r/20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8..11527050ac8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -356,6 +356,11 @@ tsens: thermal-sensor {
 			compatible = "fsl,imx8qxp-sc-thermal", "fsl,imx-sc-thermal";
 			#thermal-sensor-cells = <1>;
 		};
+
+		watchdog {
+			compatible = "fsl,imx8qm-sc-wdt", "fsl,imx-sc-wdt";
+			timeout-sec = <60>;
+		};
 	};
 
 	thermal-zones {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250203-imx8qm-watchdog-b8363342842e

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>



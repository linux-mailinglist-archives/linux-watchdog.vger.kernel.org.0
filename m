Return-Path: <linux-watchdog+bounces-3295-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F6A886EC
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 17:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7803919066DA
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 15:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864B32798EE;
	Mon, 14 Apr 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OO/7IjbV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DE279788;
	Mon, 14 Apr 2025 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642694; cv=none; b=Nf9PP5FcnxP3miQ4ISSmJKZXuCCCXahMExHTlF8Yph+3NvupM8JJyhPb3Gv+Wa+Z1zU97xWOL0RauR5CghsPNk9gkFnrKjIjbNLGRTn3cnTHAKbBYSqn6UET8vCptBtCp+1pBBi3yF+4JOPUKFqD/CLWSi0Aq9O2EzML1Ugy1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642694; c=relaxed/simple;
	bh=55tWICBZ8y2Traciy+f7Py17nBWym/iZSkE7S5JD+9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pb1m9fO8jjAhsp2hnST6NzDbuWE0nJvTbn241odSH+VWKnLmIh/X5MUsQ5x+Vysh4tz9KsPU44SyyIVNKA28earHxqfZSSbzyTN8u+sy46E/NRESIqQ13goqKk3YTJigcIRh+RbaY9ekp0aruJ5DoKrVQOty7x4N9O+9iTRLluA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OO/7IjbV; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C694843873;
	Mon, 14 Apr 2025 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744642690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VzojeLzRzjGTLGMyfYp2jFx4+LuKjP4OXY5FtffKGh4=;
	b=OO/7IjbVfrVk6xAWP4rf7KxCg/QeTbSKDvEfKBRJAl6Y5vRQk+0Lz3H8QauGfslmII75u5
	w5k/Z3r6eM42Po5LBDv63KZm3SnpyUl4y6Ha2Zqw7YZq29I+7RcX8T0iP1HyB8Nsm1B+xy
	riD6zdJ4/hOtdi6brtCRNUkRdtiS5kDPF04Rc6RC2vJIMqufogSbSNqA0AxQ7VGU+ve3n9
	2CGn9um/ssi5hxo8U1gG/lquGb5/s1JbsqW6TPY2vrjyYJQfzCyS2qZiwxFejy/i6qGqQJ
	+SNq/8dVmAlrt0TfQQsdDescE2NBcC0M6e+jwUHmfQQXZK51shNo8WAnp83dfQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH v2 0/2] Enable watchdog support for iMX8QM
Date: Mon, 14 Apr 2025 16:57:23 +0200
Message-Id: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMi/WcC/2WNyw6CMBBFf4XM2pp2Coqu/A/Dgj6gkwjFllQM4
 d+tuHR5TnLPXSHaQDbCtVgh2ESR/JgBDwVo1469ZWQyA3KsOHLJaFjq58Be7ayd8T1TtTxJWWJ
 dooW8moLtaNmL9yazozj78N4PkvjaX6vk579WEowz5BrFRYmqM3hT3s8PGo/aD9Bs2/YBqPUHF
 bAAAAA=
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
 Thomas Richard <thomas.richard@bootlin.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteeijeduffelvdevuedvieeuvdeugfekgeehjedufefgkedtueduvdffhffggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopegrihhshhgvnhhgrdguohhnghesnhigphdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlr
 dhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihimheslhhinhhugidqfigrthgthhguohhgrdhorhhg
X-GND-Sasl: thomas.richard@bootlin.com

Second version of this series, I just took the Acked-by/Reviewed-by tags
for the bindings patch, and in the devicetree I moved the watchdog node
after thermal-sensor as requested by Frank.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Changes in v2:
- bindings: take "Acked-by: Rob Herring (Arm) <robh@kernel.org>"
- bindings: take "Reviewed-by: Frank Li <Frank.Li@nxp.com>"
- devicetree: move the watchdog node just after thermal-sensor
- Link to v1: https://lore.kernel.org/r/20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com

---
Thomas Richard (2):
      dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
      arm64: dts: imx8qm: add system controller watchdog support

 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi                   | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250203-imx8qm-watchdog-b8363342842e

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>



Return-Path: <linux-watchdog+bounces-3220-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155EA7E7D9
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 19:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD27F17173E
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 17:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE80E2153D1;
	Mon,  7 Apr 2025 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jdNWS3eA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764A3207A03;
	Mon,  7 Apr 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045456; cv=none; b=N1fUcvB3MY2THmKsHGUqCnTI2DmOlgN4H1qafcJChcmSL7bAf+j536dz4uoAlymI84pRFpirn2BNktfbo0yUqURgbpVbqnsf3+uv+mdbMiL3gP11piG46Psj1LnfwgfgGIKBg7fl948b3LknRxtUfSOX1RO+qzFESDcyc0MGLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045456; c=relaxed/simple;
	bh=yggQFWFRbrQl0OHOHQUlsGpk2eVvkmkZ4x2GDNoZnRA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kydApnqXeelEhpFsEeqCV8vw6dOc+J8/V+eCw+ZAmPESPnDw/iV1Wk0fwIYRpLoYhGmKoA8zAJkJe9ywkdLWVe6d4Pi8faZ1G1kSveiALGrSI3ydQXA1lgEnje7IrEjvKs/88ORGsrsWk1LZ51UrHDg/MClC0S5S+dQp2g/W0j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jdNWS3eA; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C35D244366;
	Mon,  7 Apr 2025 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744045452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qz4r6eDVVqJGCe/oy52NXEZSAO5/dgEgwwHQac9esXw=;
	b=jdNWS3eAIVArEu3C92X0nLhisMf4z4c8bYFhix+J1Qj0TNzESU4h8CxN8OWce2xCtdDWBN
	OS0sz31DbWeuKlBZDDMCKq7KoZXHnfLPZBvxgIMVMPfaj8VrnIokQWjwBXR+EBakqal8rZ
	Tdo10z2GbkFertT9xhX9LC82+lmiFkVRprNxSDIVfgBK241oecKMKlpNgU6D8JAuCYVr4u
	ExKlLlUuXRjdGWAimloPO/X4qzYOJk+/7hWCC+Z0DxC1R1O8vTTb/R/WBL6Eq/+vz+r74R
	sy07XEZcpLurONERoFmZ2nTktPWtQrJdeBpZqOpyoCTCn9jPUmyQcT0BVhMCkw==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH 0/2] Enable watchdog support for iMX8QM
Date: Mon, 07 Apr 2025 19:03:24 +0200
Message-Id: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwF9GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3czcCovCXN3yxJLkjJT8dN0kC2MzY2MTIwsTo1QloK6CotS0zAq
 widGxtbUAZHZNlWEAAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedthfettefhfffhleefgedvveejfeeufeeflefgvddtieehtdfggfeileegjeetieenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggur
 dhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

This series enables wathdog support for iMX8QM SoC. The first patch defines
a imx8qm compatible, and the second one adds the watchdog node in the
iMX8QM dtsi file.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Thomas Richard (2):
      dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
      arm64: dts: imx8qm: add system controller watchdog support

 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi                   | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250203-imx8qm-watchdog-b8363342842e

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>



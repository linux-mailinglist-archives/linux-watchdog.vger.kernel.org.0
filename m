Return-Path: <linux-watchdog+bounces-3296-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F50A88644
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 17:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F28162EE2
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Apr 2025 15:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E97279901;
	Mon, 14 Apr 2025 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jEgj8UhR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256A279799;
	Mon, 14 Apr 2025 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642695; cv=none; b=odPwFbJyLdDM8Y5NQk6o7JUuoVZKSkWgUorQqb2yWV900uZOcrNkeOenAndqn6UOZsHYxEgCb3VWh7GMIU/A043YnWYKdtEbtlR9CmrR1IdRmQkfBxMG8KvTGhtR3834dIDu/nNJHYt+MxWRdrDu1214SFwlajWK3nZ98r6i9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642695; c=relaxed/simple;
	bh=HnWdRd8KeQ+s/gjGs0Kg6SNGl/zqjif5JRIu6mpd0ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uH91hqmahf2cCOaJ7qpPY0DAgsMg0gDqIIWmDkH6rDP5Ombiiz1RhtWIZz4Naf1HG/RkOtn0PA23WWwcAxisb0z7fXCVNV/+gODdDT3Ixc3E03347fdDwt0MkK1pAzkmsc/R0QtRTcVjyIGigFZmsjLjw+iLgKfFQD3/SNwH2Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jEgj8UhR; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60A0943877;
	Mon, 14 Apr 2025 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744642691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Idhf1uOsxb4cE5b6JOh6FRZQbEx/EZXJ6igyZKGQdnk=;
	b=jEgj8UhR3xu+s/UuoL/jT+QRloa0sejM3PND5K0/lOpr4zEucvObwXfWKQfcFE6gN0+2iw
	EdQk8G/yUMpRPCp9tZ0Ym+prXxiQ5Jpngups8hMPD65Yf8+691CY+bCXLHCI+2ZgYCRdwg
	5Fm473NEd53Xj2EIeSmaOplqnOMVWqml29cuyZwN/hr6C49RSYXswG6rHC71foXQpdR8b9
	0K8NZG8QFcpUfZk0YpKxW+x3MCSZXeVDqnHkxSgjCnBVrygyrncdwi5emPmgYJSrgiSqy5
	g2O9j3LLOylKDkhCwLrfDt3U5f8Bv5BSCSBMeyDQFiOevORTs4ms2PMtZJnRHQ==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 14 Apr 2025 16:57:24 +0200
Subject: [PATCH v2 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
In-Reply-To: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprghishhhvghnghdrughonhhgsehngihprdgtohhmpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrgh
X-GND-Sasl: thomas.richard@bootlin.com

Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
watchdog block.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
index 8b7aa922249b..1d9f15ec6657 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl,scu-wdt.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - fsl,imx8dxl-sc-wdt
+          - fsl,imx8qm-sc-wdt
           - fsl,imx8qxp-sc-wdt
       - const: fsl,imx-sc-wdt
 

-- 
2.39.5



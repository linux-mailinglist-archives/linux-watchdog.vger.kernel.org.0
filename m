Return-Path: <linux-watchdog+bounces-3221-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E217EA7E7DC
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 19:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B36113ABEA0
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 17:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79156215767;
	Mon,  7 Apr 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PLcj/GgI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B442153C2;
	Mon,  7 Apr 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744045457; cv=none; b=HHXd9AiDkHMbbYjNTH7eFbWnsSbNsxdF+EqK5yVPkM/hIVl4giXmZPU+U5+1LNbDFZKD5IYMhsBbVpBG9eHiAjxybYb1FKbtAJfgeWc8CdgdDzWnTqv/wL6gzk1alpDkuQxKdS5dt8BxnY0RUMPY92RpovcGXmZzJy1H6urfBYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744045457; c=relaxed/simple;
	bh=/l13s6aygspV20Xa3mZzJZOvh/TAbK0zV1pyko1vzBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IM38FKEqiLC7VEslhtFnb6s96EnkSly7Ya9+y1XMEGaZXztIIpx8xKbirZ1kWSquPfaoJ4EMIviAKGUry77oShahrbyTOnGetPAeH5I3a9XyPD7aYy1WLEJ5rNKd+RT8zHBYrQUGw6TtxxOtVBKMxT0IRTVIF4LqGz4fF8HrHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PLcj/GgI; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E38D9444D7;
	Mon,  7 Apr 2025 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744045453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KnO3es45UTLkftum7NUaaMCWaK1KKXAtuBnraxJuJY=;
	b=PLcj/GgInpfzrX5Zzqtqa8joMUfDBp3WDL74t0nbyUARrE6bl6IKviOmfgf7HwY2Mcs4m8
	QH0QF6gll11QPKVRSFYoRiLqk5QTR/g10yMjEid+s1/quX9zicutv+a9Qoc9M35HCvcVkq
	c6HXXEZ3O5Ji4GKGJDdxt+m+Ua7HbfD4ibHqsMxHji1hricm+0YsjbSW8vZLV9ynAKRcUP
	DRwqSV+GbmTErZwLHUwc/6iDyVjiZmAcurV2EKjbawYyWgG5oRRJ8ATYLpk4o0sZ9PVeZt
	ILe5OSVtpZVD6Vl2B2Iv617MKE7s3Znp8vuYo555o8b4+1HHjlnBIA3kzBcuQg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 07 Apr 2025 19:03:25 +0200
Subject: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
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

Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
watchdog block.

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



Return-Path: <linux-watchdog+bounces-4748-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2DACEBE58
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Dec 2025 13:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F75C300DCBC
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Dec 2025 12:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE903168E9;
	Wed, 31 Dec 2025 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="mD/YrANf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HGmxJZSL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D32641CA;
	Wed, 31 Dec 2025 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767182849; cv=none; b=OwjHZlihwHTqTDgUeOkC82zDypxbMi9w/AbbJZXxnOcBd7ug8OIdGfn+GXJhsaSm6zPFsRxM/cI0kNLXVXD+gQNCvDIrAM/sCU8+pFdsjFiK/SNEmksYYX9eGmp1kdK3Hx9SO/klxaWzSLBxUanra/t+VgBKlkI+Ybj+/LEDSyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767182849; c=relaxed/simple;
	bh=vjl+69Y7fxj8I0QaXAqrOw68C+ZGqOU22KG/HJFgJ/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rb4fpkfRoxaFTr40EaPJIHuUdYKxsC9soAEzemS5UloKIcgkMv9B+1DaFi8YkWBVTR6u033X/mbF3arP+5Lr+/kCFOV73XeDPi3ubHnSLm8AKZ0CO9lr8jyL8QKjIvzWPeK7BacWgSqV9nRe9Hr9TIAf4UuXArprcn7h7jcz/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=mD/YrANf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HGmxJZSL; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id D98931D000C0;
	Wed, 31 Dec 2025 07:07:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 31 Dec 2025 07:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1767182845; x=1767269245; bh=Fb
	O7EqdF+KVmZQo9uR+0FgHo+CoXl6nilB68rvFnOsI=; b=mD/YrANfYLsIAQqnQl
	rhCEnVLiXv9wKHIZlkYTOTqbFzwBNcyio+aurNwg/XTVqD32ncrVzvAf9R93IG9V
	pdWQzu/aIaA8Wg7vsW2v+ztsc3g7ByJyo4jBxRe/r8UOleewDk45HXF/tQTNWXy4
	jb00tFpn4KGr9N6qDdT3+5cGUdlks70lyN1jMtkYRSULVuT4Vk3XGca9qAzTzXMT
	sTpbEYpa0A5UdSMrRmNeufcxBKM2L8tMd9X6S0XOGOoTsxkLYv4tiwu+JYSzRb6N
	loiVc749eq1pXDRegfovwmu6ghtJ/ww4Ng0lt1BByRPu26VgQlIAZX8rpeDRygn3
	/5ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767182845; x=1767269245; bh=FbO7EqdF+KVmZQo9uR+0FgHo+CoX
	l6nilB68rvFnOsI=; b=HGmxJZSLdw/MQI5YPN/Vrxb7Yoiwed9Ekpvxi6tgSE3b
	EPcylqhimUNshocMxw4AP+58qrxAJeZ1vwz6OhGuciQtBphTtRymf5hen7E5fIHw
	x8MmSzcnvnE3YcqnjhT3GMj5XVdPQDWMI91o3afbwiS/SilDXPTQIYYn4GdwN8z+
	NgBE8e9Gh/L5ta3ULs+1b2ZRjNNik2bAd9xMgX7xUNdQG+3dy2sX2OuFK4tzPQ1l
	gGPDRVeYd5oBXg7c50yhWpmhIVDXTwcgeAVSUMs2ryoxiLbzJ005aBZehWpS4An8
	wAzX+sz15K3uefRB0ncKHGwmr4hBhb7TzqNSTYr8+g==
X-ME-Sender: <xms:_BFVaTtmxPPOGQNyCcksu1fYnBg8Kq9mLJl58goTtGnnj4Dh1b2PbQ>
    <xme:_BFVaSsPVQkrZmM3_FBsmCRUR-dTKpmSYJTvY5GYyNzla41qLlLwjmL2k_KYQJOJ1
    Vfen8BrtwgvSobkUdk5JjETmhozSf67FbyJWVouzhr5QK2oTtOOkE8>
X-ME-Received: <xmr:_BFVaQFbyqEtG_GqWjak7TqhUoE42N-kLQJcAyr0a0JqBwu1Vqc5X_q5oDbE5lAyojpgGQ9_6xeCjRNA0_rOQXPkEwJ7cwao76Deeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
    ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedutddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdgu
    vghvpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigsehrohgvtghkqdhushdrnhgvthdprhgtphhtthhopehsvhgvnheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:_BFVaVN4vGpo9hJisRHtaVo7IgHFf2QtqlV9MnHDIbOXKH0fPBp31A>
    <xmx:_BFVaXLoqHwAMnyWik9jY9smiK1DQXQOJ6iCBv7PJoUQA7d4PuxNYg>
    <xmx:_BFVaW_PCreJWFbWEBARUnEUYNNxsCwlqY9GchEIgbak-gRDu6ILvw>
    <xmx:_BFVabFFneqBzUcuP4F5JiaVX-g9K4eWQrvksTSvKDCCukHgh8q2Pw>
    <xmx:_RFVaXg0bTOtf_NW1Hksq7VIbvnRGPeqGj4AxPCd8YlCswgRlDU7dHuf>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 07:07:24 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 13:07:21 +0100
Subject: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
X-B4-Tracking: v=1; b=H4sIAPgRVWkC/x3NQQqDMBBA0avIrB1wEpTUq4iLMU51oDUhCW1Bv
 HuDy7f5/4QsSSXD2JyQ5KNZw1FBbQN+52MT1LUaTGd6Mpbwy8Xva9iQY3wJFkedxYWzoA/vyAU
 dD8bKw1laBqiZmOSpv3sxzdf1B4pYdBtyAAAA
X-Change-ID: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=vjl+69Y7fxj8I0QaXAqrOw68C+ZGqOU22KG/HJFgJ/w=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQwd/F71fsMdP4t1plzf2X8jnZZyvyqySz9kg+tvCP2
 v7AIu9hRwkLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkUqjP8M3oUoFi+0W3thrmn
 cvR81VUUPgn+yGTzP3arY9n1B0VMZgzfk75vzxL+IXk5JLJxAmt5xH15rqJLe5+rztq4ZHW60G9
 OAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,wdt" anymore [1]. Use
"apple,t8103-wdt" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
Cc: stable@vger.kernel.org
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
device trees in [2].

2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
---
 drivers/watchdog/apple_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
 
 static const struct of_device_id apple_wdt_of_match[] = {
+	{ .compatible = "apple,t8103-wdt" },
 	{ .compatible = "apple,wdt" },
 	{},
 };

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6

Best regards,
-- 
Janne Grunau <j@jannau.net>



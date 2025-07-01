Return-Path: <linux-watchdog+bounces-3777-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A9EAEEE45
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 08:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE889441B97
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 06:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35B725BF0E;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgG4L58S"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C0258CF6;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350019; cv=none; b=TuVSpe+yhXTQK5KE5GKa5SIIVhi6bPuNJrb6drLoF/hzXGmJEDbj6qibZl6iVpo0c6cO4GGK5wnn6sBR15zyqp+FWmb2qo1mo96Tkh9Asvw0u5/TdxwA8jtVFIau3nWCIYOnuPTOgbuEFBkto6OwoPwEhhWTqD/UQzADwVcedJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350019; c=relaxed/simple;
	bh=cP6Lq6jpJkdcvfMIsF/fYAfvDAiLKuZsiQzqKKoiKNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbr3Yxdguk+03fG2gO7hrlTrLC3MJ42myqdqv7jRKCv4bCQbycIRXjD74w18i/ndsb1/Z46IoS4ovxK69w/0ceJBR8v5vo3rncsziMAy2PhCnEG6x7kv74PMJbK8DXbJXII5GUiut+YG4dcoOI/ot935w8hXKirLZMwUDCE95GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgG4L58S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCACFC4CEEB;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=cP6Lq6jpJkdcvfMIsF/fYAfvDAiLKuZsiQzqKKoiKNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AgG4L58S+5ZNnD8Kuy1pqYa+RIt0Z0R8CovnYpM6RLC3hgs7ZBEUWXdlpTrmpB8Lq
	 z+UWZDdA6MVZUi2y0opN4dSH1UlRDIpObqDcZYaJLddzXBIKrd9YkAaAFx0gobw6TN
	 HWUYdUsZ+SChkgVlRTkzNsizzTedF979nONdtqEaSpIqM6GGC4Zvqb2PM4UcbAvuSJ
	 oZ7QCfBGWHy2gdGlmGPM8DOELjsyFzBcJi5c2hfSalBQv4lwJOdHZ11eDMysmMsrYq
	 NB4qHIjESiHb1I488xqpErveM1IGTslqk61IMu1fcUHnFlSLkUlXU6bh6vAZYumqOU
	 OOVc9U1ORMW8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50AFC8302F;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:07:01 +0300
Subject: [PATCH v3 07/11] ARM: mediatek: add board_dt_compat entry for the
 MT6572 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-7-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=775;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=TTf1Z4DEkN2KuGjaA/z7S/kMu+5ZTEL7ASvdrc16qMQ=;
 b=xd/j9mBuZU2R2JuAmPZuXDL3e02qBWr2Ho5WZgkJ1Sh1VAWOqjBXbCWOUO2JuUlGSJkw15Fu9
 zO6bptXVVxODTwmSNdr+B5JSMGK9wqpjIxLCDnAvJtq/tyVA3TlGWG9
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/mach-mediatek/mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
index e6e9f93a1f01c7d043cf4312b9406b25c8897198..5c28124bd0078b31665fef647e496f4131b82c8d 100644
--- a/arch/arm/mach-mediatek/mediatek.c
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -38,6 +38,7 @@ static void __init mediatek_timer_init(void)
 
 static const char * const mediatek_board_dt_compat[] = {
 	"mediatek,mt2701",
+	"mediatek,mt6572",
 	"mediatek,mt6589",
 	"mediatek,mt6592",
 	"mediatek,mt7623",

-- 
2.50.0




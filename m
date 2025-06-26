Return-Path: <linux-watchdog+bounces-3733-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F561AE992E
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 10:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 989A718920FB
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 08:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F0F2C08BF;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7Xf97Qc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4F2BF001;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928038; cv=none; b=Pa9TduyV9ZQR0Mf+S1zpMMnd1s8kR74aDsNIvnP7sqvK4e3qq7O3/l63c+O/pMyghThg9y3WjJG5PnhmeIMz61Q/glQDxgukG6nLslyRB8FSp/5poycUKiEZs3LNB5Rzy6OewOVXM9M6MqRXmDUHOV3Mu9L6WHqt3ZeDUsXB25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928038; c=relaxed/simple;
	bh=cP6Lq6jpJkdcvfMIsF/fYAfvDAiLKuZsiQzqKKoiKNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pH28482jVi5+gaTcSl7cHp4xGL9hn8L/CZnfRjTR+sq4lbqIf9sFXezyBeRRONdcKIuTdyCVbUT/FsZ9QFfWUtKojDssQm9MeFE3vQwRh5SB8+bmduyU3MStp27RsKFQSB1mxYO2T1m11czCkcXybOxPLNsbYrEkf+vDnixvcPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7Xf97Qc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44234C4CEFE;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928038;
	bh=cP6Lq6jpJkdcvfMIsF/fYAfvDAiLKuZsiQzqKKoiKNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z7Xf97QcZ9/DWEf5K3SbKNUNJbvVjXwcxVML+dx/W/PdHxnErf186HVGK2Cpbr4ZZ
	 gE3ZlV8GB3CbPzsxbwanJ1yD1JHQHN3frQjRfuqPKnFf8/BFcB/vtDz17l9PJ8w9CI
	 tCTYlOmQ2lTXkmEqtSi1V2RlVHLF0xSreGcIXPDjGLKAJVp7ObEXb+cy52pbX22dIm
	 wM4diiCAkNTJ5Pit4CzbitPJRDO18HCcwY5dq1rds1+VywwQ5OevVurF5+kqcZ0oDh
	 nN2DOw2JryvAeHzd4nihD6H7RPDJm5gVI3UWcrlPDv652I4eg/KkAOZ/OHOTmfPnc7
	 rNHqjkQxjZvYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDB8C7EE32;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:54:00 +0300
Subject: [PATCH v2 07/11] ARM: mediatek: add board_dt_compat entry for the
 MT6572 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-7-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=775;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=TTf1Z4DEkN2KuGjaA/z7S/kMu+5ZTEL7ASvdrc16qMQ=;
 b=8L+FGk4X8auc+AJQtMD1xyUiOxziq+53Uo/jKAMwC1nqYX1LwkCAa7wUdcb4qFOo2pyxQOePt
 IyXy8++SJKbDy2u76DlV2lA8ust22DcZi6CVoYjlnO95bzsMoqbNi6Z
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




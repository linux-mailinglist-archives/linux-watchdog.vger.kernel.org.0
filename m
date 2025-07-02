Return-Path: <linux-watchdog+bounces-3805-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C626AF1280
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AB181741CF
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D4B261581;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ewyy4rlK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9125DB1C;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=rtlyFlTWHQX29N+AFm0BWLue1HmpB4fFb6/QUU295i/irAi6YeWQQLjQ4XQ0ct36pQYU4riWESzDi7IbD/YbbpzCei8xBpHAPANuy4RFATaIS3/HEKa9FGLF+IzNYoZj0J2B34lJwF0QsHd2Cbn3tdGBVr9K88qKv4d9YvoxYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=yl69ujOKudAoxb7BsY6W6/j+nW0EaIsBsX9NLiSjkC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyY7I4HLyNDvOxSa7ul8VXmhdYphrJ1ZdpKt9gnhpsBrW8c2qQtXsxY7bA6wjG91QSCEe9o5g3L6qZgpkY9Omhyb15O6CXy0LMCOqmW/7P1/CaqPMW30SBaXbiYGSZRg7hFi7fa4ZWTtmXQs1yUUITRqM5UR7zItJmcVdaocJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ewyy4rlK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45376C4CEF7;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=yl69ujOKudAoxb7BsY6W6/j+nW0EaIsBsX9NLiSjkC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ewyy4rlKz1Q0FQ8bIRk570Y5ZB+j9C+0qyRafLo/WQrv0bj/DBfWBKc3MNcLOmHKx
	 KHUjDxo0IaO3FgWToD8QqHWf5q56L5m+g5/9LzEqKi/lOmLd7sAljk/0y7otu7r5Jo
	 oGZJwhAQ/+KDBGiiP6KNxNtcZAqs9hccWtoCQJzZFmf5Mo6J5Q2v/n3zOVXLepojAF
	 4Sc2zKfRu9N9PhANpiGt2FhahkqIYZo5mrBPv0g0Kbt4aT8SLRnc/qmleoYf7ni15k
	 VY9uobro7FQUrCPszfwEkhGS6nnxddmJbLELU8KuRbJRe2yuL8n6sHdc6tJ65CTxGF
	 /NZf51Tu94m2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1BBC83013;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:45 +0300
Subject: [PATCH v4 08/11] ARM: mediatek: add MT6572 smp bring up code
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-8-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=1940;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=PSE9MkQgZmOqgXgkbRv8mf/3whMKOtrk3zwWFrj3c7Q=;
 b=V1dWY+vZcYeH6H9UMnflNhuoJ4dMQHATuwQ1xgVMzlmsWAhmBGaHdFXYv2ZRLb24amOcO8WvM
 DN/JiBYtZyjC/gkJEDLfqaukC1VnDBOiKIvZzZ3Sq3tApkujaCI4DVd
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add support for booting the secondary CPU on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/mach-mediatek/Kconfig   | 4 ++++
 arch/arm/mach-mediatek/platsmp.c | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
index 35a3430c7942d897106bb32916df78347113798a..638eabad2dd37ee56244fc036cb76af135aee416 100644
--- a/arch/arm/mach-mediatek/Kconfig
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -15,6 +15,10 @@ config MACH_MT2701
 	bool "MediaTek MT2701 SoCs support"
 	default ARCH_MEDIATEK
 
+config MACH_MT6572
+	bool "MediaTek MT6572 SoCs support"
+	default ARCH_MEDIATEK
+
 config MACH_MT6589
 	bool "MediaTek MT6589 SoCs support"
 	default ARCH_MEDIATEK
diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 16a4ee6c959050474c5535ac6a65d92b29482d53..bbd26d423bdef23629ec5ca9d9c61903748988b7 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -29,6 +29,12 @@ static const struct mtk_smp_boot_info mtk_mt8135_tz_boot = {
 	{ 0x3f8, 0x3f8, 0x3f8 },
 };
 
+static const struct mtk_smp_boot_info mtk_mt6572_boot = {
+	0x10001400, 0x08,
+	{ 0x534c4131 },
+	{ 0x0c },
+};
+
 static const struct mtk_smp_boot_info mtk_mt6589_boot = {
 	0x10002000, 0x34,
 	{ 0x534c4131, 0x4c415332, 0x41534c33 },
@@ -49,6 +55,7 @@ static const struct of_device_id mtk_tz_smp_boot_infos[] __initconst = {
 };
 
 static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
+	{ .compatible   = "mediatek,mt6572", .data = &mtk_mt6572_boot },
 	{ .compatible   = "mediatek,mt6589", .data = &mtk_mt6589_boot },
 	{ .compatible   = "mediatek,mt7623", .data = &mtk_mt7623_boot },
 	{ .compatible   = "mediatek,mt7629", .data = &mtk_mt7623_boot },

-- 
2.50.0




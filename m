Return-Path: <linux-watchdog+bounces-3690-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21567AE1F4C
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C78503BA9E3
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D08E2E6117;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xj8EFzrj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03A2DFF2F;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=sfWjzrHyfyccLHoJjXjph5hUEgFlJ2HkIs7LPlKd23KxvWx3K2Ikmm+c8Q4RQ0y5y4SVzmqd1SyW08PXOexmW0hyn8HTx/XAGJ8Z0WwKFio9j+7hY7hosc89X4UA+ZJI+ZTzM4+cYLsTcAra4pcmKylvDNnu6rmlAE4GvegTIFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=Rj7KD75WcgJtvIqW6RZMxDs0u6BFvPI2J2iy6HHQGz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsYYfnrhR8pTQ76YgPT++O6iwc0ingujM6nHYCq9pESTbVO0YCylcLIj5Am/ZkFVJ2onD+iWPR4XN1spoez6PDTloqlo55b2yn/6zPDpTFQsvGLuqTc/MNoSWw0nCiovsSc3u9vL/e0XkyefMgyKZckfuJC37VbFKpzpFLFOjXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xj8EFzrj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9F4EC4CEFB;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434234;
	bh=Rj7KD75WcgJtvIqW6RZMxDs0u6BFvPI2J2iy6HHQGz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xj8EFzrjQnbGovpoALtOdnmSuU8QU7uuMv2+npD2yE/PfAvS85RXI6MtV5hZN6H+M
	 kObJ/vF28wGu2QdNh/XOMaMk5Gizd73k34Vt0RXlxbqMXJYTR9jkg49Wt7w3Qy55NS
	 k8g3AGzqa5hbWtTJg9NELzOilUpWUfu69UQ0sLJvQYxR34IR3y2B/R4J3zii6Go918
	 N3FaUQLnBmmcsxcfnyh1flXkiFzi4z7m/x91ylGZ/vt10kBcYi+Dxx1WuiBEtN556Y
	 STmc6mUFnts2SLjqV/6+RtPDNpBLx5rBHfWDtgmsvbtb6AuUpFas+7o+4RuvKSwelY
	 2SJmsjmoQczgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F8CC7115B;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:47 +0300
Subject: [PATCH 08/11] ARM: mediatek: add MT6572 smp bring up code
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-8-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=1857;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=T8VXT+/gkb+tLiu+YbfKUS6YHMSUIjr+TS94R7QyjLU=;
 b=gaVOQG/JP38ntFBWyX8QqYCp36/uojX4tLGegknkDl4SPhVEeGu2m0ySgQlrNY+MWL3qoU0m1
 wx/W1N8/ohvDJCC7EeRtd8/ZTvbXyZ/pqKdOLHs2HlNyvUn32hpmEjs
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add support for booting the secondary CPU on the MT6572 SoC.

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




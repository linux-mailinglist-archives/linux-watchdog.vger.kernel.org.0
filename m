Return-Path: <linux-watchdog+bounces-3689-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A5AE1F4D
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 328993BA826
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E512E6116;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sayVJNVZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2612E06C9;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=rrIgenEozIeVU0CGPrBinhl4DEtUxGNzYDZtRJz6JnVUWySKPeYXI6KUPC4VkqVx3Ct5WwtpE9oMNAWIV6UZmPf2Z3g+lPJ1qd11nfX7xwtB2JTkfh+H6Rg8iyTZvtz73QNvBEYQUS1CK1iN7ibrw4bEbpdqP9K3oBWlsrtxp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=/M12+r3YGfgPHhzGTzEcUUQ8kBfgerEmUSZKMmlZH00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5s8/TJNKtT69cOM9UVAOrKm8qaCE9QlxQgjlChFjtQlmRDsGpcWYr2h6QOUD6+ZBfB64wJ3uEWtRmarW/R1AaCXomQP6nk+GtTqIWwedWPALvSSJdnRSR/4s8UX14iTp+vysdTLbCc9JoLyTlTfgM7/+vJm/607p+RpvCFEx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sayVJNVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE8FEC4CEFD;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=/M12+r3YGfgPHhzGTzEcUUQ8kBfgerEmUSZKMmlZH00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sayVJNVZKgLKISWVLQnDSfZVXSuRJUYolV3t/8JZfkBqqb2XB1enavSnQwa2nsJB9
	 +mIyyMOLPPeEPuTdYCcUYLgtX51OXZcrOYviOEAns2IAK0v75hr/VaT+uZMlRh/PiD
	 NWi7v9OkLX9C0X7GEVzvLLMxQMDQddCO+MCcuM4XcUMIOY3y/hpKXfi/MOElcUcvXk
	 eQqbKAhJaUsxWxs/GpwBY8KKYoRunxkT3CsABeTE5BU9ce1BWwbBgBYyXluCv8Y6KQ
	 CEdnjNHAOkmnIYv55HZcphQt89Yjw1P4fjRrhy+CfGoW9dUM0VJ4MdBglsg8pYmCCJ
	 FBt1LS/jItfBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D516DC7EE2A;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:46 +0300
Subject: [PATCH 07/11] ARM: mediatek: show the hardware name for the MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-7-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=692;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=rvoGWdqv2dSMmfg1LUoO8gwzH9kguQfgav6FpmmRDKI=;
 b=nNMbs5zJQLhpvdSJJKi/yGGVZeDkYGDkjeiXJDReJgWtS1NTPEzGxUCKW4O4tcSkxrG1bIzE3
 UJdouGOoePyClnORUtCLwsqvZzsYQ4bqCml/qnPubIdUn8ju1nwwA7E
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for the MT6572 SoC.

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




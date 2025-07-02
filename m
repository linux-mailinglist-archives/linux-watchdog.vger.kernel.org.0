Return-Path: <linux-watchdog+bounces-3798-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D3AAF126F
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8894B3ABBC6
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C28A25D1E6;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5YVmvGx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481EB25B31B;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=r9PB1B+xo1M2TBxhf46wLAM0ln2PLa4U2jmBa6C/JYLZKijH/eFWFl68bRtFUtAAVlnrD16PDlf4w+0aIIb6Xe+5oUG3xT00n3tVoDCJraEAQmlpr625J8ZrnhsM+6B8yKRlk39WRGsB6yevbOS63VvydXJAJzwOteH/R9drbeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=NtHVQV9EcFCMDX7k9Ycx1Wl9rCSucK710Cd1fER6oPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3HNmsb4YtexvvEZqe4RSc0SZNt7662hkwfWKX7/Q5RxmeGy2L+QUQNxCsAYV5nttglpK5uq2Cs5LYDt0E8c5o7ur0hF3eHzns7MfJnaPNYESPYEAuFkjC163oxJp5C7jvs1sHScpHbHMm4Bj9QBMu/PFm67iPqPVzzd/S16WZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5YVmvGx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA6F0C4CEF1;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453487;
	bh=NtHVQV9EcFCMDX7k9Ycx1Wl9rCSucK710Cd1fER6oPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O5YVmvGx3GThJ7iO0u9reWOs98lTyQBI8jOz9aSi8JMallmGHBlQSJ+nPf6weI5yp
	 L9FvHzumOHtFr1jtKSorma/lgahl1Y26N3XsHEi/i6wHMW9LqQoDW4fBm5dorkm0J3
	 6D4VSq92znTmZgxyymCU80+78+PCHyu0ir/axxqfhlE1hPKWU4/TY9kNOFuFzakX5T
	 VIpAdyW+Gqe0s/Yu1k9rLf1h1niGGtpI99PapFJt7XQc+Nu2G8EaabDgVwxcokC7RJ
	 iU+PSI6SJy7CFt0wOJ9U0f11tuRgUebfVvxULS1DDFeQdgocjAJMSZDLnOXn3cql8f
	 N23jich/DJPzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CE1C8303F;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:38 +0300
Subject: [PATCH v4 01/11] dt-bindings: serial: mediatek,uart: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-1-bde75b7ed445@proton.me>
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
 Max Shevchenko <wctrl@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=1028;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=DJTTfnpTHaaUzlVzY+8JNLh/4at1AR4THWvuXGzVm7Y=;
 b=ksOMgGPLyj0EeXyhBqe5loTt5hkWyeuS3aJcTlQ6WyQHrDsH87K8rGg4y9tdMrs28qt1LLbwB
 Of4VM0Bm5ttBsrDv6qPTl1jhLei7ak7PndEYt3AynUfm0I0MiuBEhg6
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for serial on the MT6572 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 1b02f0b197ff46e3530372d1d9303210cca9c2d5..fe283494188dea64bdfdd34a781bf54c8cbc1f05 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - mediatek,mt2701-uart
               - mediatek,mt2712-uart
+              - mediatek,mt6572-uart
               - mediatek,mt6580-uart
               - mediatek,mt6582-uart
               - mediatek,mt6589-uart

-- 
2.50.0




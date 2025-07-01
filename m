Return-Path: <linux-watchdog+bounces-3770-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD12AEEE2B
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 08:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 531A0166BA9
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 06:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63782258CCC;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mu/GPcEq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F82472AB;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350019; cv=none; b=fzCr0HeEK81R/XViLghqw9ZO5WhsVRpJ2unTPq/oOtmUB5rt4Xp4VzTesd9UvKokXPZoHvj8pBFtngaOV7GK5m7PFiqK0cpiFiaFJoV4j06Vd3/PCHcA0Z+edk6blb2hKU2MK6cGZOD4bDP/Z6u7JEe48NT9ljCTlUC8P/x0c0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350019; c=relaxed/simple;
	bh=+2XzKppmwhQYzDFY8gVFCwStqrtJMEoTwOQNBbMYX/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C7kcQbF7Ooz25oBaRb4P08qUyonuZJGEpZEzxB/T91Zqdckogg64HSNRL4cLFdMtBZ7DktsFcKqUsP5/2/ZAC9CHsn7IGoIBB6XhapQkg4CEshhTX9bDCuC1IKC4i+xsIzyZWproT8ffrZ1IQwH22vx4el6cXZvVvd7AwCbZFF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mu/GPcEq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3878C4CEF6;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=+2XzKppmwhQYzDFY8gVFCwStqrtJMEoTwOQNBbMYX/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mu/GPcEqCD53bdOfSaCDc5L5KXxbWOutFdHWHstLUekSEmv7IZYEmTbeieL01NnM8
	 IkGQKMW3eQUmLDurzgv4zmNAILkjI+pIL+UadojyvVRNYQKb/YZ4FMmGQ+36y9MIkC
	 QvtGjg3lo5Wx//wikvtZuy+kaPnOB8/9ENyE/u4DlF06k+uZ01KNjjVSVob40wx1nv
	 NgfeUA/m1t62YSSwf7JLXGjczFPyYsAluoA1hISYddO8aFw8fpARToqrm7Pqine4vD
	 UuT+8nhOPQ9Adha4fKv9Ug1D5YwETmk0/JkuXfpWwqxQnQqpOrHjRiq3aJDqjgSPYP
	 n/0fVGibX+sGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A52C8302F;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:06:56 +0300
Subject: [PATCH v3 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-2-8937cfa33f95@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=1128;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=ctmiRMyUECT6RxIRfZlrUhBmOSzsSLv8C2rWtsE6Z0w=;
 b=P6VhdoTwJ+ne9nKM/MM5lvHCYGEw5s5aZf4IT2Vh5qsWo3y5HviU8dF/kcU6094GdfGnpdimh
 iAfmKKtV/fmCS04tPMtPICn6UL15fnpKOrF0P9hDsKeSjfr7q1oX0gX
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for sysirq on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index 123d24b05556c67374fbb87abe5e16c65031d2ed..30d76692ca87b507900076cd2f7d2e7ed2605b33 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt2701-sysirq
               - mediatek,mt2712-sysirq
+              - mediatek,mt6572-sysirq
               - mediatek,mt6580-sysirq
               - mediatek,mt6582-sysirq
               - mediatek,mt6589-sysirq

-- 
2.50.0




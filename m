Return-Path: <linux-watchdog+bounces-3729-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04705AE9914
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 10:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EDBC17AEE3
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 08:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB742BD01A;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aknFDWWB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B120296178;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928038; cv=none; b=r68CZJ/EI3YGtgWqjrQ2AMNQjBXZ5U3EdVbxkPmDhr3fm6SaRO3SjkLuYH9yzRYFaNui0aAqlV7PgAWz6kGps+18RoCnrd90iDqv0BWdgdXdL9dgPCxmMPmoJkh6xnipfGeHKKgcjV6m3qa8tsNn+wLRsPz+xKZ6vLaWSr59+LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928038; c=relaxed/simple;
	bh=HT5DOECmw+qJQjOhfeeAewpQ2sqBhm5VDZ/UAJbmOXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsYBqXBjKjnQDOI5li9y8oC31TPizdDgw7n8sSil3SglLz2dx5naPqYo8ncrf5LjOt7ACgk5klkV11ueTPPRFTvWnCarMRKlOHvu5joa1cuL7tqhmziCDr93EuXxdnSgUhPiVrzbt+YT+lhBX5S46xDtKaKgLJgGOMFQGHPCUzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aknFDWWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC9F0C4CEF3;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928037;
	bh=HT5DOECmw+qJQjOhfeeAewpQ2sqBhm5VDZ/UAJbmOXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aknFDWWBBstid5jQvcIHBXh3sHp82Uj6mcdmY+17Gh3WQ9JfS8ineQ1npCRTSPmCT
	 py1uuIWHGgKOtZ8GVHNS0wMQOs/cD4RobjgwdlYlf31K0i5WCOEYo9Pxd8gzf6Ntde
	 v2ZoK6O0kawJrQKVyjA9LqihXWeIZ/db8XeeBhHNsUXdoxelIYIvn7isZq2vjEvFzi
	 dYASaCDVbpsV3gehR61Kpa34ORxW+cHXjgzc0hczi7a5S0CNhkG8L9aOdBUrWt7wUU
	 6KBYAuWilMcw4IeJLYvpYUdzFdgWDwVnfwQLZfr0otq0EQjaL0PZ258RHEYLQHoCh0
	 iE9AQ3lPVTW8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AAFC7EE39;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:53:56 +0300
Subject: [PATCH v2 03/11] dt-bindings: timer: mediatek: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-3-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=946;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=pKc+52kw9xhdBQMXCsiB5LzZOa7p7E9Ha6qtuRDXwf0=;
 b=jGMqmFnD/srCE1sCo8NXid4jXhMmQp9ot88vWZDnOCdZQGx+lqz041UPoRSKr5ZCawPXZd8Bc
 im92IniLq4LAwyS3ep3B1KFH4VSQeGWF0m2sa+xDq12OjkxJUdRtnZu
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for timer on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index f68fc7050c5687930e2ca6b6fa8f0b7a208803da..d5b574bfd2caad1bc54ef6bd1768d94055383727 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-timer
+              - mediatek,mt6572-timer
               - mediatek,mt6580-timer
               - mediatek,mt6582-timer
               - mediatek,mt6589-timer

-- 
2.50.0




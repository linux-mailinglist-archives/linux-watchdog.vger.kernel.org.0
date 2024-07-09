Return-Path: <linux-watchdog+bounces-1341-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA792B51C
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 12:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D69FEB22802
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A18156968;
	Tue,  9 Jul 2024 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="YSJDkGCE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1FA155C8E;
	Tue,  9 Jul 2024 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520531; cv=none; b=q+5NTS+8E2PBtxGk+Kz4mdozHyUXo2/N7zh6cqneeSS1RrBX/M315ATMvwqMv6JtLqWd5//VDps5X6Pp4juYgGWVVFDaHNYefmG369pWj3tAPhZROfNsAri//4igOOscbrMsHCjAR7qOd5jsatlNUvbw2LfieQE64Vk2jvHyXVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520531; c=relaxed/simple;
	bh=6a8qOjBludaUaW7TpO4+yWWp7hirpw9E/AKLu5wnxF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K90r9Br20/CG9CB0PJr8h7zq6ZYRmJclUBXzFkDWpFtrwB1w702QJe7Q4EDU3gFKndZoO/2CDojWUQ+EP9404wIW2YxXIubgxSEgLfnRhGeETsLRuwtNm7ywgSCCg47DAWe/ah7AK2vMHvA8PpWPbr4RfgTsnEE0mb7iHBd3mKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=YSJDkGCE; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id AFEAF41A49;
	Tue,  9 Jul 2024 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6xXij2X8BH/8d0tWoHxSFtMClwNOD6a+irryyVsrSg=;
	b=YSJDkGCEzplhkljyu5qASGz7Wek4bD9njpCdk8J3AQwudP9J3ovswPumfGsxEZl6337EV2
	Q+lMzjq8vOANYTii0QAYui28qGjoRQTVlzTDsGts4moPi9QuP8V81ANgtT/++a1ACisLoh
	kGBy9qAEXNV/nbprGuUZ3XEnnlPQcWY=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id B87B410075A;
	Tue,  9 Jul 2024 10:13:34 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988 syscon requirement
Date: Tue,  9 Jul 2024 12:13:23 +0200
Message-ID: <20240709101328.102969-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
References: <20240709101328.102969-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3691708b-d2e9-40a6-b21e-134ff95be4e9

From: Frank Wunderlich <frank-w@public-files.de>

This is needed by u-boot-driver when using OF_UPSTREAM.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8d2520241e37..681df2ff9f2e 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -25,7 +25,6 @@ properties:
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
-          - mediatek,mt7988-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
@@ -43,6 +42,10 @@ properties:
               - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
+      - items:
+          - enum:
+              - mediatek,mt7988-wdt
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.43.0



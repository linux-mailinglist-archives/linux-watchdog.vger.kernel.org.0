Return-Path: <linux-watchdog+bounces-1338-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B9A92B4E8
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 12:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A0C31C22947
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140C3156654;
	Tue,  9 Jul 2024 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="RloNW+Y/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA512CDB6;
	Tue,  9 Jul 2024 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520028; cv=none; b=e/nyAU6HwKpV66md/W0QX9Uhm1LyJTcVL83nLpqQo9WlJxXwH7hXBcKl76mbYWVkLLz71b+SIrSt8AYZ1E+4Mh4NKzHvFUhCbjK1VhATrCEPwnQyFx6DWnUnVUz5hkiqmUMZgfpBZzaSl+cIvcBYb059N/o4n5vzcvN/TI7z7i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520028; c=relaxed/simple;
	bh=A4ETTqt1Mu21+iiAl8O8sZzbV34ytQ8RJYiEdXC0H6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7GWCM08QpP22zmrfcXJ9dVR4ZDk1gWsbwOgBNpluL34VT9r2O8frlLSAsT23ie89vVGJlR/0wehlgNMJMpUzemDaDUd5kQhzZvFUKBXQUOMzI0kchw4eRmv0ptghMUIaa8jG8NcWfOxDOnZJLM2IzkXjyHmWZECCPxpZRQC4gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=RloNW+Y/; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id EE4AA41A4A;
	Tue,  9 Jul 2024 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4cX1DCeKrW/X4IO3UhVEF3ikjjO45cZPJayAiaU02Q=;
	b=RloNW+Y/inqFUfV9np27yttZrQpJsm+ipZrlEC0rcEe/R8qGC+xHcqasecIGg6p0XtmBJz
	X9mZV0G/uFYp5W02UwvKJij1pRWMlDDOM1dGlgQOZRwoKU9Q49j8LxRJ9ZWjs6k6EEqx8x
	K+y8rhNN3sahRJMVTPcf9mr0L5A+ssw=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id BFC7D100628;
	Tue,  9 Jul 2024 10:13:35 +0000 (UTC)
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
Subject: [PATCH v1 2/4] dt-bindings: clock: mediatek: add syscon requirement for mt7988 xfi-pll
Date: Tue,  9 Jul 2024 12:13:24 +0200
Message-ID: <20240709101328.102969-3-linux@fw-web.de>
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
X-Mail-ID: 81349dc7-a37f-460e-ab98-b22b9184569c

From: Frank Wunderlich <frank-w@public-files.de>

This is needed by u-boot-driver when using OF_UPSTREAM.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
index 192f1451f0af..c3686712505a 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-xfi-pll.yaml
@@ -15,7 +15,10 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt7988-xfi-pll
+    items:
+      - enum:
+          - mediatek,mt7988-xfi-pll
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -40,7 +43,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
         clock-controller@11f40000 {
-            compatible = "mediatek,mt7988-xfi-pll";
+            compatible = "mediatek,mt7988-xfi-pll", "syscon";
             reg = <0 0x11f40000 0 0x1000>;
             resets = <&watchdog 16>;
             #clock-cells = <1>;
-- 
2.43.0



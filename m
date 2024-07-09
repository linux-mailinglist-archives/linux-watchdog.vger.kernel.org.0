Return-Path: <linux-watchdog+bounces-1337-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048D992B4E5
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 12:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC941281C57
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD0D156231;
	Tue,  9 Jul 2024 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="pQyfAGKL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEFF149C79;
	Tue,  9 Jul 2024 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520027; cv=none; b=E/yMxTcHuE7vVDDnVJRJzt80DpSkaW95svz3DV8Naz4061iqjlVC/bQPacqUpsOI3MThr6AVVG7JyxeAGMKoGbhilYMaJqyRYHbnJLhx+IUrA+yW6o/ftpRno4NC91LsbzZlPPhjWtvm3pPEBIckUVd2vVUcP/R8rCoyRIqFq1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520027; c=relaxed/simple;
	bh=W+w4fMoRQXGlcBhBEdRifVTyFouOrWTky/aR8bda8Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POMDdWBdYFynG61ezx7apjKcd7REvrebTy3r8nWKNtYbdXpQLZZd6X/9ugu1JXNW9/dw4kaWEZHHUSQ1I49kPR64okvPELFJ+vgp0zfmgwA2VoRfgwRSlyP9nx9fKj+7NxvWr83Ktckxn281V6LchwkbwHrQsWq5R0Idg1OgyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=pQyfAGKL; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 0B2B541A4D;
	Tue,  9 Jul 2024 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Cz+tcKOoLj5PHmzKXgFnpnZXQbpoa1J8fX2KzN0JB0=;
	b=pQyfAGKLWsucu2KTiPOeG4tD8bX/99jx/zCXtk7YVjoyljQW2r6XHAGmfSwYS1oAwbKyGC
	JaJUWTSX63WSh33ETPGj808x02lgYIuG+loM4NwBemXgirs24hpZp1Jhw7x0AespEd/Jbr
	9ix4IXZTTxvL7OM+IFDgKSeRGrVfHuQ=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id D03A8100758;
	Tue,  9 Jul 2024 10:13:36 +0000 (UTC)
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
Subject: [PATCH v1 3/4] dt-bindings: clock: mediatek: add syscon requirement for mt7988 ethwarp
Date: Tue,  9 Jul 2024 12:13:25 +0200
Message-ID: <20240709101328.102969-4-linux@fw-web.de>
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
X-Mail-ID: 211e5e16-6cca-4117-b4fa-ed6227b76485

From: Frank Wunderlich <frank-w@public-files.de>

This is needed by u-boot-driver when using OF_UPSTREAM.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
index e32a0251ff6a..b460a0de8503 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7988-ethwarp.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     items:
-      - const: mediatek,mt7988-ethwarp
+      - enum:
+          - mediatek,mt7988-ethwarp
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -44,7 +46,7 @@ examples:
         #size-cells = <2>;
 
         clock-controller@15031000 {
-            compatible = "mediatek,mt7988-ethwarp";
+            compatible = "mediatek,mt7988-ethwarp", "syscon";
             reg = <0 0x15031000 0 0x1000>;
             #clock-cells = <1>;
             #reset-cells = <1>;
-- 
2.43.0



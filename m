Return-Path: <linux-watchdog+bounces-4454-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB35DC1ECF9
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 08:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF2D188B4AA
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 07:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBA2337B81;
	Thu, 30 Oct 2025 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QiXqai0Y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7DC33769F;
	Thu, 30 Oct 2025 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761810033; cv=none; b=KJxosi0aovzDHlnEKAOJxi3mT2114tpNA0xlh4FST7Gck1ht63O65z4XX+DVt3NUbrOEo5ryNqB1/lE1b20VlHS0dZk5PjwJFXPtcHR264vMjG9A5kj4O4azXs8fMUgLWK8S0yaMF2sHQ/T9EwpG04yNfRCrTX/3P1PKbgJ6FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761810033; c=relaxed/simple;
	bh=zCqPLDYFSTIRnT5sZnTePsSmoKp8F3Uxev9dTCYAwN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sEnuQL+nTyU58kxvakCLyqWvtJ6Q6XvhZdpuBunZ6VfHYV7SloPV0RwLRYP/Jkx/oXRnfh2U1T5PQkqdYpazNwgYU441PjxN1tFPOr1qmi//FluEKRxtHlwPkP5OtghRfulNm96aKy+vD3kakBogrLCY8Sjd7WyspBLe/Batj/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QiXqai0Y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761810029;
	bh=zCqPLDYFSTIRnT5sZnTePsSmoKp8F3Uxev9dTCYAwN4=;
	h=From:Date:Subject:To:Cc:From;
	b=QiXqai0YhuS1zsntczP51FL2lAyKU+mSzKqZfJCF24pmV9eyjNKPbdY6dSXXi5sCX
	 xxypI0eRqI5EsYdtJOW3UyEQG2oUVthHTGTar2H+01fSta0vTcFfE8Mfbb2EjtMWd3
	 0Arc948XTbMu1DK6DwMoM+AJwMVAglltEbs0FSSyfls+MGi3DZWjI0zKolSp5SXBuh
	 jaDV8jpIa6GCxzqlPKOU02S9wIXndsmpRDrHtxzSfzvBPPXEVkIDMxUokvE9V4b2/x
	 LQkzyrqdbhiafbas/Vkp9CwIH33ZEHdgpGTY9kACO8GbjiGKYJXiG6SxxA4YZ+StUK
	 f20h+BrRiuZHA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AAEE17E009B;
	Thu, 30 Oct 2025 08:40:28 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Oct 2025 08:40:07 +0100
Subject: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFYWA2kC/yXNwQqDMBAE0F8Je+5CEqmov1I8RLPaPSS22dgK4
 r83NMc3MDMnCCUmgUGdkOjDwlssMDcF89PFlZB9MVht70bbHkPuTNejzzhx9BxXwW+Bb72zi26
 cbTWU8ivRwsd/+DFWJ3rvZT/XECYnhPMWAudBRToy1o9Gw3hdPwdI4MGZAAAA
X-Change-ID: 20251029-mt8189-dt-bindings-wdt-d6da2f03a260
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761810028; l=1181;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=zCqPLDYFSTIRnT5sZnTePsSmoKp8F3Uxev9dTCYAwN4=;
 b=Z/NT/ku5a3v7+z6gX10fuY1Tr/RmBBg9g8JoOhmLn+z6ju0nEQ29d788LkwfFkB5A/uNgX3BD
 dya/nH7WNjHBzv4EOmQKpgqhWkG3puV6wox3ImpYnwwuBiJ0kgLucAJ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Add compatible string for the watchdog block on MT8189 SoC, which is
compatible with the one used on MT6589.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index ba0bfd73ab62a86befead007d4b7d2a870b81a0c..caa1140fdf44f79f229644b54f759a93145f26d8 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -41,6 +41,7 @@ properties:
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
               - mediatek,mt8173-wdt
+              - mediatek,mt8189-wdt
               - mediatek,mt8365-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt

---
base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
change-id: 20251029-mt8189-dt-bindings-wdt-d6da2f03a260

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>



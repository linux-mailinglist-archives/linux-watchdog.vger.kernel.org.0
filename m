Return-Path: <linux-watchdog+bounces-1317-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86CF928839
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2024 13:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64D8BB2081B
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2024 11:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1CD149C6A;
	Fri,  5 Jul 2024 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JXZimLhh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6EB146D45;
	Fri,  5 Jul 2024 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720180285; cv=none; b=R0+ffCuLQSRYYNbjzWltkAnz5SvwdcEjNIFwBNe8KidmjD7aMBY663EHddjdtK/sncSM/VRWNsXIu4BLtj3gyEn01CSSgyG44ycqBF5EzDfWEvusWjT8/nVvN8bD2nHRYUKboOBQEjQkkTx6w2fT2EEwiSGgYKwQU1cObeSz3PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720180285; c=relaxed/simple;
	bh=0gu17Ptuw5N1WwZNTEylcJ6J3aGZGwfTtrWv2qsSCHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qFMOYu81ucrrGHdDnVdaVFrC/PS/hW/0h4yxl158huioYpmY5vBIWWkmhMxxONCFwT3Hg1ZFc1Fb0dcVYXV26oYSw9KuoFA8CmYZ+N7R4tV3VgV2UJmtPhVFzgsKsMPfEX+eKRtNjgT0QR20uyL/PJ9ijmYOfEvEne35VXp0/ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JXZimLhh; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5896588605;
	Fri,  5 Jul 2024 13:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720180279;
	bh=9VuZ9JjG0OVOyH6QxkB1cOF/woKql5YBbDjXiKC+FtU=;
	h=From:To:Cc:Subject:Date:From;
	b=JXZimLhhXVEhDPIyZXLbse+6Xijhic69NeFNlg7mPwu4gn8X1qjsvgNIOkJDkEi7q
	 l/KiXthug0hHLFyTfNCZP6oWTxJQhiO3F/TwUwqlmKjPPxLDXdQns9on62nw6nS4Xh
	 qDBiNBlclDBkaO2XFmcbYfUC629bhS0TPYXLZX3amGjTkU9uwYItwvIDFYEgGQ7cMM
	 pEmisgSkj4cDBeknt7U2QPCpqJPLOfgdauNzaOLlMgIzPdueiHy8bRq0AUmH0fJ8Lw
	 sc+U3OMGEB61eWC3Kcdx1k4hON1gN1//Zom0zDt8wbkKjbGp9t+QP9IQRNtZXdOFq7
	 zaexxOoSM6HEQ==
From: Marek Vasut <marex@denx.de>
To: linux-watchdog@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: watchdog: stm32-iwdg: Document interrupt and wakeup properties
Date: Fri,  5 Jul 2024 13:50:31 +0200
Message-ID: <20240705115052.116705-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The watchdog IP can generate pre-timeout interrupt and can be used as
a wake up source. Document both properties.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-watchdog@vger.kernel.org
---
 .../devicetree/bindings/watchdog/st,stm32-iwdg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
index 6b13bfc11e114..86bd39d508500 100644
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -36,6 +36,12 @@ properties:
     minItems: 1
     maxItems: 2
 
+  interrupts:
+    maxItems: 1
+    description: Pre-timeout interrupt from the watchdog.
+
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.43.0



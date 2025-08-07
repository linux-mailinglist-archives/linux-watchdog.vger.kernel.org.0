Return-Path: <linux-watchdog+bounces-3985-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52146B1DEF2
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Aug 2025 23:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0730072442B
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Aug 2025 21:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDDD2367D2;
	Thu,  7 Aug 2025 21:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsXpwF9G"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB2C21E08B;
	Thu,  7 Aug 2025 21:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754603027; cv=none; b=HJCLSWLbvh2tZolwLGDAYgpoSnzSFpDU36Oj9tcW7LWK/BFp9qq6ZWzeLDLWXb6vOzr1cyrsI6uXvrbRTb8a5eAc3LgPBYqbcA9TqHusjUbt2MY42U69OCYP6fYWG6Xdv6HF5WASSyitUwjIwTLwHAUq4/KU3/2iI9bshCiNM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754603027; c=relaxed/simple;
	bh=W6GqJNvasD3gjGMWjEHizRu586KTpuEdOXn2dEk5xwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PLsuMg+4qCB4Wk/Wiv3b+OPXsSmYLthMdYnQSnRehev8C4/XWxfM515ifzzeH/Ml+84ONJmPBdi4nrKBmG3lFw/y/8nby3KJfbdknfRLhpEl0e5s0Koqhqn96VTEHWqUvKIGWd+bQQGUZj2UQnSA9Ea6LWI/becmKcpJ+lxDZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsXpwF9G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43A8C4CEEB;
	Thu,  7 Aug 2025 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754603027;
	bh=W6GqJNvasD3gjGMWjEHizRu586KTpuEdOXn2dEk5xwU=;
	h=From:To:Cc:Subject:Date:From;
	b=LsXpwF9GshWTBCiLWR+xZfLfmXHSJ7fGlHgGUkN1QR5KHWWf1J7uXB9ncGBBwScQp
	 Pw8PBJDrGVjqCYSNsGWxvfKxu+5RFzhMvm/IsXgaeNzVLiM1DWPQnIWUNgPem0atcW
	 cRZPV4tY4sUWYIF5FXg5S7oBJlouifxhSXAnXIykgVxFTkpeQrScw1CeQvMwCehQVS
	 N1OwE36irPO1jM84laAStayAguzDUEWIZpZWRuY6piuHu83FPNHJBPy/FBi5IkZPZJ
	 kUbYpWjHV2q29BvWgfx6+nD3pU4QUsdlVB28QEHBesbANiN5+plfzA2FRD9fktBH3/
	 EBdQ33CBfJOgQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: Drop duplicate moxa,moxart-watchdog.txt
Date: Thu,  7 Aug 2025 16:42:21 -0500
Message-ID: <20250807214222.4170236-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"moxa,moxart-watchdog" is already documented in faraday,ftwdt010.yaml,
so drop the old text binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/watchdog/moxa,moxart-watchdog.txt    | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/moxa,moxart-watchdog.txt

diff --git a/Documentation/devicetree/bindings/watchdog/moxa,moxart-watchdog.txt b/Documentation/devicetree/bindings/watchdog/moxa,moxart-watchdog.txt
deleted file mode 100644
index 1169857d1d12..000000000000
--- a/Documentation/devicetree/bindings/watchdog/moxa,moxart-watchdog.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-MOXA ART Watchdog timer
-
-Required properties:
-
-- compatible : Must be "moxa,moxart-watchdog"
-- reg : Should contain registers location and length
-- clocks : Should contain phandle for the clock that drives the counter
-
-Example:
-
-	watchdog: watchdog@98500000 {
-		compatible = "moxa,moxart-watchdog";
-		reg = <0x98500000 0x10>;
-		clocks = <&coreclk>;
-	};
-- 
2.47.2



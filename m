Return-Path: <linux-watchdog+bounces-4365-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F10BC8906
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 12:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92B9B4E294B
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 10:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8AA2BE04B;
	Thu,  9 Oct 2025 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Yhqt0vP7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587E22C21F9
	for <linux-watchdog@vger.kernel.org>; Thu,  9 Oct 2025 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006731; cv=none; b=YMyqUMdopoZ9PMxR4Taa8tqKNfWRkOtGxCk9OLMbIav0EE+bGrn3vHccQATDB+hw9DdzKjbV0KmeAK3CL7ptpPh4BGalt5zEZsCfsMBdUPlZ+H8tjkw0Brjnhi1SWvgagrqr/ZyOvnl67e+z6mVU8iCi0XklXw+YrvpRo23AJS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006731; c=relaxed/simple;
	bh=+B6DukldXJVBE1RqN/SyaNypJxIyi15yQYg2A2Go0+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4NeqrYhnnk9+vai59k0I7xCzRzIYqEGlohZNEllrZ8zXn48Djupqn+aXnyOOCJCckKVd28OTP4k6sdbkLuwy0A16MOKS3v+c5LpHXROCbrXuipEKFDiC5fhuzOci6bbPl2bzRxV90LRCI2bPa/VTRTCZ/d+LTvYIwJ5cscuZsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Yhqt0vP7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZmLPdS7qBuSlyyQgt3NI7LxPAJPa4sXuQbbk1En+yQA=; b=Yhqt0v
	P7Eryb7RmUC+6uPHf09qF8W7DZfZU+GdN6Pa13MQCZ/5uxbVdGBlgHgKow/AaI22
	ABnjsllP7/8YK4nIwDJ3mEq9xn14jzwY7GGEjdyMk5qAxJZmaHXUi4zPUYF2NaDD
	7Yd7OJErREazBvZt0SqzTR6Z3NNNhIvt+pyRKllcdxdQztEmhk7QmH/jeUuU4Kfn
	jHHoDKn6GmGsK0xlIfxcj29YqNGC6Vrl49MvAIrnM0m73fZV52iXFtoW1XYCOkTO
	q/SxM5jvcLiSv0OV7PkRzwFQpmICL1L42kOKlLBb4twNWgUsdF6xmb6Sd+A7ykhP
	1L4X3HtL3bIAjNkQ==
Received: (qmail 1043427 invoked from network); 9 Oct 2025 12:45:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 12:45:21 +0200
X-UD-Smtp-Session: l3s3148p1@r8dlf7dAiK0gAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/5] dt-bindings: watchdog: renesas,wdt: add SWDT exception for V3H
Date: Thu,  9 Oct 2025 12:45:03 +0200
Message-ID: <20251009104500.69787-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SWDT on V3H has no reset bit. Make resets optional on this SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v3:
* don't introduce new compatible, just make resets optional (Geert)

 .../devicetree/bindings/watchdog/renesas,wdt.yaml     | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 08ba128bf442..7aebc5a5cf17 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -74,11 +74,20 @@ required:
   - clocks
   - interrupts
   - power-domains
-  - resets
 
 allOf:
   - $ref: watchdog.yaml#
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: renesas,r8a77980-wdt
+    then:
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
-- 
2.47.2



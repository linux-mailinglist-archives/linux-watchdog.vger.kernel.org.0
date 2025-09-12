Return-Path: <linux-watchdog+bounces-4241-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D5EB54D2D
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 14:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6CB3188C7C2
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 12:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A462F31E117;
	Fri, 12 Sep 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnO+Zw+v"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40C31DDB4;
	Fri, 12 Sep 2025 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678907; cv=none; b=Vgu5ysAGhJU/LzWtpVXuM1FbL9sWyvPgAdtSMEJauu1uawhXSlk7/6U9xnvCXkSgBYsUoXdHQZnqpJa3J6Me9Tb5wumX97BnGsbAqBFyVP53f9qE/1ttoqPUaMQsraRUdakay6s4Dh2bTQsHxIuN0v4QM0umfaEtGF2iFwMHbJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678907; c=relaxed/simple;
	bh=be+bUwk0HwrL17vqiPMMJhD52aY5E7ndhs1cUU5HK6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sic0mzzMC1gPqWv+YEmEmzoaW9kgg+w6qTbuHD9iVrPawA51mgO/FO87RfnDKjmChlxJXy1sQwabeJ8Och26hxB9OQzhtU1Tv7NatzEzIjRbYaOV+CrITrSfTtmbljNkB4/+WYgAlX0XnqZ59rLsE5Rqw8t+OIpwgvVfZRvcZVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnO+Zw+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC21C4CEF9;
	Fri, 12 Sep 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678907;
	bh=be+bUwk0HwrL17vqiPMMJhD52aY5E7ndhs1cUU5HK6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VnO+Zw+vEeP2fK22pSjN3uy6nADz7y2IRjKwkvi4geRwoqcPOklI4xhf5362H6wSk
	 oRRj5PfC3Z+k1P8gLptL44nLQAavAVqPJyokURmtahqFKXkE9NZ+18ZrV6jGRWGGIp
	 5P2DPPROwqIX57gAOPKn2aTyDHKHb3BhRlfToES99CXMIP33Nq/+F9m359MSfPNiL3
	 0Cg4sZIgWcbdFgXEEL0q+eh/+FY4ipZ2sCkXUzngH76Pt5k/9jaf5xVhvRDkyk4GCw
	 U3WMKC3lkMHf36hDUEqgKrW2P/lsfzwvu9XyQBKIgF1Nl60bC16GEeNoDs8MWinlpC
	 +qd/B7BHuf/4A==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/7] dt-bindings: watchdog: add SMARC-sAM67 support
Date: Fri, 12 Sep 2025 14:07:43 +0200
Message-Id: <20250912120745.2295115-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SMARC-sAM67 board has an on-board uC which has the same register
interface as the older CPLD implementation on the SMARC-sAL28 board.
Although the MCU emulates the same behavior, be prepared for any quirks
and add a board specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 872a8471ef65..0821ba0e84a3 100644
--- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
@@ -18,7 +18,12 @@ allOf:
 
 properties:
   compatible:
-    const: kontron,sl28cpld-wdt
+    oneOf:
+      - items:
+          - enum:
+              - kontron,sa67mcu-wdt
+          - const: kontron,sl28cpld-wdt
+      - const: kontron,sl28cpld-wdt
 
   reg:
     maxItems: 1
-- 
2.39.5



Return-Path: <linux-watchdog+bounces-3324-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E400A948F4
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Apr 2025 21:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 950583B35F8
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Apr 2025 19:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938CC213E71;
	Sun, 20 Apr 2025 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="LIR/K4Rk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA82144A6
	for <linux-watchdog@vger.kernel.org>; Sun, 20 Apr 2025 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745175683; cv=none; b=hAMfF3BS05GsATqYm5Rx6MWmo/C8Bki3OIedi11I36veK295Vu/uvqvyjKtPuTCwiettBkqECBdLLyWqQzduJAxo+OoNju5L6j1K5wAD8KRipzS1TM7iUGjygJn4yU1hpYS2/T36VXW9zJe1nr8wc/zdA7pNa+8lCnop5VSGioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745175683; c=relaxed/simple;
	bh=ZzqEnrc2GwGD0LJJxzv/EFLw7i0OZpVSmt6FN5Jh0zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8bacOd4IYvlRvQoi2Czf9PexkQQnd1LP2kdPdyNS50zioHjaakbr4T6TiM7tNX9by58tUCBOXB6eEtWYwSYlwD9ReRps/LezS9iapriR7qKdVBQMq7pctQqjRbLAAia+BHnMhiJRv//vwsZTRtbjrNySCvirc9oFN8m5C2tO3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=LIR/K4Rk; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=LIR/K4RkD+zKs/VeUcFutsQxHIxd0wjdIHb6Q7CDJQi4rfE1g9MsoYS85D9m+ngOxrDStx7rhS1eA+cO84LDB0ohGNHqmKp62+uKHB8cJimZjbvUcm8EzYtIYyi5l94++GC2VOGz8YVSanleIaknZbiebGJ1Ad++g9kxmPEz+PN0eWPdy2c2D+UuDZv5un5ezLDigKIfpaUN3ZLFztawpmMZiJndXnnDFZ23GI7+zP72BR9PYg6HLNxwSRi7XC7c6ZkmUREzyIbFR3zn2kIvTICpiuy1BZBNrtth08allgcgBd96d3MNoi11rmMjlSOK0U6ka0KMPkPBisZpDXdbxA==; s=purelymail3; d=purelymail.com; v=1; bh=ZzqEnrc2GwGD0LJJxzv/EFLw7i0OZpVSmt6FN5Jh0zE=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-watchdog@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1640089901;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:00:43 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sun, 20 Apr 2025 21:00:38 +0200
Subject: [PATCH 1/2] dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt
 compatible
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-wdt-resends-april-v1-1-f58639673959@mentallysanemainliners.org>
References: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
In-Reply-To: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745175638; l=2884;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=ZzqEnrc2GwGD0LJJxzv/EFLw7i0OZpVSmt6FN5Jh0zE=;
 b=l3whzqZEDIVwIoZNOtSEIAdPsHfbI3xwrAn2qclEOxST3fnd30CM+CTztr4C+eQvzowAGgHQD
 3hFXaF1Y2PJCHH7G8jU5ZoQ5EZ1wNnwDKnfgF+kItJ/pr18r5FzdIBt
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Add a dt-binding compatible for the Exynos990 Watchdog timer.
This watchdog is compatible with the GS101/Exynos850 design, as
such it requires the cluster-index and syscon-phandle properties
to be present. It also contains a cl2 cluster, as such the
cluster-index property has been expanded.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index d175ae9683366d33b1f9d9d820501d1e7c5964bd..53fc64f5b56d33f910395d32b35e0905b8b9aa53 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -25,6 +25,7 @@ properties:
           - samsung,exynos5420-wdt                # for Exynos5420
           - samsung,exynos7-wdt                   # for Exynos7
           - samsung,exynos850-wdt                 # for Exynos850
+          - samsung,exynos990-wdt                 # for Exynos990
           - samsung,exynosautov9-wdt              # for Exynosautov9
           - samsung,exynosautov920-wdt            # for Exynosautov920
       - items:
@@ -49,14 +50,14 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850
-      or Google gs101).
+      Index of CPU cluster on which watchdog is running (in case of Exynos850,
+      Exynos990 or Google gs101).
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7, Exynos850 and gs101).
+      Exynos5420, Exynos7, Exynos850, Exynos990 and gs101).
 
 required:
   - compatible
@@ -77,6 +78,7 @@ allOf:
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
+              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -89,6 +91,7 @@ allOf:
             enum:
               - google,gs101-wdt
               - samsung,exynos850-wdt
+              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -102,7 +105,7 @@ allOf:
             - const: watchdog
             - const: watchdog_src
         samsung,cluster-index:
-          enum: [0, 1]
+          enum: [0, 1, 2]
       required:
         - samsung,cluster-index
     else:

-- 
2.47.2



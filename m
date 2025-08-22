Return-Path: <linux-watchdog+bounces-4043-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD036B3193C
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19057AC3F21
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 13:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E44303C9F;
	Fri, 22 Aug 2025 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWJc1YJy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68192FF146;
	Fri, 22 Aug 2025 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868564; cv=none; b=f5u+9mEDjT7DZZ1WbAHAJ0gYEW17D2DuCA9ZST49SQph0Z/c5QKGaMXHZKZ3germ2mvn15bznY5yRPwXVWrGCOT+/R0hK7aPgQ76px2ZZbHJa4t/BUiz0u+Xc03zT9PFlwFH+VDijBLaCuKhOM7noxZM50OKIcOdXdueU0+Zg3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868564; c=relaxed/simple;
	bh=vkUXrJvuvl2RSVFcKK7WtTrWq1T1uZYDD4RoHq5N1YE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UmMf8xYaDRHVFfbCEHkwqxkV86QiuduTleQWN+rF6p+UoyrVQRHQTOWEr3s9+BTznLAXP66ldtMxfP2xFzGt+PavULsH3olDevDXC6GLDHm6N1EdZfgDALYrSKcGNs7hbBmXbvy04SDoSig3CbWm0PbyXemEljfclFcM0l4pzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWJc1YJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3180CC113CF;
	Fri, 22 Aug 2025 13:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868564;
	bh=vkUXrJvuvl2RSVFcKK7WtTrWq1T1uZYDD4RoHq5N1YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uWJc1YJyV++CB6Cz/TtTfrUhPVxNTPhUIHwKHIqqqCwqoq0Cu+NCpZsQ06uzxwpGH
	 t2pK4FO3dSoxR4bl64qP37S02+9W225g3zCubi6+4UdJ+O1ugoerN/JFbTWktR8/eT
	 C0kztRChb0sF/vXxVT/H8KJUci/gCH8hs1LSuneCrtZv97s0C+FYdkYi9tbUD3tPRW
	 0G80+gjtUZr8vZl1t9WCCbOSgdal6n8CySlIGa+lFkf4nf0gPyWED6+qelg9uhFz1U
	 90iZ2ZAagMmitsmil+aMfeGIYWkBe3zDcd0dlX8hIqwBzz96PWvZ+IGVKXQIe+5GwV
	 +WF68Rx8T4eAg==
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
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 5/7] dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
Date: Fri, 22 Aug 2025 15:15:29 +0200
Message-Id: <20250822131531.1366437-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kontron SMARC-sAM67 has the same nvmem layout as the SMARC-sAL28. To
To be prepared for any board specific quirks, add a specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/nvmem/layouts/kontron,sl28-vpd.yaml           | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
index c713e23819f1..afd1919c6b1c 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
@@ -19,7 +19,12 @@ select: false
 
 properties:
   compatible:
-    const: kontron,sl28-vpd
+    oneOf:
+      - items:
+          - enum:
+              - kontron,sa67-vpd
+          - const: kontron,sl28-vpd
+      - const: kontron,sl28-vpd
 
   serial-number:
     type: object
-- 
2.39.5



Return-Path: <linux-watchdog+bounces-4240-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D38B54D39
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 14:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66E3177F3C
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Sep 2025 12:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF02F31DD9F;
	Fri, 12 Sep 2025 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8HLletF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0130648B;
	Fri, 12 Sep 2025 12:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678903; cv=none; b=hptH/xeCcMGgUhWnLy6f+xhUcgz6/kAFWVM/Ps7dQ2zdAcGxnblcSghWamaerLtVxt3xcyFYfQkfxTfLVE9IdR9ELHFkd677l8U0CL+TWxcf7hJQ+E3uVecCytNQ8mlJtIeUFJIHHNJbHJY/NxuGuxe7Ws8paPTULheMs7ORk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678903; c=relaxed/simple;
	bh=DY2XJDeEOrzHxg96FTirSDzFFXROFVOwi0JgFBjMnyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F4a4Wn7idvwZVNDiJQg7YDuzHKJriEMm0beZOTaf8+HFZCA59ROF47igeBm8Z0DaUqQ6gKffRFWMyGbJzosTbNvkSbZ3ZPHSb2W/Sj3iSdNh9HxZ26KDXImhZjwsW4oI3N+96yuJRVGV8svvIgZD7Qto1JQorOS4q3ClrRpgwIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8HLletF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14DCC4CEF4;
	Fri, 12 Sep 2025 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678903;
	bh=DY2XJDeEOrzHxg96FTirSDzFFXROFVOwi0JgFBjMnyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8HLletFv8+PYS3mud5TlJ74kQnGGkI9mA0vhirZjyr3LjhNOJqVksvR6M7zyZjdZ
	 SYQvUVzc0Hh67Lc+6p420KQVyrMhYDgF3aiu+vG2CV0CegTMrbr9XRj+Jz54zrbXRf
	 RHoSgpiFD3uiyAiBrh3+ePi+efbbDRe9OjRr9bb6okSpkGvi8g8NacL9KcQdCkveOb
	 klnBk3/YuanWt5sX+aj6UwHmGQxt1JBBp+lcZkbxKishmGXxyR9uaTc6HA6AC8fekS
	 kJIghL3cEnZPpLQQyi5zpBCvQKcrWiYjXPANjUorED64ArvrKxP1lMsPX1fxeDCAp+
	 fzDGhvYDQxbjw==
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
Subject: [PATCH v2 4/7] dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
Date: Fri, 12 Sep 2025 14:07:42 +0200
Message-Id: <20250912120745.2295115-5-mwalle@kernel.org>
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

The Kontron SMARC-sAM67 module features an on-board house keeping uC.
It is designed to be compatible with the older sl28cpld implementation,
but has different sensors, like voltage and temperature monitoring. Add
a new compatible for that board.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 5803a1770cad..966b221b6caa 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - kontron,sa67mcu-hwmon
       - kontron,sl28cpld-fan
 
   reg:
-- 
2.39.5



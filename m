Return-Path: <linux-watchdog+bounces-4041-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B766EB31915
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81641894528
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 13:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BCC3009EF;
	Fri, 22 Aug 2025 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEswPeto"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332493009C7;
	Fri, 22 Aug 2025 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868557; cv=none; b=rz54h4YFX6WyY4pcuGbHLODVTs9UChrocg2Q8f9X2UDJnBd+GIvnWQ4hgCTHz70ZO+m3I1oihxbvORqDsjW600L4og6ZFakj3V1AqO5FLwegPN/piu88DCVLy6ODzqFZCIJvrP0DfFYNXKq95VlQlsJkMIVRXq5qOUKw23yIgOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868557; c=relaxed/simple;
	bh=a3svFGmTilPFyxqTFgQXgDbt5tuJn8Vyfor/nk7LNPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tMra585sDN+86QasvFl1kmnfVgMdYwV7VoPx0BSY4s8oLx+msVGCTz7Ckw5brOzZ4VmJJ+e6ucP4yn02itJe40+SPIlDaApTgp8xNPjmpm/9CNI93eVgHD/4tc61CWjec3YYRbmCCaJtuTLeS14pSoNLdp2T5CXlZzxXbAv4eA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEswPeto; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B21C4CEED;
	Fri, 22 Aug 2025 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868557;
	bh=a3svFGmTilPFyxqTFgQXgDbt5tuJn8Vyfor/nk7LNPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEswPetoMT+t+QtbFxdvKm4nu0MVOpO5GAX8QMrJzVTerQo1EKssqCEhP5nHLsjP5
	 gOl6gTaKwvCpXygwVnsDsgCzSuRDmA4SRPs5TJBAWf8zyzbm6Iol4uu5S/1tKjrbRZ
	 DAey6z5BXnef7LsVIsHUog0HGQIqJVDPSwoq5kZsT7k8jabKt++nDPV7J9uyL63HNs
	 bS6o8FY7uFP4QjNiU6cNEgGxwCt9xRVT6sd7eLFD9KqKoyiacYQ2TUmWakzWRbkLEN
	 uc5zBHAhWDEbIbcl3sIq6u2OuL1Z5M/abqjBHQt20KhOVu0/exAp0Zh9fjlB6qTcrJ
	 +xLQg55rGQI9w==
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
Subject: [PATCH v1 3/7] dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
Date: Fri, 22 Aug 2025 15:15:27 +0200
Message-Id: <20250822131531.1366437-4-mwalle@kernel.org>
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

The Kontron SMARC-sAM67 module features an on-board house keeping uC.
It is designed to be compatible with the older sl28cpld implementation,
but has different sensors, like voltage and temperature monitoring. Add
a new compatible for that board.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 010333cb25c0..0275803e843c 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - kontron,sl28cpld-fan
+      - kontron,sa67mcu-hwmon
 
   reg:
     maxItems: 1
-- 
2.39.5



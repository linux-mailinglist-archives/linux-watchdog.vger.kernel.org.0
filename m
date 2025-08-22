Return-Path: <linux-watchdog+bounces-4042-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FCAB31921
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C41580168
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 13:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678C7302766;
	Fri, 22 Aug 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDgv7D7I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F702FE58C;
	Fri, 22 Aug 2025 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868561; cv=none; b=ZdJ7BNPaGzFaL/mrvdP0J1cESbR674TyAaYJUrkOGiS+Zwi53F1g41UHL5KVdMI3iAJyNcpshz5LCaw7DM7BzvIsZAo9nAAehVLKtFKmlapphh51FbNb5f9e9jN8FQRgt8S1CTgDwhXi4GrZTXlP5s19MSFhYVsoI9vPXqXW8K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868561; c=relaxed/simple;
	bh=pI+PMnpowITNEY4uEFepulTLvkZKfkdPFKnomSd53g4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ednHbVNRdDTTU0mm3+ZDHCaiTVPeH0HxoMvT4SAFMy3W9LzRjEOYr6X5N+mmekKXdriflnoW80M+kjAvkQoU709NZTQry8P1eM5zdktxKzgw5frmIDNl98xOl2V0fd+afNSWLt+meL+u8/4/uDg/jHrAuAknL0h9Ib464DhP/8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDgv7D7I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81802C4CEED;
	Fri, 22 Aug 2025 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868560;
	bh=pI+PMnpowITNEY4uEFepulTLvkZKfkdPFKnomSd53g4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tDgv7D7I3ypU/cZ863v2Z3/VmVIsgxI7gXlZtLqRkqo+9NC2Z1GtKAhWkm+eX/FgM
	 SH/cDX0ltWG8Gkj3QdFK4n9X3+oVET/rlA5Ab790Yfe9ZDAVrxO0AmFxbBBrLXSRRc
	 NIjv/XK0qLeDBvmgaMkoMlrhm5WuKqOCVnJl2dHW9V6W4KbgRqI4w6UJqtug3LCOzF
	 HT4LvvLKFKoSHkaCoJhnhFiRb237R44HESMNhaNDkeBtlz3qBU3VjPRm56EPTfgOH4
	 bx2KZOd/nJGEk022CJ51QmQ0H8GwhEt2LQu3OpvyGan2X0yLu1xnBzaH4/aRHmL5NL
	 Pl6/lusyR6AEw==
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
Subject: [PATCH v1 4/7] dt-bindings: watchdog: add SMARC-sAM67 support
Date: Fri, 22 Aug 2025 15:15:28 +0200
Message-Id: <20250822131531.1366437-5-mwalle@kernel.org>
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

The SMARC-sAM67 board has an on-board uC which has the same register
interface as the older CPLD implementation on the SMARC-sAL28 board.
Although the MCU emulates the same behavior, be prepared for any quirks
and add a board specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 179272f74de5..b5b624e85468 100644
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



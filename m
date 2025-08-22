Return-Path: <linux-watchdog+bounces-4040-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EED10B3192A
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 15:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC6DAC1E65
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 13:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4942FFDE1;
	Fri, 22 Aug 2025 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0x3Cq6d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB5D2FE585;
	Fri, 22 Aug 2025 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868555; cv=none; b=fLuMf2gUest9gDzkZPHfxFHRouMQwO7iASI36RsRnbffZHvoDVY/mQwbOA1Gd3ZImXmU5rz9itSGM+bhLnMAGEfn6R/zgBGG1jaYw995FukrPo7QU+hQ/mIchjMmjVXI4vB9LbEfy5FDAAEvNdYxoNGaZB2+yEd/8diT20F6aPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868555; c=relaxed/simple;
	bh=t0S8VoLjEG5TZjjggFVPP43JdfXO/Pppd/IA/GIc10g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s/15v5VQQtLomOQwW3elTek1GSZy1xYk9gImAdfw8+YtBi9FKxnnvLRcd6vVJZPuJQssiwvceq5F0cIaExc5KiQEoZgdvRKJgk10RPuByyp24nsQwxAAJGF6cYxBTlEY7ikhzyK3B1W6Wug85UZEeCEuUFXUDeCai5Ee8cbnGRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0x3Cq6d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D30DC113D0;
	Fri, 22 Aug 2025 13:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868553;
	bh=t0S8VoLjEG5TZjjggFVPP43JdfXO/Pppd/IA/GIc10g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0x3Cq6dz1yCCPcx33e6Dr106jKGWLypvcT9jzL6hw55CDS0+YsHnc3ZNIlTXa76p
	 WncZNqibOD9REKi4e7TKxFweIySV4CviPiIyTX7ICc+VdTSM7dK98IqEr+CfkdzhVc
	 HLuqV83rXdMY8vX4Pk5RtxNJcfaxEylezdwxh46w86wrrNIbvVLF7TNurbAReC9wjH
	 rZII6F4g9IoqSwUJAJVJSdabdwYJIia/j1qlGFVq3Npb+I8uK8zSDEzADgSB0b0foE
	 rtvjoq23Cs++wVsbq1hGeCBxYAvfWHXMUeJlFJeVXCoBf6Yzvoxnog9zG6xf+EUfaA
	 zMbrek0qXH0Mg==
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
Subject: [PATCH v1 2/7] dt-bindings: mfd: sl28cpld: add sa67mcu compatible
Date: Fri, 22 Aug 2025 15:15:26 +0200
Message-Id: <20250822131531.1366437-3-mwalle@kernel.org>
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
It's designed to be compatible with the older on-board CPLD used on the
SMARC-sAL28 board. To be prepared for any board specific quirks, add a
specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/mfd/kontron,sl28cpld.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
index 37207a97e06c..400f56d6a231 100644
--- a/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/mfd/kontron,sl28cpld.yaml
@@ -16,7 +16,12 @@ description: |
 
 properties:
   compatible:
-    const: kontron,sl28cpld
+    oneOf:
+      - items:
+          - enum:
+              - kontron,sa67mcu
+          - const: kontron,sl28cpld
+      - const: kontron,sl28cpld
 
   reg:
     description:
-- 
2.39.5



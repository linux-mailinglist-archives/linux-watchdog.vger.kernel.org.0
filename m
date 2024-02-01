Return-Path: <linux-watchdog+bounces-558-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BBE84573F
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Feb 2024 13:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 357CB284EA4
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Feb 2024 12:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C857815DBA4;
	Thu,  1 Feb 2024 12:20:06 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF015DBB0
	for <linux-watchdog@vger.kernel.org>; Thu,  1 Feb 2024 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706790006; cv=none; b=N4mnq14hO2W60+1e4rsNFDe+vjEAnQ5PtNGhRAQXxU8aJHL3aPFE26RixN+UbAW2XdT6foQ1wqdUSJXBNbOhC0k7RkSmH1F+1OgNOxX7xEWGM0cn3GdvWH1MQ2l1w81kexG2HHbk8TG+3C8KmMrF6I9n52+KkTRZhGqKks2dyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706790006; c=relaxed/simple;
	bh=4QkTiAq+P27iBletpwP/MFG6zBGN5SP9mro9n1tLabI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OpVL7amg0Qjbpgb/BsDh68zVYJ1eeGEs2eg0wWVWaYuUuEUpedNmYAbT44Vm+eekNd/Jk1yoCIh1s1o4Ft4/WXRE+e8kTS7zxOzl5trZPfBUDKgB7+SKwG6V3O2zM0W57GDqzBSh8p29tiQFJ6tUhgGQpAE9RqoSp9ipjkhRhtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by andre.telenet-ops.be with bizsmtp
	id hoL12B00J4efzLr01oL1jh; Thu, 01 Feb 2024 13:20:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW28-00Guxm-6G;
	Thu, 01 Feb 2024 13:20:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVW2z-00ARos-60;
	Thu, 01 Feb 2024 13:20:01 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Minh Le <minh.le.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: watchdog: renesas-wdt: Add support for R-Car V4M
Date: Thu,  1 Feb 2024 13:19:59 +0100
Message-Id: <8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minh Le <minh.le.aj@renesas.com>

Add documentation for r8a779h0 compatible string to
Renesas watchdog device tree bindings documentation.

Signed-off-by: Minh Le <minh.le.aj@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 951a7d54135a6849..ffb17add491af98b 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -71,6 +71,7 @@ properties:
               - renesas,r8a779a0-wdt     # R-Car V3U
               - renesas,r8a779f0-wdt     # R-Car S4-8
               - renesas,r8a779g0-wdt     # R-Car V4H
+              - renesas,r8a779h0-wdt     # R-Car V4M
           - const: renesas,rcar-gen4-wdt # R-Car Gen4
 
   reg:
-- 
2.34.1



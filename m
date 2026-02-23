Return-Path: <linux-watchdog+bounces-4968-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOihNIUmnGlzAAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4968-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:57 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B79BF1747EA
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E244302493A
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 10:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94253559DF;
	Mon, 23 Feb 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvwGWUBr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847EC344056;
	Mon, 23 Feb 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841134; cv=none; b=q/TIGskE4AqYHZT55w6pEJ3XUrlaqLJDT0MpMEL4V2Jb4+b3o/Lh2JVnpstsclxMz5rzPovnywv4fr637BHoB1D4V+raK7FkHzlc+RzdebXLTXUI0snCFp63V5UQgnoGhmHqCNGw/lY+Fu/HsgOWBN1GIflfJgQnuBX+1SSdtWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841134; c=relaxed/simple;
	bh=4TnyH0MD9FtIkK24YiVbmYeV/1WFJ3Nney2VWTHmbo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFQZydudEgLQwN6Mk96WJQWpkUsHjHtcTW0kVvMheOP4FGcsUw2E/C3u8Z68o04XBYuc7ccmEeeJ1oOh5ffuWH+6XsVdUFNKbNo7RZF4fGNMjg8QvEzIrNyohHD1K43TGZigsSVZbyBQMWM766s0h60eLymwzrAL4wYO8WGg5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvwGWUBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43E6C116D0;
	Mon, 23 Feb 2026 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841134;
	bh=4TnyH0MD9FtIkK24YiVbmYeV/1WFJ3Nney2VWTHmbo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvwGWUBrDS+wuqmnAZ1IeewwERcKsYeEi/o46OMyS/Bw8D4cmaiM+Y44L/DTjQsqu
	 jDTM4pgFG+E9apk4Ltoyu9H5sBv6UjHeIfh4cxsGePlbDEdlKhivBFYNhmP+RET189
	 byIvCuxqDti9kY+EZymEImToGxf45dgQBUShtHIzPPoWF36JbNYoaVbkdIniAfWoxU
	 bs+MK8vd5vlYdI/FblXSvO4IYiMINpxQbHisaibl/1TUPCUPwm0QeeWzI1DtNJJWr/
	 ipBYqMiieHG4LkNQqBHVtMSybgbDzv0CroiQof24gvjhjD7swKMDfNoFml+8j3oCPY
	 GH9GZmLbUvFDQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 7/8] Revert "dt-bindings: watchdog: Add SMARC-sAM67 support"
Date: Mon, 23 Feb 2026 11:04:52 +0100
Message-ID: <20260223100459.844967-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-4968-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B79BF1747EA
X-Rspamd-Action: no action

This reverts commit 354f31e9d2a3e4799d3d057a9e1c9f7ae7348bba.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 0821ba0e84a3..872a8471ef65 100644
--- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
@@ -18,12 +18,7 @@ allOf:
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67mcu-wdt
-          - const: kontron,sl28cpld-wdt
-      - const: kontron,sl28cpld-wdt
+    const: kontron,sl28cpld-wdt
 
   reg:
     maxItems: 1
-- 
2.47.3



Return-Path: <linux-watchdog+bounces-5033-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPAhJPuDpWkCDAYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5033-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:35:07 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FD1D8A32
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 648D130B0F1A
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 12:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E890836E47A;
	Mon,  2 Mar 2026 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxBWpeWY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E336CE06;
	Mon,  2 Mar 2026 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454370; cv=none; b=QOlPFqxdqUm58lNh5iXs+rxr1dOYu+tO/yeGlj5Xxe8HhvDYgz7I9mOoSIfh7owYUNQ8ML8pkcVD1k+5ySfLPNkWBjp6/9C2BhflhQ1VwYA9u0Ipr1HE86KP5v1t+fsVo6diEVt0FDodt/0YvnjRdgZusjSXJnQDdi3vNpL0lwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454370; c=relaxed/simple;
	bh=muNQEGPiM0J5Z3fR8UE87fSFRuBeMgXK4p4PO32Eoag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtH/fPIKNyy21m1RurN2aFVbIhQ2UFefa8BcIkMl50xHeVa6gV9qdkY33psrjBkxISuCOzHtBlFGjW4de7EnaPQ5M+SmDYQHiNz/29wlO81QZ9uthX731HaC0LIgnAaXkbRD01MjqMx8ZoI15HCouvFh0VrtJFug2bJQT0OrKEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxBWpeWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66474C2BCB4;
	Mon,  2 Mar 2026 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454370;
	bh=muNQEGPiM0J5Z3fR8UE87fSFRuBeMgXK4p4PO32Eoag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxBWpeWYB66i9HHzyo0YVHfcJm0p4FOpByMvmykrCeE1D8zOIz3yD7ogMjCdsTYLR
	 xokj33qW/Ci056eU57dycdPjR7s26DvF+Ki5CKYdNLtHveU+I5Ou/bRZtbZwdNEs/Z
	 Dnb1e3JF+gPj6A3daLCJ4w3JzX3y3ZfxVEZjMvrm8rfhLZPSF0f3AweBo8zHb1tNXS
	 CiBKhUuGuArt+rZA2a5FlpakfSkOgKVYZxY0uq2jQiE2OmC9gJ/LyAe01PZtCcno5l
	 ZW/78NImX8qPB1tbavFCrBECbdCFlwonDvJ8E5aNIshpD+OQda4vRzB7DYw0NAW0GB
	 WU2RKZRRiJQ2A==
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
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/7] dt-bindings: mfd: sl28cpld: Drop sa67mcu compatible
Date: Mon,  2 Mar 2026 13:24:48 +0100
Message-ID: <20260302122540.1377444-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-5033-lists,linux-watchdog=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 028FD1D8A32
X-Rspamd-Action: no action

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time and revert commit a598ae45f48d ("dt-bindings: mfd:
sl28cpld: Add sa67mcu compatible").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/embedded-controller/kontron,sl28cpld.yaml     | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
index a77e67f6cb82..0b752f3baaa9 100644
--- a/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
@@ -16,12 +16,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67mcu
-          - const: kontron,sl28cpld
-      - const: kontron,sl28cpld
+    const: kontron,sl28cpld
 
   reg:
     description:
-- 
2.47.3



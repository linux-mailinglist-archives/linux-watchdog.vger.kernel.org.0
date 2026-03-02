Return-Path: <linux-watchdog+bounces-5036-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA6QAe+DpWmxCwYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5036-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:34:55 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC11D89FD
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B6A3090EFB
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 12:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8813C3B8BA2;
	Mon,  2 Mar 2026 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPekgRzi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234E37104C;
	Mon,  2 Mar 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454383; cv=none; b=O1FBCwapXKsLOVdKnR7VEqDLCR2vwCQr+NANI8WWeaTFygHgVS9IcY3vumhUiuHDsc35snPFL8jdfLybkjpbOzt9VaHnyrBz6dSoPdrsdaRkSbHAOV451QtlsZZNbnl1aEcjniT3iGiMBf++JK73wkfpuyu49lJJHkYyCwlnPhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454383; c=relaxed/simple;
	bh=SHoA2Wn366pwsmdbdTIEzKutBPmNFtYIiz3QL9a36j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H/D+fHtfReWcAph7EiBRnBoFkthMKIw5zxveNiA0LSb+v7gs9QV3z13MvKlcZ7AHzeItg+e64q8u74O0EMFqQyiirudlDtzuxTIIpxXIuMtHx3sjPowWN+uOAgtc8DZG+Uf5I0UZfWd7DMC4LuKd5T3dMRFI2JSDX0akFnZCMUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPekgRzi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7A2C19423;
	Mon,  2 Mar 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454382;
	bh=SHoA2Wn366pwsmdbdTIEzKutBPmNFtYIiz3QL9a36j8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dPekgRziDFyvdpTMCdgKH9QZM9OpV1JEXfpbzz/lWwqxlZmGBxpBoN84uN3h+jS+N
	 wWkT/RKKjoBQsdzKWw0JooPz5jSG1XtH+5dxe9usQGKPNhT6VNJ0cmSAjcDSmJawtm
	 8fhX+uirQv3iForEvtlYOw/+tOS5h21t07r1epBRXbnPui54r6Y3/bcTEAcMmvdCjC
	 xSY7V3v5PseaAr0Ukve0jY9a48r/uOpXX0xjZX1LXjrN7i9mqQRJ7F3/viLyATAQie
	 lWQtIZ4MNFAZTxqU5MfySYy6dMfg/5/RT30zEzwYMe4XHdPP6St3oK+STdKpd9vhoH
	 YXPXWNNhjsXEA==
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
Subject: [PATCH v2 6/7] dt-bindings: watchdog: Drop SMARC-sAM67 support
Date: Mon,  2 Mar 2026 13:24:51 +0100
Message-ID: <20260302122540.1377444-7-mwalle@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-5036-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 92DC11D89FD
X-Rspamd-Action: no action

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time and revert commit 354f31e9d2a3 ("dt-bindings: watchdog:
Add SMARC-sAM67 support").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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



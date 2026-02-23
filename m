Return-Path: <linux-watchdog+bounces-4965-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPGEEMwmnGl1AAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4965-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:07:08 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D729E174871
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24E15305E320
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 10:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6FC355026;
	Mon, 23 Feb 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlyeFPGL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7250354AC7;
	Mon, 23 Feb 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841122; cv=none; b=kFAjN0Dk90wFAh+SolmawBr6x+RwSr6q+8FbyG7cZw0e93rx2/shi0h8RnlCeB7JFMMbVnFZDRoIiHaiNtk5IEh0HIbi8KNkI9l6VwM3tDYvxaFu2BqJ3rk5UleOJsM3P6pl4w1/mB0hoBtVt2kgHUL/9obP8dh9X0AqrLOPqLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841122; c=relaxed/simple;
	bh=OfeTJCBWgvRM/swVA6HkACwwUZ1drAGlMZjeKlncfTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctKHNGhlRfqGXYF63cwB3p06O3y54wzi/5zfkGKwVIUs3Pf/kWprLRUY7kAKGAybX2OspYg5VLZvN95MgJAsgkk5iv2vvA2HEIaAC2hfFit6x5qKv57/mHWKdQSIcjdR6cTez+s4yZCwmzQqAIVd3WtjWg2b1JKV1eieZ4hEIts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlyeFPGL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE3EC2BCB0;
	Mon, 23 Feb 2026 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841122;
	bh=OfeTJCBWgvRM/swVA6HkACwwUZ1drAGlMZjeKlncfTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlyeFPGLNjwP0u2KWarn42D4gDcmveoSUj2po/QwdN1y7n1MZ7Io6DxEMhpo3I5Ao
	 wf64sMkUUGy/51pJ6i31CXR1mEngxkqUW7iQYGOeybJ4Tr/SxneGR/GSbG6rPpgn2C
	 FCgfDNgTWYRQeqv6FtuSa+v+0lje4kmB97jCN9NtCYBgDVlKkgltCdnf0iHpowmmJ7
	 5qcOEuB49P/VCHepDQENdtgl4VmcoIycI6XEDj+LEd7roTvV+TfMTWLtL9Yp+dOFj7
	 +GdcymAttGssRTCWhWQIpBFZ7jL52RVlrOhW0dU9Bc6pfz2UibCs/0Dau65N0/ysDG
	 HI+Aj/6amH4Aw==
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
Subject: [PATCH 4/8] Revert "dt-bindings: mfd: sl28cpld: Add sa67mcu compatible"
Date: Mon, 23 Feb 2026 11:04:49 +0100
Message-ID: <20260223100459.844967-5-mwalle@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-4965-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D729E174871
X-Rspamd-Action: no action

This reverts commit a598ae45f48d7d5a17f8290f2f5bd46046fd0b9b.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

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



Return-Path: <linux-watchdog+bounces-5035-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kISYDJOEpWkeDAYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5035-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:37:39 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C58C1D8B7C
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 13:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4A0630B714B
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 12:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6D63B3C0C;
	Mon,  2 Mar 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D27uCz/r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1E3B3BF7;
	Mon,  2 Mar 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454378; cv=none; b=jXaXnYb46V+8f/fYpAt49MVii5TKkSwwvLjniyZIi5akcBCBU5t2pui4GpjE0nxk4ImHiBz1LwehGdh+nk+Gq/3J/QtTm6TLx+hqEw3DxXzbb5qZqKdSmlDJ/CcSVa4/HNAH7bqe3FkyzRvuO3sDvKx6QsQjgwXahwB0RkIdzUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454378; c=relaxed/simple;
	bh=I4NFZM5AIlzm74pVn+R2WfmjjzGkM1+mEAg/zfHxn/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCVfTiTdTddjl3nC7PM0kfEXmjmMaK7dToHHHkaWBWsCRvHAY/qjjS2tTo1RipxGG1MLaXB7kPy1gdOsmaMRJPWu/q5c8bRVEt/yJiWWX183IZXeWToRaT+4Aj1a7eNpZP6zoH6oQRg63MxhZX6ar84UxalLBChr+O2uifVboKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D27uCz/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E82C2BC86;
	Mon,  2 Mar 2026 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454378;
	bh=I4NFZM5AIlzm74pVn+R2WfmjjzGkM1+mEAg/zfHxn/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D27uCz/rNmOgc3Ikmrs4/qTihBfzt4Vjzk3pne8HYPMV8ROwf188qYm3G+OexKRqe
	 8ECloHLUkwaro3rr9+ouoSzo7EtmzGblOGRDXnTUrI7bORtxob7+JI07wKy8c57C/z
	 rjwUDjhkBJRrgm1GW7HwsIXqE9zlCKJyVlWvvQUrt1Bn6sWMmcB8aCsr6lOl1Zq21w
	 xt6CFQlVB5hnrZhy6I2xd0qncdE1JUB+bD+VfwBpm5HOBIcBy3BRpHXGZExw1IpFQV
	 Wnf0jCrsNeZsz5UpK2oklfg+lJYmq1koKNJx8f9ci592w4OU7JLAFaSVKX/0qOQXFE
	 I3XnMQ6RvTo+Q==
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
Subject: [PATCH v2 5/7] dt-bindings: nvmem: sl28cpld: Drop sa67mcu compatible
Date: Mon,  2 Mar 2026 13:24:50 +0100
Message-ID: <20260302122540.1377444-6-mwalle@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-5035-lists,linux-watchdog=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C58C1D8B7C
X-Rspamd-Action: no action

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time and revert commit 4a9b344e90c7 ("dt-bindings: nvmem:
sl28cpld: add sa67mcu compatible").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/nvmem/layouts/kontron,sl28-vpd.yaml           | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
index afd1919c6b1c..c713e23819f1 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
@@ -19,12 +19,7 @@ select: false
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67-vpd
-          - const: kontron,sl28-vpd
-      - const: kontron,sl28-vpd
+    const: kontron,sl28-vpd
 
   serial-number:
     type: object
-- 
2.47.3



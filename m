Return-Path: <linux-watchdog+bounces-5012-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ8KN0Q/ommq1AQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5012-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:05:08 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D81BF9BA
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10507301F481
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8622EAD10;
	Sat, 28 Feb 2026 01:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2rqbyNQC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418472DF6F4;
	Sat, 28 Feb 2026 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240653; cv=none; b=cL43ZNzP13hCAmwX0gGo2wQXBqhh7QEhKkTl2ktaYWDnl3DFka2bCkQ5vNv/8MKVTs2DKtOEC6KGyTAe2HXpw3nM+MqCaqa1btV2m9iicGGRcoVVgPk5w1yXLBN+wPTekQkl57BtZ7J8USGVpyiaQfOgMqQkSK1mbEDoV7HU/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240653; c=relaxed/simple;
	bh=eDJSFA0hcMxJDX7BZ2hwPfrQ+U99gfCycDQhSxbLEdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZx+yzVYc8xIveN4fkoOw5N+0lPbSX6Htp6DioDIyq0ducNK1tQ1lQleSIOXKP5LUZwsaGYs9azWKlTXrmkV09IB38RbT4jHdKW9lctJ+fMNGArlDiCza/k9ltaWTHLz4qs77y/Y2EEwg50vxponUsAoeeiGhlq1GUZc/vnD1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2rqbyNQC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=4FAnV/x+3yyuJGotzK/5VswQVoGcg5nLdlWFltCHFrU=; b=2rqbyNQCF39YR/9R/1ZbFYUshK
	TzTv6vgmKGicNLplUWSa/3OdfGm1LQqAF3zh/5WDzqbQuOyJqL7WN/u9gkYyghE7sVDrbp27Gh6FH
	USz+T4uvJrVNg72uLtKu3qGJbAh3dmXjR7ZYkgDywSivEBpuwDCOC1JsL4loQ4OHv48MohHOAhZoL
	vg/GzzXSQydjiiMCs1UAcrdNeG5mqIun9BdVRdmZmz0iAwD1e1zB+zM2tyKPH20i/nGk/2SGrBll0
	NY1NPNy3JxtF9N0ixqvXKoGDRn5D7z0iV6hLrEtoU37mTHvMDuzNzPNfM+DluCnTtMonwv/jZ5a1M
	8h5O/50w==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8kY-00000009Mfc-25uG;
	Sat, 28 Feb 2026 01:04:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 5/5] docs: watchdog-parameters: add missing watchdog_core parameters
Date: Fri, 27 Feb 2026 17:04:02 -0800
Message-ID: <20260228010402.2389343-6-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228010402.2389343-1-rdunlap@infradead.org>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5012-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 942D81BF9BA
X-Rspamd-Action: no action

Add missing watchdog_core parameters (handle_boot_enabled and
stop_on_reboot).
Add default values for handle_boot_enabled and open_timeout.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/watchdog/watchdog-parameters.rst |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

--- linux-next-20260227.orig/Documentation/watchdog/watchdog-parameters.rst
+++ linux-next-20260227/Documentation/watchdog/watchdog-parameters.rst
@@ -14,13 +14,22 @@ modules.
 -------------------------------------------------
 
 watchdog core:
+    handle_boot_enabled:
+	Watchdog core auto-updates boot-enabled watchdogs before userspace
+	takes over. Default is set by the kconfig option
+	CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
+
     open_timeout:
 	Maximum time, in seconds, for which the watchdog framework will take
 	care of pinging a running hardware watchdog until userspace opens the
 	corresponding /dev/watchdogN device. A value of 0 means an infinite
 	timeout. Setting this to a non-zero value can be useful to ensure that
 	either userspace comes up properly, or the board gets reset and allows
-	fallback logic in the bootloader to try something else.
+	fallback logic in the bootloader to try something else. Default is set
+	by the kconfig option CONFIG_WATCHDOG_OPEN_TIMEOUT.
+
+    stop_on_reboot:
+	Stops watchdogs on reboot (0 = keep watching, 1 = stop).
 
 -------------------------------------------------
 


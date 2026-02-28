Return-Path: <linux-watchdog+bounces-5011-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCwMNC8/ommq1AQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5011-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:47 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 638D01BF996
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53287306680A
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3504A2E5B19;
	Sat, 28 Feb 2026 01:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="R38aaFnB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3B2D73A6;
	Sat, 28 Feb 2026 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240651; cv=none; b=Q0Zp7xLN2Hq+FUTqRzsVjvbogrfPk+oQdkQP/e+wpeYCPeIfVOxxDAQhjI0Z0pQS7ERzcDMfR+Kt7DhX40zDV+qOlcDZyaaksLYb/DXj9dO8jN/VP2sQL6qBbHGsDSDprK6/neVlOu5w+ewtKFVble9LA7tf36fwtQU87yUvtr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240651; c=relaxed/simple;
	bh=tVLggoFebkAfNnxYS6zfQPUr+0g4pFS4bcnkv/JVsn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcRfMC4h50JDP9w6u5LaUAomfa91I6S+wkQZ+sqEdXSflhybQjYhC9A4A3nrBPn8s5WfaNhREGzBn4gN7RbHyAHoWfwYkxiaRcidmxMedp2BUd/nva2szI8k5t+2I9RP39MUlIMr8yJwnhqq1VDFv8Q8njB7Iil+m5HXiK2umAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=R38aaFnB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Zjq6BXTlTfUUfVB5XqyRQcickx/QeCRPF4dFlky672A=; b=R38aaFnB9f7PbJgiEqWP7vi4DV
	BPfgAlanrCBvWLs18XiSHN8Sne11WYBBkGy6aYdXoCR9Py3Cd+lu6Y2G65qkE57v3JZMi+80NRvTh
	NHcR+FmhPZ9ojhsOSeHDdOCJ95CQwlMJTj+o0i2RUHk60JAYcfSlnMAnX/AJZtJ+v4TKTYAB6eg7t
	cAqTFfUvUEzFRUih4ZrvPiqZNBN/6E82hSDQ0uaG/Rrf6He6n31NES3RmnA8Ssb3FLEHyVF/ru5Do
	n+tsU+NW7820ZFT3JEwhiNTSQSDOxrM0H2Yar96bxZgUmzLmTxHJ/rUuMHM3YZ//nq17ponvDigq5
	Ig8Wd5ww==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8kX-00000009Mfc-48TV;
	Sat, 28 Feb 2026 01:04:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 4/5] docs: watchdog-kernel-api: general cleanups
Date: Fri, 27 Feb 2026 17:04:01 -0800
Message-ID: <20260228010402.2389343-5-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-5011-lists,linux-watchdog=lfdr.de];
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
X-Rspamd-Queue-Id: 638D01BF996
X-Rspamd-Action: no action

Fix grammar and punctuation.
Add a missing struct member (pm_nb) and its description.
Add a subheading for Helper Functions between the struct descriptions
and just pure helper functions.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/watchdog/watchdog-kernel-api.rst |   20 +++++++++------
 1 file changed, 13 insertions(+), 7 deletions(-)

--- linux-next-20260226.orig/Documentation/watchdog/watchdog-kernel-api.rst
+++ linux-next-20260226/Documentation/watchdog/watchdog-kernel-api.rst
@@ -38,8 +38,8 @@ The watchdog_unregister_device routine d
 device. The parameter of this routine is the pointer to the registered
 watchdog_device structure.
 
-The watchdog subsystem includes an registration deferral mechanism,
-which allows you to register an watchdog as early as you wish during
+The watchdog subsystem includes a registration deferral mechanism,
+which allows you to register a watchdog as early as you wish during
 the boot process.
 
 The watchdog device structure looks like this::
@@ -60,13 +60,14 @@ The watchdog device structure looks like
 	unsigned int max_hw_heartbeat_ms;
 	struct notifier_block reboot_nb;
 	struct notifier_block restart_nb;
+	struct notifier_block pm_nb;
 	void *driver_data;
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
 	struct list_head deferred;
   };
 
-It contains following fields:
+It contains the following fields:
 
 * id: set by watchdog_register_device, id 0 is special. It has both a
   /dev/watchdog0 cdev (dynamic major, minor 0) as well as the old
@@ -105,6 +106,8 @@ It contains following fields:
   internal use only. If a watchdog is capable of restarting the machine, it
   should define ops->restart. Priority can be changed through
   watchdog_set_restart_priority.
+* pm_nb: coordinates watchdog_dev_suspend/resume to cancel a ping worker
+  during suspend and restore it during resume.
 * bootstatus: status of the device after booting (reported with watchdog
   WDIOF_* status bits).
 * driver_data: a pointer to the drivers private data of a watchdog device.
@@ -204,7 +207,7 @@ they are supported. These optional routi
   If the watchdog driver does not have to perform any action but setting the
   watchdog_device.timeout, this callback can be omitted.
 
-  If set_timeout is not provided but, WDIOF_SETTIMEOUT is set, the watchdog
+  If set_timeout is not provided but WDIOF_SETTIMEOUT is set, the watchdog
   infrastructure updates the timeout value of the watchdog_device internally
   to the requested value.
 
@@ -220,7 +223,7 @@ they are supported. These optional routi
   the watchdog". A value of 0 disables pretimeout notification.
 
   (Note: the WDIOF_PRETIMEOUT needs to be set in the options field of the
-  watchdog's info structure).
+  watchdog's info structure.)
 
   If the watchdog driver does not have to perform any action but setting the
   watchdog_device.pretimeout, this callback can be omitted. That means if
@@ -239,7 +242,7 @@ they are supported. These optional routi
 The status bits should (preferably) be set with the set_bit and clear_bit alike
 bit-operations. The status bits that are defined are:
 
-* WDOG_ACTIVE: this status bit indicates whether or not a watchdog timer device
+* WDOG_ACTIVE: this status bit indicates whether a watchdog timer device
   is active or not from user perspective. User space is expected to send
   heartbeat requests to the driver while this flag is set.
 * WDOG_NO_WAY_OUT: this bit stores the nowayout setting for the watchdog.
@@ -254,6 +257,9 @@ bit-operations. The status bits that are
   then opening /dev/watchdog will skip the start operation but send a keepalive
   request instead.
 
+Helper Functions
+~~~~~~~~~~~~~~~~
+
   To set the WDOG_NO_WAY_OUT status bit (before registering your watchdog
   timer device) you can either:
 
@@ -331,7 +337,7 @@ To raise a pretimeout notification, the
   void watchdog_notify_pretimeout(struct watchdog_device *wdd)
 
 The function can be called in the interrupt context. If watchdog pretimeout
-governor framework (kbuild CONFIG_WATCHDOG_PRETIMEOUT_GOV symbol) is enabled,
+governor framework (kconfig CONFIG_WATCHDOG_PRETIMEOUT_GOV symbol) is enabled,
 an action is taken by a preconfigured pretimeout governor preassigned to
 the watchdog device. If watchdog pretimeout governor framework is not
 enabled, watchdog_notify_pretimeout() prints a notification message to


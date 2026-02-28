Return-Path: <linux-watchdog+bounces-5009-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILtmJyg/ommq1AQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5009-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:40 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C41BF987
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC737305309E
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A1E2DB79E;
	Sat, 28 Feb 2026 01:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MC49xDum"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE932D839B;
	Sat, 28 Feb 2026 01:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240649; cv=none; b=cnk0csbpdODQUUXb/TLKfCeoOfGnR6V+ctJdr8Ra2Yt8UGR2kA7nz2Uv8yA3gxckmufdRelS23dAW5IfHTs9L1v8WY4PSPzwQt0YGvY1lLI4CKu+1nHL9VurngDyj6J/hijM934Tcht+CWeHFOh25CcImSFl75kPYzPXqaC0DOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240649; c=relaxed/simple;
	bh=rY4IlC/9+j7O1q//Be/27tic1bY/AHdhYFEJ2X/S5UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYTYxHW+j/2yovBVm+fT2QJAfBPRYtHZ797Kc4BBNm/79onwUtj/POPEaol2XE2TztFG4xMebVRsoeMyNHtA3dUz8lzgt7P2uAcUJtsTWHINLFgW7r7xgbypPipFNH23M/T9u/myzydA7vIdcyyPhmccqQGU3BcobwUqELYGre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MC49xDum; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Ncg1Cg97cuYjXJjxmO2TWQjS13k8RVZHQbLYYSs/J+4=; b=MC49xDumiGwUs5ozIxAvQqHW9e
	GzEnUa/w/LRwF2LVPvzF+KLStY3sCztMiNFAZxjMAV0IeUJ8JyibpNWfFe5OfoEwkWG+9f4sG7SLL
	v10Q/LU2gzTyxbddBN8Y0mHjoIRcvoCT9cuDKHBJFPL+eqEA4ABh+vjQ4ZtMYM9EkwTd8Ibvjj3Wg
	JIY/FhxwklxjsWN3eHnEZVZGZ9wmCNIqmE5JOte3q8ZYT+E5L4ACnkTbVnrzxUNTlrc6Jl/Vwc9E+
	l4km+Ma71I5pxOV/8dXNkW8dVWWrCckeuG9R1fuJpLKzxtukxkk1JuZhmhwvZW5kldbKhbU6qIv58
	wxxxLopA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8kX-00000009Mfc-2BMW;
	Sat, 28 Feb 2026 01:04:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/5] docs: watchdog-api: general cleaning
Date: Fri, 27 Feb 2026 17:04:00 -0800
Message-ID: <20260228010402.2389343-4-rdunlap@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5009-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3E3C41BF987
X-Rspamd-Action: no action

Correct some grammar, punctuation, and capitalization mistakes.

Drop extra words in printf() calls [likely a copy-paste error].

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/watchdog/watchdog-api.rst |   38 +++++++++++-----------
 1 file changed, 20 insertions(+), 18 deletions(-)

--- linux-next-20260226.orig/Documentation/watchdog/watchdog-api.rst
+++ linux-next-20260226/Documentation/watchdog/watchdog-api.rst
@@ -39,12 +39,12 @@ The simplest API
 
 All drivers support the basic mode of operation, where the watchdog
 activates as soon as /dev/watchdog is opened and will reboot unless
-the watchdog is pinged within a certain time, this time is called the
+the watchdog is pinged within a certain time; this time is called the
 timeout or margin.  The simplest way to ping the watchdog is to write
 some data to the device.  So a very simple watchdog daemon would look
 like this source file:  see samples/watchdog/watchdog-simple.c
 
-A more advanced driver could for example check that a HTTP server is
+A more advanced driver could for example check that an HTTP server is
 still responding before doing the write call to ping the watchdog.
 
 When the device is closed, the watchdog is disabled, unless the "Magic
@@ -87,13 +87,13 @@ replaced with::
 		sleep(10);
 	}
 
-the argument to the ioctl is ignored.
+The argument to the ioctl is ignored.
 
 Setting and getting the timeout
 ===============================
 
 For some drivers it is possible to modify the watchdog timeout on the
-fly with the SETTIMEOUT ioctl, those drivers have the WDIOF_SETTIMEOUT
+fly with the SETTIMEOUT ioctl; those drivers have the WDIOF_SETTIMEOUT
 flag set in their option field.  The argument is an integer
 representing the timeout in seconds.  The driver returns the real
 timeout used in the same variable, and this timeout might differ from
@@ -110,7 +110,7 @@ Starting with the Linux 2.4.18 kernel, i
 current timeout using the GETTIMEOUT ioctl::
 
     ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
-    printf("The timeout was is %d seconds\n", timeout);
+    printf("The timeout is %d seconds\n", timeout);
 
 Pretimeouts
 ===========
@@ -133,7 +133,7 @@ seconds.  Setting a pretimeout to zero d
 There is also a get function for getting the pretimeout::
 
     ioctl(fd, WDIOC_GETPRETIMEOUT, &timeout);
-    printf("The pretimeout was is %d seconds\n", timeout);
+    printf("The pretimeout is %d seconds\n", timeout);
 
 Not all watchdog drivers will support a pretimeout.
 
@@ -145,13 +145,13 @@ before the system will reboot. The WDIOC
 that returns the number of seconds before reboot::
 
     ioctl(fd, WDIOC_GETTIMELEFT, &timeleft);
-    printf("The timeout was is %d seconds\n", timeleft);
+    printf("The timeout is %d seconds\n", timeleft);
 
 Environmental monitoring
 ========================
 
-All watchdog drivers are required return more information about the system,
-some do temperature, fan and power level monitoring, some can tell you
+All watchdog drivers are required to return more information about the system.
+Some do temperature, fan and power level monitoring; some can tell you
 the reason for the last reboot of the system.  The GETSUPPORT ioctl is
 available to ask what the device can do::
 
@@ -166,7 +166,7 @@ the fields returned in the ident struct
 	options			a flags describing what the device supports
 	================	=============================================
 
-the options field can have the following bits set, and describes what
+The options field can have the following bits set, and describes what
 kind of information that the GET_STATUS and GET_BOOT_STATUS ioctls can
 return.
 
@@ -175,13 +175,13 @@ return.
 	================	=========================
 
 The machine was last rebooted by the watchdog because the thermal limit was
-exceeded:
+exceeded.
 
 	==============		==========
 	WDIOF_FANFAULT		Fan failed
 	==============		==========
 
-A system fan monitored by the watchdog card has failed
+A system fan monitored by the watchdog card has failed.
 
 	=============		================
 	WDIOF_EXTERN1		External relay 1
@@ -195,26 +195,26 @@ a reset.
 	WDIOF_EXTERN2		External relay 2
 	=============		================
 
-External monitoring relay/source 2 was triggered
+External monitoring relay/source 2 was triggered.
 
 	================	=====================
 	WDIOF_POWERUNDER	Power bad/power fault
 	================	=====================
 
-The machine is showing an undervoltage status
+The machine is showing an undervoltage status.
 
 	===============		=============================
 	WDIOF_CARDRESET		Card previously reset the CPU
 	===============		=============================
 
-The last reboot was caused by the watchdog card
+The last reboot was caused by the watchdog card.
 
 	================	=====================
 	WDIOF_POWEROVER		Power over voltage
 	================	=====================
 
 The machine is showing an overvoltage status. Note that if one level is
-under and one over both bits will be set - this may seem odd but makes
+under and one over, both bits will be set - this may seem odd but makes
 sense.
 
 	===================	=====================
@@ -227,12 +227,14 @@ The watchdog saw a keepalive ping since
 	WDIOF_SETTIMEOUT	Can set/get the timeout
 	================	=======================
 
-The watchdog can do pretimeouts.
+The watchdog can get/set the timeout.
 
 	================	================================
 	WDIOF_PRETIMEOUT	Pretimeout (in seconds), get/set
 	================	================================
 
+The watchdog can do pretimeouts.
+
 
 For those drivers that return any bits set in the option field, the
 GETSTATUS and GETBOOTSTATUS ioctls can be used to ask for the current
@@ -255,7 +257,7 @@ returned value is the temperature in deg
     ioctl(fd, WDIOC_GETTEMP, &temperature);
 
 Finally the SETOPTIONS ioctl can be used to control some aspects of
-the cards operation::
+the card's operation::
 
     int options = 0;
     ioctl(fd, WDIOC_SETOPTIONS, &options);


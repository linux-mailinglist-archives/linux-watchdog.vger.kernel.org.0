Return-Path: <linux-watchdog+bounces-5008-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBDmMSA/ommq1AQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5008-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:32 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471F1BF968
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E454B302E31B
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771AC2D1F7B;
	Sat, 28 Feb 2026 01:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="At/+89gi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121EC2D7DC4;
	Sat, 28 Feb 2026 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240649; cv=none; b=GxTRSJXW3/7DIQvYtzNhkWBAh3vJchtK59oA2ntQIi7NAiUC3hLvnovW4WzFgNNvuAe7ttWLwc2P8clFc3ECW91a/O53VfKlhQErNP/DKNZHOj6bbMCtj7RWz/kKa5wNfT+EE64KxppBkUUAGdw8EYZEQPwmhK4Is2mtGwjzFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240649; c=relaxed/simple;
	bh=00gRV/8Tlfk0hyLVN6Lg8+CGZQ7yA/JnPgGu9Mh5PLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd7+6CU0mV8VTzpeOejaJU8nt/YSvm64CbFUP7Ler1WX+QBFaWS77FC6soUsTuqUqrFEJcn5fp7rDdnoaoSF7NYCebZiL7QnxYjdCHjOvtChE2WcfrasPBSE7kC+J3dzTqIly5aMAFKAkO59gpQhLOhv6RrKQMvP82OohTga1+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=At/+89gi; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SNyF0aeqLbp83Ydce9E3N1h+z2UhPlrjyB1V6Oa1nNY=; b=At/+89giSc+y74I6qqfyOC6aut
	eCa8Q4LEBXGGkDWMgvWt6a85YO3SE0ewI6N44s1gz6vqIWrTzN+JpYtskjwCAgxO9eBq4qgCOxtEn
	W0+56cn9/BCUg3CT/UBTn4ezplrF7ixX8Wd9kSCzAM41vhxxbhLDxmBQTiXT62jhacJ2oWC6yZHqy
	RkCDRAAsUzk++6wuopjQWCMz2Yv4dpPvzGZ0BpgqamPiJMYFTbFv3qR77CeU+3/K2mpI4Ga9BQPiP
	Q40YAdD/0dmrOH3zJjUvWJquiHuhYQOxO4PW8wXelBxqPDTJ+zSa5oEpescrvkDID4doNETglZol9
	qNJn46ig==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8kX-00000009Mfc-0CZ1;
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
Subject: [PATCH 2/5] docs: watchdog: pcwd: fix typo and driver info.
Date: Fri, 27 Feb 2026 17:03:59 -0800
Message-ID: <20260228010402.2389343-3-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-5008-lists,linux-watchdog=lfdr.de];
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
X-Rspamd-Queue-Id: 3471F1BF968
X-Rspamd-Action: no action

Correct a typo and some technical info for the pcwd driver.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/watchdog/pcwd-watchdog.rst |   19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

--- linux-next-20260226.orig/Documentation/watchdog/pcwd-watchdog.rst
+++ linux-next-20260226/Documentation/watchdog/pcwd-watchdog.rst
@@ -29,7 +29,7 @@ Documentation and Driver by Ken Hollis <
  to run the program with an "&" to run it in the background!)
 
  If you want to write a program to be compatible with the PC Watchdog
- driver, simply use of modify the watchdog test program:
+ driver, simply use or modify the watchdog test program:
  tools/testing/selftests/watchdog/watchdog-test.c
 
 
@@ -37,16 +37,23 @@ Documentation and Driver by Ken Hollis <
 
 	WDIOC_GETSUPPORT
 		This returns the support of the card itself.  This
-		returns in structure "PCWDS" which returns:
+		returns in structure watchdog_info:
+
+                        identity = "PCWD"
+
+			options = list of supported options::
+                                  WDIOF_OVERHEAT
+                                  WDIOF_CARDRESET
+                                  WDIOF_KEEPALIVEPING
+                                  WDIOF_SETTIMEOUT
+                                  WDIOF_MAGICCLOSE
 
-			options = WDIOS_TEMPPANIC
-				  (This card supports temperature)
 			firmware_version = xxxx
 				  (Firmware version of the card)
 
 	WDIOC_GETSTATUS
 		This returns the status of the card, with the bits of
-		WDIOF_* bitwise-anded into the value.  (The comments
+		WDIOF_* bitwise-ored into the value.  (The comments
 		are in include/uapi/linux/watchdog.h)
 
 	WDIOC_GETBOOTSTATUS
@@ -55,7 +62,7 @@ Documentation and Driver by Ken Hollis <
 
 	WDIOC_GETTEMP
 		This returns the temperature of the card.  (You can also
-		read /dev/watchdog, which gives a temperature update
+		read /dev/temperature, which gives a temperature update
 		every second.)
 
 	WDIOC_SETOPTIONS


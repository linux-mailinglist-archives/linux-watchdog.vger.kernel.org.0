Return-Path: <linux-watchdog+bounces-5010-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAJKJCs/ommq1AQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5010-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:43 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F691BF98F
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 02:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16CE23055956
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Feb 2026 01:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A272DE6F1;
	Sat, 28 Feb 2026 01:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DxsuLAhp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056242D73BD;
	Sat, 28 Feb 2026 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240650; cv=none; b=MsNsFbHRVel8Z0rD20B/pRtBr8XoagENZZLZwkxpl8R0frLZkFO/4BqBiG6ZNg3wd7H6biTmdpXfxstWAuB9H0Vk9OVv7e6+f2UimSle7HSxrqJoZ9JguLJj9o1iCqj5Xvud7grSU2w+95yxnfnr3IVJR1IR+iqexX9RqMCB6eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240650; c=relaxed/simple;
	bh=iUtvJwJkLpvlzpAMej+Iu5UtThelJl1DSiHdb8NGr8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4BGyWG2JVlhKIQ4d0hnwpfoMrfHwoMr1/9aMlQBbbYVpydgUViyIye79a2X+q5MIbhg4md6W+0181UmIJS/CqhsXkQJG5g2tBPvBpbOrJPGTcSmllBHIGXI7D850TMxCkp5rheU/sOi4+3JDGnACq6mZuXpv56Kr6Ghl3vHlBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DxsuLAhp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9OW/nFvTXOKCQg+GiHw9GXlXZyUXAnFEY2zE5a54aGU=; b=DxsuLAhpWJGOk8DgyMAuClUZ33
	nFTLxXhxO3xDGqmrdaQz6qDPBLU31YlXW5FGiLF//BT9HaNZoF5sYJCpqi7iKlr3M1KUn8+S+oXuA
	otRgQti2RioirjgVvipvkZ0FAVvC1Uf9Vf2ZeyaqvQwtFGIGggu8xEd6MP9y0CzEJy0N3ZMsjKY7P
	vH2Qb3e15SCQu8B1UdboryLF2vRPoIzG/0xWQpdkTlbYyej2jz02JvZ2XyRPMV1d6vL2n6mJC0ZVP
	unRwZYqi4e+yp130I+WV1LCoWQi4qOSpJq2qQXbFTsa78aw1x1H+f0xTUVh+7EuVz+j43WQgsJlLI
	K4ux/+nA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8kW-00000009Mfc-2TZL;
	Sat, 28 Feb 2026 01:04:04 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/5] docs: watchdog: mlx-wdt: small fixes
Date: Fri, 27 Feb 2026 17:03:58 -0800
Message-ID: <20260228010402.2389343-2-rdunlap@infradead.org>
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
	TAGGED_FROM(0.00)[bounces-5010-lists,linux-watchdog=lfdr.de];
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
X-Rspamd-Queue-Id: F1F691BF98F
X-Rspamd-Action: no action

Correct some grammar and spelling mistakes in mlx-wdt.rst.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/watchdog/mlx-wdt.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260226.orig/Documentation/watchdog/mlx-wdt.rst
+++ linux-next-20260226/Documentation/watchdog/mlx-wdt.rst
@@ -28,7 +28,7 @@ Type 3:
   Same as Type 2 with extended maximum timeout period.
   Maximum timeout is 65535 sec.
 
-Type 1 HW watchdog implementation exist in old systems and
+Type 1 HW watchdog implementation exists in old systems and
 all new systems have type 2 HW watchdog.
 Two types of HW implementation have also different register map.
 
@@ -48,7 +48,7 @@ which is optional.
 Watchdog can be started during a probe, in this case it will be
 pinged by watchdog core before watchdog device will be opened by
 user space application.
-Watchdog can be initialised in nowayout way, i.e. oncse started
+Watchdog can be initialised in nowayout mode, i.e. once started
 it can't be stopped.
 
 This mlx-wdt driver supports both HW watchdog implementations.


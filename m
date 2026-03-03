Return-Path: <linux-watchdog+bounces-5051-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PlNOyAZp2m+dgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5051-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 18:23:44 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06B1F494A
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 18:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFD863013EE5
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2026 17:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6023264DE;
	Tue,  3 Mar 2026 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Y044dR5Y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4053264D7;
	Tue,  3 Mar 2026 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558621; cv=none; b=iTd8juCekoa1U4FOwIbcmFCChMmwpFjSHdIcbsmUkdFBGNzkgMPhHAWXmtu2QQuaMEh/uWIxUAYYzwBBH2fwcDZrApSHjdElNkDOq/05AlrQtY0N3aoy0ULLhQsGGkYRWIyWvEoHSDYITl9b1oAN2Vy5tGXA0XW3jw8DECYctJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558621; c=relaxed/simple;
	bh=S7S+L4dcn0iUO7ax1UZYqMfmLwgnvJFpyBZDbjJkqDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iqtc1fEe1LKc5KLkTYB/tN9+WsM0czfMSU0MzG0XbNAq8UMXRMQ0L1TQ5wffyEZSZTsF6nEFfGi64olGPyR3rK1PFVfGXnBFsJrycqdjUauuFw3xM8bw/YBDSxec1/NjHNIOHQTR1jl9lwP9xifp5DwjD2U9YX5N+0OJGWAMbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Y044dR5Y; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ECAD540429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772558618; bh=YihbDh1STpNtSF3uB3GelT6vEz9oVx20NMbIbqP9x6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y044dR5YJjZpUXPTuxxlHJVkrBPQHjyn3ziNr3RM1R+lThQhYtNKQG/p1zaA+ZDD9
	 uRVXjq0rlxz+hBm/Xr/z2QLJV8HmuTdzoSvslPHENNAlFOWXcTVmdXvx9Rydti9d0j
	 t28kPljUB6kCavF1z90gi5kdbo0kQR33oEVHi/xhyOOseepHMmw/UyRQL1V0x4uEeV
	 nKwOU7A3CpM4LWX+uXylaI4qjR9KjyT752m1+sDZ4YowwhG7j3TK3GXX5rGfic4MLw
	 zDzk6TJPdi+0UpYqBGMBS8SaWv5bIbXumFX/IjSojgmvOv/eyiufPMHTaP36u6zZsa
	 Xmw1AzBxnu2zg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ECAD540429;
	Tue,  3 Mar 2026 17:23:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/5] docs: watchdog: general cleaning and corrections
In-Reply-To: <20260228010402.2389343-1-rdunlap@infradead.org>
References: <20260228010402.2389343-1-rdunlap@infradead.org>
Date: Tue, 03 Mar 2026 10:23:37 -0700
Message-ID: <875x7cddye.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 7C06B1F494A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5051-lists,linux-watchdog=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-watchdog@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,lwn.net:dkim,trenco.lwn.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Randy Dunlap <rdunlap@infradead.org> writes:

> Fix some obvious issues in the watchdog documentation files.
> I didn't try to fix every little niggling mistake.
>
>  [PATCH 1/5] docs: watchdog: mlx-wdt: small fixes
>  [PATCH 2/5] docs: watchdog: pcwd: fix typo and driver info.
>  [PATCH 3/5] docs: watchdog-api: general cleaning
>  [PATCH 4/5] docs: watchdog-kernel-api: general cleanups
>  [PATCH 5/5] docs: watchdog-parameters: add missing watchdog_core parameters
>
>  Documentation/watchdog/mlx-wdt.rst             |    4 -
>  Documentation/watchdog/pcwd-watchdog.rst       |   19 +++++--
>  Documentation/watchdog/watchdog-api.rst        |   38 +++++++--------
>  Documentation/watchdog/watchdog-kernel-api.rst |   20 +++++--
>  Documentation/watchdog/watchdog-parameters.rst |   11 +++-
>  5 files changed, 58 insertions(+), 34 deletions(-)

Wim, do you want to pick these up, or should I take them through the
docs tree?

Thanks,

jon

